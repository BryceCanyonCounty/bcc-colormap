DBG = BccUtils.Debug:Get('bcc-colormap', Config.devMode)

if DBG and Config.devMode then
    DBG:Enable()
end

function devPrint(...)
    if not DBG or not Config.devMode then return end

    DBG:Info(...)
end
