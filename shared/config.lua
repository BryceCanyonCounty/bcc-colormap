Config = {
    devMode = false,
    defaultlang = 'ro_lang',

    -- Reapply interval in seconds. Set to 0 to apply once only.
    ReapplyInterval = 60,
    ClearColorsOnStop = false,

    Admin = {
        command = 'colormap',
        -- Uses your existing: add_ace group.admin command allow
        useAce = true,
        acePermission = 'command',
        allowConsole = true,
    },

    ColorOptions = {
        { Label = 'Light Blue', Value = 'BLIP_MODIFIER_MP_COLOR_1' },
        { Label = 'Dark Red', Value = 'BLIP_MODIFIER_MP_COLOR_2' },
        { Label = 'Purple', Value = 'BLIP_MODIFIER_MP_COLOR_3' },
        { Label = 'Orange', Value = 'BLIP_MODIFIER_MP_COLOR_4' },
        { Label = 'Teal', Value = 'BLIP_MODIFIER_MP_COLOR_5' },
        { Label = 'Light Yellow', Value = 'BLIP_MODIFIER_MP_COLOR_6' },
        { Label = 'Pink', Value = 'BLIP_MODIFIER_MP_COLOR_7' },
        { Label = 'Green', Value = 'BLIP_MODIFIER_MP_COLOR_8' },
        { Label = 'Dark Teal', Value = 'BLIP_MODIFIER_MP_COLOR_9' },
        { Label = 'Red', Value = 'BLIP_MODIFIER_MP_COLOR_10' },
        { Label = 'Light Green', Value = 'BLIP_MODIFIER_MP_COLOR_11' },
        { Label = 'Teal 2', Value = 'BLIP_MODIFIER_MP_COLOR_12' },
        { Label = 'Blue', Value = 'BLIP_MODIFIER_MP_COLOR_13' },
        { Label = 'Dark Purple', Value = 'BLIP_MODIFIER_MP_COLOR_14' },
        { Label = 'Dark Pink', Value = 'BLIP_MODIFIER_MP_COLOR_15' },
        { Label = 'Dark Dark Red', Value = 'BLIP_MODIFIER_MP_COLOR_16' },
        { Label = 'Grey', Value = 'BLIP_MODIFIER_MP_COLOR_17' },
        { Label = 'Pinkish', Value = 'BLIP_MODIFIER_MP_COLOR_18' },
        { Label = 'Yellow Green', Value = 'BLIP_MODIFIER_MP_COLOR_19' },
        { Label = 'Dark Green', Value = 'BLIP_MODIFIER_MP_COLOR_20' },
        { Label = 'Bright Blue', Value = 'BLIP_MODIFIER_MP_COLOR_21' },
        { Label = 'Bright Purple', Value = 'BLIP_MODIFIER_MP_COLOR_22' },
        { Label = 'Yellow Orange', Value = 'BLIP_MODIFIER_MP_COLOR_23' },
        { Label = 'Blue 2', Value = 'BLIP_MODIFIER_MP_COLOR_24' },
        { Label = 'Teal 3', Value = 'BLIP_MODIFIER_MP_COLOR_25' },
        { Label = 'Tan', Value = 'BLIP_MODIFIER_MP_COLOR_26' },
        { Label = 'Off White', Value = 'BLIP_MODIFIER_MP_COLOR_27' },
        { Label = 'Light Yellow 2', Value = 'BLIP_MODIFIER_MP_COLOR_28' },
        { Label = 'Light Pink', Value = 'BLIP_MODIFIER_MP_COLOR_29' },
        { Label = 'Light Red', Value = 'BLIP_MODIFIER_MP_COLOR_30' },
        { Label = 'Light Yellow 3', Value = 'BLIP_MODIFIER_MP_COLOR_31' },
        { Label = 'White', Value = 'BLIP_MODIFIER_MP_COLOR_32' },
    },

    ZoneCategories = {
        { Key = 'states', Label = 'States' },
        { Key = 'districts', Label = 'Districts' },
        { Key = 'cities', Label = 'Cities' },
        { Key = 'towns', Label = 'Towns' },
        { Key = 'outlines', Label = 'Outlines' },
        { Key = 'bounty', Label = 'Bounty Regions' },
        { Key = 'camps', Label = 'Camps and Landmarks' },
        { Key = 'guarma', Label = 'Guarma' },
        { Key = 'other', Label = 'Other' },
    },

    -- Active zones copied from [OTHER]/RL_MapColor Config.MapColor_Zones.
    -- Old commented zones are kept hidden with Enabled = false.
    Zones = {
        -- NEW HANOVER
        { Hash = 0x41332496, Color = 'BLIP_MODIFIER_MP_COLOR_6', Name = 'STATE_NEW_HANOVER' },
        { Hash = 0x5CD2A36F, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'LBS_NEW_HANOVER_BOUNTY', Enabled = false },
        { Hash = 0x724E7654, Color = 'BLIP_MODIFIER_MP_COLOR_23', Name = 'DISTRICT_HEARTLAND' },
        { Hash = 0x30FAE29B, Color = 'BLIP_MODIFIER_MP_COLOR_24', Name = 'DISTRICT_ROANOKE_RIDGE' },
        { Hash = 0x717F4A96, Color = 'BLIP_MODIFIER_MP_COLOR_14', Name = 'DISTRICT_CUMBERLAND_FOREST' },
        { Hash = 0x0079B7EE, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_HRT_VALENTINE' },
        { Hash = 0x2A24C8D9, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_VALENTINE' }, -- darker outline color
        { Hash = 0x0A8B2CBE, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_ROA_ANNESBURG' },
        { Hash = 0x9CC09C3D, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_ANNESBURG' }, -- darker outline color
        { Hash = 0x507B5360, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_ROA_VANHORNPOST' },
        { Hash = 0x194E52AF, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_VANHORNPOST' }, -- darker outline color
        { Hash = 0x6E7BDAC4, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_HRT_EMERALDRANCH' },
        { Hash = 0x13A98173, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_EMERALD' }, -- darker outline color
        { Hash = 0xA053D058, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_ROA_BUTCHERCREEK', Enabled = false },
        { Hash = 0xB6831F62, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_BUTCHERCREEK', Enabled = false }, -- darker outline color
        { Hash = 0x7B23B4C7, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_HRT_CORNWALLKEROSENE', Enabled = false },
        { Hash = 0x150D72E9, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_CORNWALLKEROSEN', Enabled = false }, -- darker outline color
        { Hash = 0x1BDD5A12, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_CML_OLDFORTWALLACE', Enabled = false },
        { Hash = 0x2FE84F0E, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_OLD_FORT_WALLACE', Enabled = false }, -- darker outline color

        -- AMBARINO
        { Hash = 0x3B8DD21A, Color = 'BLIP_MODIFIER_MP_COLOR_1', Name = 'STATE_AMBARINO' },
        { Hash = 0x3BBA228A, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'LBS_AMBARINO_BOUNTY', Enabled = false },
        { Hash = 0xD41D039A, Color = 'BLIP_MODIFIER_MP_COLOR_27', Name = 'DISTRICT_GRIZZLIES_WEST' },
        { Hash = 0x943198D3, Color = 'BLIP_MODIFIER_MP_COLOR_6', Name = 'DISTRICT_GRIZZLIES_EAST' },
        { Hash = 0xBB785C8A, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_GRZ_WAPITI', Enabled = false },
        { Hash = 0x4F45BE43, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_WAPITI', Enabled = false }, -- darker outline color

        -- WEST ELIZABETH
        { Hash = 0xD69B5B49, Color = 'BLIP_MODIFIER_MP_COLOR_3', Name = 'STATE_WEST_ELIZABETH' },
        { Hash = 0xF030C0B2, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'LBS_W_ELIZABETH_BOUNTY', Enabled = false },
        { Hash = 0x763A8A87, Color = 'BLIP_MODIFIER_MP_COLOR_15', Name = 'DISTRICT_TALL_TREES' },
        { Hash = 0x8DCC574F, Color = 'BLIP_MODIFIER_MP_COLOR_1', Name = 'DISTRICT_BIG_VALLEY' },
        { Hash = 0x0E95FF51, Color = 'BLIP_MODIFIER_MP_COLOR_27', Name = 'DISTRICT_GREAT_PLAINS' },
        { Hash = 0x5647E155, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_GRT_BLACKWATER' },
        { Hash = 0x129E1411, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_BLACKWATER' }, -- darker outline color
        { Hash = 0x4663EEB9, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_BGV_STRAWBERRY' },
        { Hash = 0x3B4A5D5B, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_STRAWBERRY' }, -- darker outline color

        -- LEMOYNE
        { Hash = 0x945395DF, Color = 'BLIP_MODIFIER_MP_COLOR_5', Name = 'STATE_LEMOYNE' },
        { Hash = 0x0F32B44D, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'LBS_LEMOYNE_BOUNTY', Enabled = false },
        { Hash = 0x0BB92EEF, Color = 'BLIP_MODIFIER_MP_COLOR_13', Name = 'DISTRICT_SCARLETT_MEADOWS' },
        { Hash = 0x024C01CA, Color = 'BLIP_MODIFIER_MP_COLOR_25', Name = 'DISTRICT_BLUEGILL_MARSH' },
        { Hash = 0x2843E325, Color = 'BLIP_MODIFIER_MP_COLOR_5', Name = 'DISTRICT_BAYOU_NWA' },
        { Hash = 0x9652B96E, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_BAY_LAGRAS', Enabled = false },
        { Hash = 0x049BBBD4, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_LAGRAS', Enabled = false }, -- darker outline color
        { Hash = 0x2A6CBBA2, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_BAY_SAINT_DENIS' },
        { Hash = 0xC354EAC2, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_SAINT_DENIS' }, -- darker outline color
        { Hash = 0xD3F2B8A7, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_SCM_RHODES' },
        { Hash = 0x09FAE063, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_RHODES' }, -- darker outline color
        { Hash = 0xD218D90D, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_SCM_CALIGAHALL', Enabled = false },
        { Hash = 0xE074391B, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_CALIGAHALL', Enabled = false }, -- darker outline color
        { Hash = 0xFC531E7A, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_SCM_BRAITHWAITEMANOR', Enabled = false },
        { Hash = 0x5E68036B, Color = 'BLIP_MODIFIER_MP_COLOR_20', Name = 'OUTLINE_BRAITHWAITEMANOR', Enabled = false }, -- darker outline color

        -- OTHER
        { Hash = 0x2D1A7AF2, Color = 'BLIP_MODIFIER_MP_COLOR_10', Name = 'REGION_BLU_SISIKA' },

        -- NEW AUSTIN
        { Hash = 0x41759831, Color = 'BLIP_MODIFIER_MP_COLOR_14', Name = 'STATE_NEW_AUSTIN' },
        { Hash = 0xD339F6AB, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'LBS_NEW_AUSTIN_BOUNTY', Enabled = false },
        { Hash = 0x3AC128F9, Color = 'BLIP_MODIFIER_MP_COLOR_26', Name = 'DISTRICT_GAPTOOTH_RIDGE' },
        { Hash = 0xD428627B, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'DISTRICT_RIO_BRAVO' },
        { Hash = 0x99B6A1E6, Color = 'BLIP_MODIFIER_MP_COLOR_28', Name = 'DISTRICT_CHOLLA_SPRINGS' },
        { Hash = 0x33D88587, Color = 'BLIP_MODIFIER_MP_COLOR_14', Name = 'DISTRICT_HENNIGANS_STEAD' },

        -- GUARMA
        { Hash = 0x9307FD41, Color = 'BLIP_MODIFIER_MP_COLOR_13', Name = 'STATE_GUARMA' },
        { Hash = 0x6009F334, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'LBS_GUARMA_BOUNTY', Enabled = false },
        { Hash = 0x95B1E77A, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'REGION_GUA_AGUASDULCES_1', Enabled = false },
        { Hash = 0x90CA4AF8, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'OUTLINE_AGUSDULCES_1', Enabled = false }, -- darker outline color
        { Hash = 0x6E10D212, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'REGION_GUA_VILLAGE', Enabled = false },
        { Hash = 0x21FE6ED8, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'OUTLINE_GUA_VILLAGE', Enabled = false }, -- darker outline color
        { Hash = 0xBBB91AAD, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'REGION_GUA_AGUASDULCES_2', Enabled = false },
        { Hash = 0x46837F42, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'OUTLINE_AGUSDULCES_2', Enabled = false }, -- darker outline color
        { Hash = 0xC1C68746, Color = 'BLIP_MODIFIER_MP_COLOR_2', Name = 'REGION_GUA_MANICATO', Enabled = false },
        { Hash = 0x703A27B1, Color = 'BLIP_MODIFIER_MP_COLOR_17', Name = 'OUTLINE_GUA_MANICATO', Enabled = false }, -- darker outline color
    },
}
