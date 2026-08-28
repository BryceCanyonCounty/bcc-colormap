local appliedZones = {}
local activeZones = Config.Zones

local function isZoneEnabled(zone)
    return zone.Enabled ~= false
end

function SetConfiguredZoneColors(zones)
    activeZones = zones or Config.Zones
end

function ApplyConfiguredZoneColors()
    for _, zone in ipairs(activeZones) do
        if isZoneEnabled(zone) and zone.Hash and zone.Color then
            Citizen.InvokeNative(0x6786D7AFAC3162B3, zone.Hash)
            Citizen.InvokeNative(0x563FCB6620523917, zone.Hash, joaat(zone.Color))
            appliedZones[zone.Hash] = true
            devPrint('Applied', zone.Name or zone.Hash, zone.Color)
        end
    end

    devPrint(_('zones_applied'))
end

function ClearConfiguredZoneColors()
    for _, zone in ipairs(Config.Zones) do
        if zone.Hash then
            Citizen.InvokeNative(0x6786D7AFAC3162B3, zone.Hash)
        end
    end

    for _, zone in ipairs(activeZones) do
        if zone.Hash then
            Citizen.InvokeNative(0x6786D7AFAC3162B3, zone.Hash)
        end
    end

    for zoneHash in pairs(appliedZones) do
        Citizen.InvokeNative(0x6786D7AFAC3162B3, zoneHash)
    end

    appliedZones = {}
    devPrint(_('zones_cleared'))
end
