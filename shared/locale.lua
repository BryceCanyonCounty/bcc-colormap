Locales = {}

local translationCache = {}

function _(str, ...)
    if translationCache[str] then
        if select('#', ...) > 0 then
            local ok, out = pcall(string.format, translationCache[str], ...)
            if ok then return out end
        end
        return translationCache[str]
    end

    local lang = Config.defaultlang
    local defaultLang = 'en_lang'

    if Locales[lang] and Locales[lang][str] then
        translationCache[str] = Locales[lang][str]
    elseif Locales[defaultLang] and Locales[defaultLang][str] then
        translationCache[str] = Locales[defaultLang][str]
    else
        return 'Translation [' .. tostring(lang) .. '][' .. tostring(str) .. '] does not exist'
    end

    if select('#', ...) > 0 then
        local ok, out = pcall(string.format, translationCache[str], ...)
        if ok then return out end
    end

    return translationCache[str]
end

function _U(str, ...)
    local translation = _(str, ...)
    return translation:sub(1, 1):upper() .. translation:sub(2)
end
