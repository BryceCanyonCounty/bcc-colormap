CreateThread(function()
    -- Apply config defaults immediately so the map still colors if DB/RPC is unavailable.
    ClearConfiguredZoneColors()
    ApplyConfiguredZoneColors()

    local ok, zones = BccUtils.RPC:CallAsync('bcc-colormap:GetZones', {})
    if ok and zones then
        SetConfiguredZoneColors(zones)
        ClearConfiguredZoneColors()
        ApplyConfiguredZoneColors()
    end

    if Config.ReapplyInterval and Config.ReapplyInterval > 0 then
        while true do
            Wait(Config.ReapplyInterval * 1000)
            ApplyConfiguredZoneColors()
        end
    end
end)

BccUtils.RPC:Register('bcc-colormap:ApplyZones', function(params)
    SetConfiguredZoneColors(params and params.zones or nil)
    ClearConfiguredZoneColors()
    ApplyConfiguredZoneColors()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if not Config.ClearColorsOnStop then return end

    ClearConfiguredZoneColors()
end)
