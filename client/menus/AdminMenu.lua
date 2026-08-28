FeatherMenu = exports['feather-menu'].initiate()

local function registerMenu(id, height)
    return FeatherMenu:RegisterMenu(id .. ':' .. tostring(GetGameTimer()), {
        top = '3%',
        left = '3%',
        ['720width'] = '420px',
        ['1080width'] = '520px',
        ['2kwidth'] = '620px',
        ['4kwidth'] = '820px',
        style = {},
        contentslot = {
            style = {
                ['height'] = height or '560px',
                ['min-height'] = '420px'
            }
        },
        draggable = true,
        canclose = true,
    })
end

local function addHeader(page, title, subtitle)
    page:RegisterElement('header', {
        value = title,
        slot = 'header',
        style = { ['color'] = '#d4b06a' }
    })

    if subtitle then
        page:RegisterElement('subheader', {
            value = subtitle,
            slot = 'header',
            style = { ['color'] = '#E0E0E0', ['font-size'] = '16px' }
        })
    end

    page:RegisterElement('line', { slot = 'header', style = {} })
end

local function colorOptions()
    local options = {}
    for _, color in ipairs(Config.ColorOptions) do
        options[#options + 1] = {
            display = color.Label,
            value = color.Value,
        }
    end

    return options
end

local function colorStart(color)
    for index, option in ipairs(Config.ColorOptions) do
        if option.Value == color then
            return index
        end
    end

    return 1
end

local function zoneLabel(zone)
    local state = zone.Enabled and 'On' or 'Off'
    return ('%s [%s]'):format(zone.Name or zone.HashKey, state)
end

local function categoryLabel(categoryKey)
    for _, category in ipairs(Config.ZoneCategories) do
        if category.Key == categoryKey then
            return category.Label
        end
    end

    return categoryKey
end

local function countZonesByCategory(zones)
    local counts = {}
    for _, zone in ipairs(zones) do
        local category = zone.Category or 'other'
        counts[category] = (counts[category] or 0) + 1
    end

    return counts
end

local function zonesForCategory(zones, categoryKey)
    local filtered = {}
    for _, zone in ipairs(zones) do
        if (zone.Category or 'other') == categoryKey then
            filtered[#filtered + 1] = zone
        end
    end

    return filtered
end

local function openZoneEditor(zone, categoryKey)
    local menu = registerMenu('bcc-colormap:zone', '500px')
    local page = menu:RegisterPage('bcc-colormap:zone:edit')
    addHeader(page, zone.Name or zone.HashKey, categoryLabel(categoryKey) .. ' - ' .. zone.HashKey)

    local selectedColor = zone.Color
    local enabled = zone.Enabled == true

    page:RegisterElement('checkbox', {
        label = 'Enabled',
        start = enabled,
        style = {}
    }, function(data)
        enabled = data.value == true
    end)

    page:RegisterElement('arrows', {
        label = 'Color',
        start = colorStart(selectedColor),
        options = colorOptions(),
        persist = true,
        style = {}
    }, function(data)
        selectedColor = data.value.value
    end)

    page:RegisterElement('line', { slot = 'footer', style = {} })
    page:RegisterElement('button', {
        label = 'Save',
        slot = 'footer',
        style = {}
    }, function()
        BccUtils.RPC:CallAsync('bcc-colormap:UpdateZone', {
            HashKey = zone.HashKey,
            Color = selectedColor,
            Enabled = enabled,
        })
        menu:Close()
        OpenColormapCategoryMenu(categoryKey)
    end)
    page:RegisterElement('button', {
        label = 'Back',
        slot = 'footer',
        style = {}
    }, function()
        menu:Close()
        OpenColormapCategoryMenu(categoryKey)
    end)
    page:RegisterElement('button', {
        label = 'Close',
        slot = 'footer',
        style = {}
    }, function()
        menu:Close()
    end)
    page:RegisterElement('bottomline', { slot = 'footer', style = {} })

    menu:Open({ startupPage = page })
end

function OpenColormapCategoryMenu(categoryKey)
    local ok, zones = BccUtils.RPC:CallAsync('bcc-colormap:GetZones', {})
    if not ok or not zones then return end

    local menu = registerMenu('bcc-colormap:category', '620px')
    local page = menu:RegisterPage('bcc-colormap:category:main')
    addHeader(page, categoryLabel(categoryKey), 'Edit map zone colors')

    for _, zone in ipairs(zonesForCategory(zones, categoryKey)) do
        page:RegisterElement('button', {
            label = zoneLabel(zone),
            style = {}
        }, function()
            menu:Close()
            openZoneEditor(zone, categoryKey)
        end)
    end

    page:RegisterElement('line', { slot = 'footer', style = {} })
    page:RegisterElement('button', {
        label = 'Back',
        slot = 'footer',
        style = {}
    }, function()
        menu:Close()
        OpenColormapAdminMenu()
    end)
    page:RegisterElement('button', {
        label = 'Close',
        slot = 'footer',
        style = {}
    }, function()
        menu:Close()
    end)
    page:RegisterElement('bottomline', { slot = 'footer', style = {} })

    menu:Open({ startupPage = page })
end

function OpenColormapAdminMenu()
    local ok, zones = BccUtils.RPC:CallAsync('bcc-colormap:GetZones', {})
    if not ok or not zones then return end

    local menu = registerMenu('bcc-colormap:admin', '620px')
    local page = menu:RegisterPage('bcc-colormap:admin:main')
    addHeader(page, 'Colormap', 'Choose a zone category')

    local counts = countZonesByCategory(zones)
    for _, category in ipairs(Config.ZoneCategories) do
        local count = counts[category.Key] or 0
        if count > 0 then
            page:RegisterElement('button', {
                label = ('%s [%s]'):format(category.Label, count),
                style = {}
            }, function()
                menu:Close()
                OpenColormapCategoryMenu(category.Key)
            end)
        end
    end

    page:RegisterElement('line', { slot = 'footer', style = {} })
    page:RegisterElement('button', {
        label = 'Reset Defaults',
        slot = 'footer',
        style = {}
    }, function()
        BccUtils.RPC:CallAsync('bcc-colormap:ResetZones', {})
        menu:Close()
        OpenColormapAdminMenu()
    end)
    page:RegisterElement('button', {
        label = 'Close',
        slot = 'footer',
        style = {}
    }, function()
        menu:Close()
    end)
    page:RegisterElement('bottomline', { slot = 'footer', style = {} })

    menu:Open({ startupPage = page })
end

BccUtils.RPC:Register('bcc-colormap:OpenAdminMenu', function()
    OpenColormapAdminMenu()
end)
