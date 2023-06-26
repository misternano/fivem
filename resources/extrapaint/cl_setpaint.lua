RegisterCommand("setpaint", function(source, args)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if IsPedInAnyVehicle(playerPed, false) then
        if args[1] and args[2] then
            local primaryColor = tonumber(args[1])
            local secondaryColor = tonumber(args[2])
            if primaryColor and secondaryColor then
                SetVehicleModKit(vehicle, 0)
                SetVehicleColours(vehicle, primaryColor, secondaryColor)
            else
                exports['swt_notifications']:Icon("Invalid colors. Must be numeric value. (0-255)", "bottom", 7500, "deep-orange-6", "white", false, "mdi-palette")
            end
        else
            exports['swt_notifications']:Icon("Usage: /setpaint [primary] [secondary]", "bottom", 7500, "deep-orange-6", "white", false, "mdi-palette")
        end
    else
        exports['swt_notifications']:Icon("You are not in a vehicle.", "bottom", 7500, "deep-orange-6", "white", false, "mdi-palette")
    end
end)

RegisterCommand("getpaint", function(source, args)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if IsPedInAnyVehicle(playerPed, false) then
        local primaryColor, secondaryColor = GetVehicleColours(vehicle)
        if primaryColor ~= nil and secondaryColor ~= nil then
            exports['swt_notifications']:Icon("Primary: " .. primaryColor .. " | Secondary: " .. secondaryColor, "bottom", 7500, "light-green-7", "white", false, "mdi-palette")
        else
            exports['swt_notifications']:Icon("This vehicle doesn't have a custom paint.", "bottom", 7500, "deep-orange-6", "white", false, "mdi-palette")
        end
    else
        exports['swt_notifications']:Icon("You are not in a vehicle.", "bottom", 7500, "deep-orange-6", "white", false, "mdi-palette")
    end
end)

TriggerEvent("chat:addSuggestion", "/setpaint", "Set the paint of your vehicle by ID.", {{
    name = "primary",
    help = "Primary paint ID."
}, {
    name = "secondary",
    help = "Secondary paint ID."
}})

TriggerEvent("chat:addSuggestion", "/getpaint", "Returns the current primary and secondary paint IDs.")
