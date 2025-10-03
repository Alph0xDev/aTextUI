fx_version 'cerulean'
game 'gta5'

author 'Alph0xDev'
description 'TextUI Script'
version '1.0.0'

ui_page 'html/index.html'

shared_script 'shared.lua'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/sound.mp3',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}