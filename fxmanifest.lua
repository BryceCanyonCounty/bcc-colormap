fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
version '1.0.0'
author 'BCC Scripts'
description 'Configurable RedM map region colors'

client_scripts {
   'client/services/*.lua',
   'client/menus/*.lua',
   'client/main.lua',
}

server_scripts {
   '@oxmysql/lib/MySQL.lua',
   'server/api-loader.lua',
   'server/helpers/*.lua',
   'server/services/*.lua',
   'server/main.lua',
}

shared_scripts {
   'shared/api-loader.lua',
   'shared/config.lua',
   'shared/locale.lua',
   'languages/*.lua',
   'shared/helpers/*.lua',
}

dependencies {
   'bcc-utils',
   'feather-menu',
   'oxmysql',
}
