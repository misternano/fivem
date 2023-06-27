fx_version "cerulean"
game "gta5"

author "nano"
name "Extra Vehicle Paints"
description "Extra vehicle paints, all extended and enhanced edition paints."
version "1.0.0"

files {
    "data/carcols_gen9.meta",
    "data/carmodcols_gen9.meta"
}

data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"

client_script {
    "paint_names.lua",
    "cl_setpaint.lua"
}
