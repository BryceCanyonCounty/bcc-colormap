local function waitForDatabase()
    while not IsColormapDatabaseReady() do
        Wait(100)
    end
end

local function broadcastZones()
    waitForDatabase()
    BccUtils.RPC:Notify('bcc-colormap:ApplyZones', {
        zones = GetColormapZones(),
    }, -1)
end

BccUtils.RPC:Register('bcc-colormap:GetZones', function(_, cb)
    waitForDatabase()
    cb(true, GetColormapZones())
end)

BccUtils.RPC:Register('bcc-colormap:UpdateZone', function(params, cb, src)
    if not IsColormapAdmin(src) then
        cb(false, 'not_allowed')
        return
    end

    if not params or not params.HashKey or not params.Color then
        cb(false, 'bad_payload')
        return
    end

    waitForDatabase()
    local ok, err = UpdateColormapZone(params.HashKey, params.Color, params.Enabled == true)
    if ok then
        broadcastZones()
    end

    cb(ok, err)
end)

BccUtils.RPC:Register('bcc-colormap:ResetZones', function(_, cb, src)
    if not IsColormapAdmin(src) then
        cb(false, 'not_allowed')
        return
    end

    waitForDatabase()
    ResetColormapZones()
    broadcastZones()
    cb(true)
end)

BccUtils.RPC:Register('bcc-colormap:CanAdmin', function(_, cb, src)
    cb(IsColormapAdmin(src))
end)

RegisterCommand(Config.Admin.command, function(source)
    if source == 0 then
        print('[bcc-colormap] Admin menu can only be opened in-game.')
        return
    end

    if not IsColormapAdmin(source) then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            args = { 'bcc-colormap', 'You do not have permission to use this command.' }
        })
        return
    end

    BccUtils.RPC:Notify('bcc-colormap:OpenAdminMenu', {}, source)
end, false)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    CreateThread(function()
        waitForDatabase()
        Wait(1000)
        broadcastZones()
    end)
end)
