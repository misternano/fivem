fx_version "cerulean"
game "gta5"

author "nano"
name "Seatbelt"
description "Seatbelt and seatbelt notification."
version "v2.0.9"

client_script {
    "client.lua"
}

server_script {
    "server.lua"
}

ui_page {
    "html/ui.html"
}

files {
    "html/*",
    "img/seatbelt.png",
    "html/index.html",
    "html/sounds/buckle.ogg",
    "html/sounds/chimes.ogg",
    "html/sounds/seatbelt.ogg",
    "html/sounds/unbuckle.ogg"
}
