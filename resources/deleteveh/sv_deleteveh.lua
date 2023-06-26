RegisterCommand('dv', function(source, args, rawCommand)
    TriggerClientEvent('wk:deleteVehicle', source)
    CancelEvent()
end)

RegisterCommand('delveh', function(source, args, rawCommand)
    TriggerClientEvent('wk:deleteVehicle', source)
    CancelEvent()
end)

RegisterNetEvent('wk:deleteVehicle')
AddEventHandler('wk:deleteVehicle', function()
end)
