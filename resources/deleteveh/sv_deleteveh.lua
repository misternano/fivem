RegisterCommand('dv', function(source, args, rawCommand)
    TriggerClientEvent('deleteVehicle', source)
    CancelEvent()
end)

RegisterCommand('delveh', function(source, args, rawCommand)
    TriggerClientEvent('deleteVehicle', source)
    CancelEvent()
end)

RegisterNetEvent('deleteVehicle')
AddEventHandler('deleteVehicle', function()
end)
