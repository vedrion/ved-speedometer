fx_version 'cerulean'
games { 'gta5' }

author 'Ved'
description 'Customizable Speedometer script for FiveM'
version '1.1.0'

-- GitHub: https://github.com/vedrion
-- Website: https://ved.tebex.io/

client_script 'config.lua'
client_script 'client/main.lua'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/styles/style.css',
    'ui/scripts/script.js'
}

lua54 'yes'
