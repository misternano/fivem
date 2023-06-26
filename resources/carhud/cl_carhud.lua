-- Cruise Control and Engine Code wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- SeatBelt code wrote by All_Sor (https://forum.fivem.net/u/all_sor) and IndianaBonesUrMom (https://github.com/IndianaBonesUrMom/fivem-seatbelt)
-- Heli and Plane HUD wrote and made by TheMrDeivid
-- Please do not steal or sell this script, if you want to use it or modify it, first of all contact me then just give some type of credit!
-- ################################### --
--									   --
--        C   O   N   F   I   G        --
--									   --
-- ################################### --
local HUD = {
    Speed = 'mph', -- kmh or mph
    SpeedIndicator = true,
    Top = false, -- ALL TOP PANAL ( oil, dsc, plate, fluid, ac )
    Plate = true, -- Only if Top is false and you want to keep Plate Number
    Engine = true,
    CarGears = false
}

local HUDPlane = {
    PlaneSpeed = true,
    Panel = true
}

-- Base Coords
local UI = {
    x = 0.000,
    y = 0.000
}

-- ################################### --
--									   --
--             C   O   D   E           --
--									   --
-- ################################### --

IsCar = function(veh)
    local vc = GetVehicleClass(veh)
    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

Fwv = function(entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then
        hr = 360.0 + hr
    end
    hr = hr * 0.0174533
    return {
        x = math.cos(hr) * 2.0,
        y = math.sin(hr) * 2.0
    }
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local MyPed = GetPlayerPed(-1)
        local PedHeli = IsPedInAnyHeli(MyPed)
        local PedPlane = IsPedInAnyPlane(MyPed)
        local PedBoat = IsPedInAnyBoat(MyPed)
        local PedBike = IsPedOnAnyBike(MyPed)
        if (IsPedInAnyVehicle(MyPed, false)) then
            local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)
            local VehStopped = IsVehicleStopped(MyPedVeh)
            local VehEngineHP = GetVehicleEngineHealth(MyPedVeh)
            local VehBurnout = IsVehicleInBurnout(MyPedVeh)
            local Gear = GetVehicleCurrentGear(MyPedVeh) -- Check the current gear of the vehicle
            local Height = GetEntityHeightAboveGround(MyPedVeh) -- Check the height above the ground
            local Roll = GetEntityRoll(MyPedVeh) -- Check the roll of the plane
            local Pitch = GetEntityPitch(MyPedVeh) -- Check the pitch of the plane
            local MainRotor = GetHeliMainRotorHealth(MyPedVeh) -- Check the Main Rotor of the heli
            local TailRotor = GetHeliTailRotorHealth(MyPedVeh) -- Check the Tail Rotor of the heli
            local EngineRunning = Citizen.InvokeNative(0xAE31E7DF9B5B132E, MyPedVeh) -- Check if the engine is running
            local LandingGear0 = Citizen.InvokeNative(0x9B0F3DCA3DB0F4CD, MyPedVeh, 0) -- Check the state of the landing gear

            --  ####         	 AIRCRAFT HUD	  	  	  ####  --
            if PedPlane then
                if HUDPlane.PlaneSpeed then
                    drawRct(UI.x + 0.11, UI.y + 0.932, 0.046, 0.03, 0, 0, 0, 150)
                    Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
                    drawTxt(UI.x + 0.61, UI.y + 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
                    drawTxt(UI.x + 0.633, UI.y + 1.432, 1.0, 1.0, 0.4, "~w~ knots", 255, 255, 255, 255)
                else
                    speed = 0.0
                end

                if HUDPlane.Panel then
                    drawTxt(UI.x + 0.6075, UI.y + 1.265, 1.0, 1.0, 0.44, "Roll: " .. math.ceil(Roll), 255, 255, 255, 200)
                    drawTxt(UI.x + 0.570, UI.y + 1.265, 1.0, 1.0, 0.44, "Pitch: " .. math.ceil(Pitch), 255, 255, 255, 200)
                    drawTxt(UI.x + 0.515, UI.y + 1.265, 1.0, 1.0, 0.44, "Altitude: " .. math.ceil(Height), 255, 255, 255, 200)
                    if LandingGear0 then
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Landing Gear", 150, 150, 150, 200) -- Red
                    else
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Landing Gear", 0, 255, 0, 200) -- Green
                    end

                    if EngineRunning then
                        drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 0, 255, 0, 200) -- Green
                    else
                        drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 255, 0, 0, 200) -- Red
                    end
                end
            end

            if PedHeli then
                if HUDPlane.PlaneSpeed then
                    drawRct(UI.x + 0.11, UI.y + 0.932, 0.046, 0.03, 0, 0, 0, 150)
                    Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
                    drawTxt(UI.x + 0.61, UI.y + 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
                    drawTxt(UI.x + 0.633, UI.y + 1.432, 1.0, 1.0, 0.4, "~w~ knots", 255, 255, 255, 255)
                else
                    speed = 0.0
                end

                if HUDPlane.Panel then
                    drawTxt(UI.x + 0.6075, UI.y + 1.265, 1.0, 1.0, 0.44, "Roll: " .. math.ceil(Roll), 255, 255, 255, 200)
                    drawTxt(UI.x + 0.570, UI.y + 1.265, 1.0, 1.0, 0.44, "Pitch: " .. math.ceil(Pitch), 255, 255, 255, 200)
                    drawTxt(UI.x + 0.515, UI.y + 1.265, 1.0, 1.0, 0.44, "Altitude: " .. math.ceil(Height), 255, 255, 255, 200)
                    if (MainRotor < 350) and (MainRotor > 151) then
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Main Rotor", 255, 255, 0, 200)
                    elseif (MainRotor > 1) and (MainRotor < 150) then
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Main Rotor", 255, 0, 0, 200)
                    elseif (MainRotor == 0) then
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Main Rotor", 255, 0, 0, 200)
                    elseif not EngineRunning then
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Main Rotor", 255, 0, 0, 200)
                    else
                        drawTxt(UI.x + 0.515, UI.y + 1.240, 1.0, 1.0, 0.45, "Main Rotor", 0, 255, 0, 200)
                    end

                    if (TailRotor < 350) and (TailRotor > 151) then
                        drawTxt(UI.x + 0.570, UI.y + 1.240, 1.0, 1.0, 0.45, "Tail Rotor", 255, 255, 0, 200)
                    elseif (TailRotor > 1) and (TailRotor < 150) then
                        drawTxt(UI.x + 0.570, UI.y + 1.240, 1.0, 1.0, 0.45, "Tail Rotor", 255, 0, 0, 200)
                    elseif (TailRotor == 0) then
                        drawTxt(UI.x + 0.570, UI.y + 1.240, 1.0, 1.0, 0.45, "Tail Rotor", 255, 0, 0, 200)
                    elseif not EngineRunning then
                        drawTxt(UI.x + 0.570, UI.y + 1.240, 1.0, 1.0, 0.45, "Tail Rotor", 255, 0, 0, 200)
                    else
                        drawTxt(UI.x + 0.570, UI.y + 1.240, 1.0, 1.0, 0.45, "Tail Rotor", 0, 255, 0, 200)
                    end

                    if EngineRunning then
                        drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 0, 255, 0, 200) -- Green
                    else
                        drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 255, 0, 0, 200) -- Red
                    end
                end
            end

            --  ####         	 CAR HUD	  	  	  ####  --			
            if HUD.CarGears and PedHeli == false and PedPlane == false and PedBoat == false then
                if VehStopped and (Speed == 0) then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "P", 255, 0, 0, 200)
                elseif Gear < 1 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "R", 255, 255, 255, 200)
                elseif Gear == 1 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "1", 255, 255, 255, 200)
                elseif Gear == 2 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "2", 255, 255, 255, 200)
                elseif Gear == 3 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "3", 255, 255, 255, 200)
                elseif Gear == 4 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "4", 255, 255, 255, 200)
                elseif Gear == 5 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "5", 255, 255, 255, 200)
                elseif Gear == 6 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "6", 255, 255, 255, 200)
                elseif Gear == 7 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "7", 255, 255, 255, 200)
                elseif Gear == 8 then
                    drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0, 1.0, 0.45, "8", 255, 255, 255, 200)
                end
            end

            if HUD.Speed == 'kmh' and PedHeli == false and PedPlane == false and PedBoat == false then
                Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
            elseif HUD.Speed == 'mph' then
                Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
            else
                Speed = 0.0
            end

            if HUD.Top and PedHeli == false and PedPlane == false and PedBoat == false then
                drawTxt(UI.x + 0.561, UI.y + 1.2624, 1.0, 1.0, 0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
                if VehBurnout then
                    drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0, 1.0, 0.44, "DSC", 255, 0, 0, 200) -- red
                else
                    drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0, 1.0, 0.44, "DSC", 255, 255, 255, 150) -- white
                end
                if (VehEngineHP > 0) and (VehEngineHP < 110) then
                    drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0, 1.0, 0.45, "Fluid", 255, 0, 0, 200) -- red
                    drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0, 1.0, 0.45, "Oil", 255, 0, 0, 200) -- red
                    drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0, 1.0, 0.45, "AC", 255, 0, 0, 200) -- red
                elseif (VehEngineHP > 111) and (VehEngineHP < 370) then
                    drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0, 1.0, 0.45, "AC", 255, 255, 0, 200) -- yellow
                    drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0, 1.0, 0.45, "Fluid", 255, 255, 0, 200) -- yellow
                    drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0, 1.0, 0.45, "Oil", 255, 255, 0, 200) -- yellow
                else
                    drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0, 1.0, 0.45, "Fluid", 255, 255, 255, 200) -- green
                    drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0, 1.0, 0.45, "Oil", 255, 255, 255, 200) -- green
                    drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0, 1.0, 0.45, "AC", 255, 255, 255, 200) -- green
                end
            else
                if HUD.Plate and PedHeli == false and PedPlane == false and PedBoat == false then
                    drawTxt(UI.x + 0.515, UI.y + 1.260, 1.0, 1.0, 0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
                end

            end

            if HUD.Engine and PedHeli == false and PedPlane == false and PedBoat == false then
                if EngineRunning then
                    drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 0, 255, 0, 200) -- ENG green
                else
                    drawTxt(UI.x + 0.640, UI.y + 1.265, 1.0, 1.0, 0.45, "ENG", 255, 0, 0, 200) -- ENG red
                end
            end

            if HUD.SpeedIndicator and PedHeli == false and PedPlane == false and PedBoat == false then
                drawRct(UI.x + 0.11, UI.y + 0.930, 0.046, 0.033, 0, 0, 0, 150) -- Speed panel
                if HUD.Speed == 'kmh' then
                    drawTxt(UI.x + 0.61, UI.y + 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
                    drawTxt(UI.x + 0.633, UI.y + 1.432, 1.0, 1.0, 0.4, "~w~ km/h", 255, 255, 255, 255)
                elseif HUD.Speed == 'mph' then
                    drawTxt(UI.x + 0.61, UI.y + 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
                    drawTxt(UI.x + 0.633, UI.y + 1.432, 1.0, 1.0, 0.4, "~w~ mph", 255, 255, 255, 255)
                else
                    drawTxt(UI.x + 0.81, UI.y + 1.42, 1.0, 1.0, 0.64, [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)
                end
            end
        end
    end
end)

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x, y, width, height, scale, text, r, g, b, a)
    if not IsHudHidden() then
        SetTextFont(4)
        SetTextProportional(0)
        SetTextScale(scale, scale)
        SetTextColour(r, g, b, a)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x - width / 2, y - height / 2 + 0.005)
    end
end

function drawRct(x, y, width, height, r, g, b, a)
    if not IsHudHidden() then
        DrawRect(x + width / 2, y + height / 2, width, height, r, g, b, a)
    end
end
