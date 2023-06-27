RegisterNetEvent("SendNoti")
AddEventHandler("SendNoti", function(color)
    local colors = color
    TriggerClientEvent("GetNoti", -1, source, colors)
end)

RegisterServerEvent('PlayOnSource')
AddEventHandler('PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('PlayOnOne', source, soundFile, soundVolume)
end)
