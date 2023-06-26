RegisterNetEvent('wk:deleteVehicle')

local distanceToCheck = 5.0

AddEventHandler('wk:deleteVehicle', function()
    local ped = PlayerPedId()
    if DoesEntityExist(ped) and not IsEntityDead(ped) then
        local pos = GetEntityCoords(ped)
        if IsPedSittingInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        else
            local playerPos = GetEntityCoords(ped)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
            if DoesEntityExist(vehicle) then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        end
    end
end)

function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = StartShapeTestRay(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end
