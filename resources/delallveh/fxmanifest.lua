fx_version "cerulean"
game "gta5"

author "nano"
contributors {
    "Whit3Xlightning",
    "IllidanS4"
}
name "Delete all Vehicles"
description "Delete all vehicles from the server."
version "1.0.0"

server_script {
    "sv_delallveh.lua"
}

client_scripts {
    "cl_delallveh.lua",
    "entityiter.lua"
}
