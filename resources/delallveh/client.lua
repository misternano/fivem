RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function()
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            SetVehicleHasBeenOwnedByPlayer(vehicle, false)
            SetEntityAsMissionEntity(vehicle, false, false)
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then
                DeleteVehicle(vehicle)
            else
                exports['swt_notifications']:Icon("Deleted all vehicles.", "bottom", 2000, "light-green-7", "white", false, "mdi-check-all")
            end
        end
    end
end)
