local SETTINGS = {
    back_bone = 24818,
    x = 0.02,
    y = 0.22,
    z = -0.01,
    x_rotation = 165.0,
    y_rotation = 160.0,
    z_rotation = 0.0,

    compatible_weapon_hashes = {
        ["w_me_bat"] = GetHashKey("WEAPON_BAT"),
        ["w_me_gclub"] = GetHashKey("WEAPON_GOLFCLUB"),
        ["w_me_poolcue"] = GetHashKey("WEAPON_POOLCUE"),
        ["w_am_jerrycan"] = GetHashKey("WEAPON_PETROLCAN"),
        ["w_me_machette_lr"] = GetHashKey("WEAPON_MACHETE"),
        ["w_sb_smg"] = GetHashKey("WEAPON_SMG"),
        ["w_sb_assaultsmg"] = GetHashKey("WEAPON_ASSAULTSMG"),
        ["w_sb_pdw"] = GetHashKey("WEAPON_COMBATPDW"),
        ["w_sb_gusenberg"] = GetHashKey("WEAPON_GUSENBERG"),
        ["w_sg_pumpshotgun"] = GetHashKey("WEAPON_PUMPSHOTGUN"),
        ["w_sg_pumpshotgunmk2"] = GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),
        ["w_sg_assaultshotgun"] = GetHashKey("WEAPON_ASSAULTSHOTGUN"),
        ["w_sg_bullpupshotgun"] = GetHashKey("WEAPON_BULLPUPSHOTGUN"),
        ["w_sg_heavyshotgun"] = GetHashKey("WEAPON_HEAVYSHOTGUN"),
        ["w_sg_pumpshotgunh4"] = GetHashKey("WEAPON_COMBATSHOTGUN"),
        ["w_mg_mg"] = GetHashKey("WEAPON_MG"),
        ["w_mg_combatmg"] = GetHashKey("WEAPON_COMBATMG"),
        ["w_mg_combatmgmk2"] = GetHashKey("WEAPON_COMBATMG_MK2"),
        ["w_mg_minigun"] = GetHashKey("WEAPON_MINIGUN"),
        ["w_ar_musket"] = GetHashKey("WEAPON_MUSKET"),
        ["w_ar_assaultrifle"] = GetHashKey("WEAPON_ASSAULTRIFLE"),
        ["w_ar_carbinerifle"] = GetHashKey("WEAPON_CARBINERIFLE"),
        ["w_ar_advancedrifle"] = GetHashKey("WEAPON_ADVANCEDRIFLE"),
        ["w_ar_specialcarbine"] = GetHashKey("WEAPON_SPECIALCARBINE"),
        ["w_ar_bullpuprifle"] = GetHashKey("WEAPON_BULLPUPRIFLE"),
        ["w_ar_bullpuprifleh4"] = GetHashKey("WEAPON_MILITARYRIFLE"),
        ["w_ar_heavyrifleh"] = GetHashKey("WEAPON_HEAVYRIFLE"),
        -- ["w_ar_tacticalrifle"] = GetHashKey("WEAPON_TACTICALRIFLE"), -- ???
        ["w_ar_railgun"] = GetHashKey("WEAPON_RAILGUN"),
        ["w_sr_sniperrifle"] = GetHashKey("WEAPON_SNIPERRIFLE"),
        ["w_sr_heavysniper"] = GetHashKey("WEAPON_HEAVYSNIPER"),
        ["w_sr_marksmanrifle"] = GetHashKey("WEAPON_MARKSMANRIFLE"),
        -- ["w_sr_precisionrifle"] = GetHashKey("WEAPON_PRECISIONRIFLE"), -- ???
        ["w_lr_firework"] = GetHashKey("WEAPON_FIREWORK"),
        ["w_lr_rpg"] = GetHashKey("WEAPON_RPG"),
        ["w_lr_homing"] = GetHashKey("WEAPON_HOMINGLAUNCHER"),
        ["w_lr_grenadelauncher"] = GetHashKey("WEAPON_GRENADELAUNCHER")
    }
}

local attached_weapons = {}

Citizen.CreateThread(function()
    while true do
        local me = GetPlayerPed(-1)
        for wep_name, wep_hash in pairs(SETTINGS.compatible_weapon_hashes) do
            if HasPedGotWeapon(me, wep_hash, false) then
                if not attached_weapons[wep_name] then
                    AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation, isMeleeWeapon(wep_name))
                end
            end
        end
        -- remove from back if equipped / dropped
        for name, attached_object in pairs(attached_weapons) do
            -- equipped? delete it from back
            if GetSelectedPedWeapon(me) == attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
                DeleteObject(attached_object.handle)
                attached_weapons[name] = nil
            end
        end
        Wait(0)
    end
end)

function AttachWeapon(attachModel, modelHash, boneNumber, x, y, z, xR, yR, zR, isMelee)
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Wait(100)
    end

    attached_weapons[attachModel] = {
        hash = modelHash,
        handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
    }

    if isMelee then
        x = 0.25
        y = -0.14
        z = -0.1
        xR = 120.0
        yR = 182.0
        zR = 92.0
    end
    if attachModel == "w_am_jerrycan" then
        y = -0.2
        x = -0.005
        z = 0.0
        xR = 0.0
        yR = 90.0
        zR = 0.0
    end
    if attachModel == "w_me_machette_lr" then
        boneNumber = 11816
        y = -0.15
        x = -0.25
        z = -0.22
        xR = 0.0
        yR = 0.0
        zR = 0.0
    end
    AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end

function isMeleeWeapon(wep_name)
    if wep_name == "w_me_gclub" or "w_me_bat" or "w_me_poolcue" then
        return true
    else
        return false
    end
end
