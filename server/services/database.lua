local databaseReady = false
local zoneCache = {}

local function encodeDefaultZone(zone, index)
    return {
        hash = NormalizeZoneHash(zone.Hash),
        name = zone.Name or NormalizeZoneHash(zone.Hash),
        color = zone.Color,
        enabled = zone.Enabled ~= false and 1 or 0,
        category = zone.Category or GetColormapZoneCategory(zone),
        sortOrder = index,
    }
end

local function dbBool(value)
    if value == true or value == 1 or value == '1' then
        return true
    end

    return false
end

local function ensureColumn(tableName, columnName, definition)
    local rows = MySQL.query.await([[
        SELECT COUNT(*) AS count
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME = ?
          AND COLUMN_NAME = ?
    ]], { tableName, columnName }) or {}

    local exists = tonumber(rows[1] and rows[1].count or 0) > 0
    if exists then return false end

    MySQL.query.await(('ALTER TABLE `%s` ADD COLUMN `%s` %s'):format(tableName, columnName, definition))
    return true
end

local function syncZoneMetadata()
    for index, zone in ipairs(Config.Zones) do
        local row = encodeDefaultZone(zone, index)
        MySQL.update.await([[
            UPDATE `bcc_colormap_zones`
            SET `name` = ?, `category` = ?, `sort_order` = ?
            WHERE `zone_hash` = ?
        ]], { row.name, row.category, row.sortOrder, row.hash })
    end
end

function InitializeColormapDatabase()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `bcc_colormap_zones` (
            `zone_hash` VARCHAR(16) NOT NULL,
            `name` VARCHAR(100) NOT NULL,
            `color` VARCHAR(64) NOT NULL,
            `enabled` TINYINT(1) NOT NULL DEFAULT 1,
            `category` VARCHAR(32) NOT NULL DEFAULT 'other',
            `sort_order` INT NOT NULL DEFAULT 0,
            `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`zone_hash`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    ]])

    local categoryColumnAdded = ensureColumn('bcc_colormap_zones', 'category', "VARCHAR(32) NOT NULL DEFAULT 'other' AFTER `enabled`")

    local countRows = MySQL.query.await('SELECT COUNT(*) AS count FROM `bcc_colormap_zones`') or {}
    local zoneCount = tonumber(countRows[1] and countRows[1].count or 0) or 0

    local seededDefaults = false
    if zoneCount == 0 then
        for index, zone in ipairs(Config.Zones) do
            local row = encodeDefaultZone(zone, index)
            MySQL.insert.await([[
                INSERT INTO `bcc_colormap_zones`
                    (`zone_hash`, `name`, `color`, `enabled`, `category`, `sort_order`)
                VALUES (?, ?, ?, ?, ?, ?)
            ]], { row.hash, row.name, row.color, row.enabled, row.category, row.sortOrder })
        end

        seededDefaults = true
        if DBG then DBG:Info('Colormap database seeded from config') end
    end

    if categoryColumnAdded or seededDefaults then
        syncZoneMetadata()
    end
    LoadColormapZoneCache()
    databaseReady = true
    if DBG then DBG:Info('Colormap database initialized') end
end

function IsColormapDatabaseReady()
    return databaseReady
end

function GetColormapZones()
    return zoneCache
end

function LoadColormapZoneCache()
    local rows = MySQL.query.await([[
        SELECT `zone_hash`, `name`, `color`, `enabled`, `category`, `sort_order`
        FROM `bcc_colormap_zones`
        ORDER BY `sort_order`, `name`
    ]]) or {}

    local zones = {}
    for _, row in ipairs(rows) do
        zones[#zones + 1] = {
            Hash = ZoneHashToNumber(row.zone_hash),
            HashKey = row.zone_hash,
            Name = row.name,
            Color = row.color,
            Enabled = dbBool(row.enabled),
            Category = row.category or 'other',
            SortOrder = tonumber(row.sort_order) or 0,
        }
    end

    zoneCache = zones
    return zoneCache
end

function UpdateColormapZone(hash, color, enabled)
    if not IsValidColormapColor(color) then
        return false, 'invalid_color'
    end

    local zoneHash = NormalizeZoneHash(hash)
    local affected = MySQL.update.await([[
        UPDATE `bcc_colormap_zones`
        SET `color` = ?, `enabled` = ?
        WHERE `zone_hash` = ?
    ]], { color, enabled and 1 or 0, zoneHash })

    if not affected or affected < 1 then
        return false, 'zone_not_found'
    end

    for _, zone in ipairs(zoneCache) do
        if zone.HashKey == zoneHash then
            zone.Color = color
            zone.Enabled = enabled == true
            break
        end
    end

    return true
end

function ResetColormapZones()
    MySQL.query.await('DELETE FROM `bcc_colormap_zones`')

    for index, zone in ipairs(Config.Zones) do
        local row = encodeDefaultZone(zone, index)
        MySQL.insert.await([[
            INSERT INTO `bcc_colormap_zones`
                (`zone_hash`, `name`, `color`, `enabled`, `category`, `sort_order`)
            VALUES (?, ?, ?, ?, ?, ?)
        ]], { row.hash, row.name, row.color, row.enabled, row.category, row.sortOrder })
    end

    LoadColormapZoneCache()
    return true
end
