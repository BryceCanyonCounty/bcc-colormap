function IsColormapAdmin(src)
    if src == 0 then
        return Config.Admin.allowConsole == true
    end

    if Config.Admin.useAce then
        return IsPlayerAceAllowed(src, Config.Admin.acePermission)
    end

    return true
end

function NormalizeZoneHash(hash)
    if type(hash) == 'number' then
        return ('0x%08X'):format(hash)
    end

    local value = tostring(hash or ''):upper()
    if value:sub(1, 2) ~= '0X' then
        value = '0X' .. value
    end

    return value:gsub('0X', '0x', 1)
end

function ZoneHashToNumber(hash)
    if type(hash) == 'number' then return hash end

    local value = tostring(hash or '')
    value = value:gsub('^0x', ''):gsub('^0X', '')
    return tonumber(value, 16)
end

function IsValidColormapColor(color)
    for _, option in ipairs(Config.ColorOptions) do
        if option.Value == color then
            return true
        end
    end

    return false
end

function GetColormapZoneCategory(zone)
    local name = tostring(zone.Name or ''):upper()

    if name:find('^STATE_') then return 'states' end
    if name:find('^DISTRICT_') then return 'districts' end
    if name:find('^OUTLINE_') then return 'outlines' end
    if name:find('^LBS_') then return 'bounty' end
    if name:find('_GUA_') or name:find('GUARMA') then return 'guarma' end

    if name:find('SAINT_DENIS') then return 'cities' end
    if name:find('BLACKWATER') then return 'cities' end

    if name:find('VALENTINE')
        or name:find('ANNESBURG')
        or name:find('VANHORN')
        or name:find('EMERALD')
        or name:find('STRAWBERRY')
        or name:find('RHODES')
        or name:find('LAGRAS')
    then
        return 'towns'
    end

    if name:find('WAPITI')
        or name:find('BUTCHERCREEK')
        or name:find('CORNWALL')
        or name:find('FORT')
        or name:find('BRAITHWAITE')
        or name:find('CALIGAHALL')
        or name:find('SISIKA')
    then
        return 'camps'
    end

    return 'other'
end
