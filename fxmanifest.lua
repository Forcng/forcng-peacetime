fx_version 'cerulean'
games { 'gta5' }
author 'Forcng'
description 'Forcng - Peacetime Script'

lua54 'yes'

client_scripts {
    'source/client/*.lua',
}

server_scripts {
    'source/server/*.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/main.js'
}
