local standardVolumeOutput = 0.2;
local isUiOpen = false
local speedBuffer = {}
local velBuffer = {}
local SeatbeltON = false
local InVehicle = false
local ChimesToggle = false
local PedHeli = IsPedInAnyHeli(MyPed)
local PedPlane = IsPedInAnyPlane(MyPed)
local colorNames = {
    ["0"] = "Metallic Black",
    ["1"] = "Metallic Graphite Black",
    ["2"] = "Metallic Black Steal",
    ["3"] = "Metallic Dark Silver",
    ["4"] = "Metallic Silver",
    ["5"] = "Metallic Blue Silver",
    ["6"] = "Metallic Steel Gray",
    ["7"] = "Metallic Shadow Silver",
    ["8"] = "Metallic Stone Silver",
    ["9"] = "Metallic Midnight Silver",
    ["10"] = "Metallic Gun Metal",
    ["11"] = "Metallic Anthracite Grey",
    ["12"] = "Matte Black",
    ["13"] = "Matte Gray",
    ["14"] = "Matte Light Grey",
    ["15"] = "Util Black",
    ["16"] = "Util Black Poly",
    ["17"] = "Util Dark silver",
    ["18"] = "Util Silver",
    ["19"] = "Util Gun Metal",
    ["20"] = "Util Shadow Silver",
    ["21"] = "Worn Black",
    ["22"] = "Worn Graphite",
    ["23"] = "Worn Silver Grey",
    ["24"] = "Worn Silver",
    ["25"] = "Worn Blue Silver",
    ["26"] = "Worn Shadow Silver",
    ["27"] = "Metallic Red",
    ["28"] = "Metallic Torino Red",
    ["29"] = "Metallic Formula Red",
    ["30"] = "Metallic Blaze Red",
    ["31"] = "Metallic Graceful Red",
    ["32"] = "Metallic Garnet Red",
    ["33"] = "Metallic Desert Red",
    ["34"] = "Metallic Cabernet Red",
    ["35"] = "Metallic Candy Red",
    ["36"] = "Metallic Sunrise Orange",
    ["37"] = "Metallic Classic Gold",
    ["38"] = "Metallic Orange",
    ["39"] = "Matte Red",
    ["40"] = "Matte Dark Red",
    ["41"] = "Matte Orange",
    ["42"] = "Matte Yellow",
    ["43"] = "Util Red",
    ["44"] = "Util Bright Red",
    ["45"] = "Util Garnet Red",
    ["46"] = "Worn Red",
    ["47"] = "Worn Golden Red",
    ["48"] = "Worn Dark Red",
    ["49"] = "Metallic Dark Green",
    ["50"] = "Metallic Racing Green",
    ["51"] = "Metallic Sea Green",
    ["52"] = "Metallic Olive Green",
    ["53"] = "Metallic Green",
    ["54"] = "Metallic Gasoline Blue Green",
    ["55"] = "Matte Lime Green",
    ["56"] = "Util Dark Green",
    ["57"] = "Util Green",
    ["58"] = "Worn Dark Green",
    ["59"] = "Worn Green",
    ["60"] = "Worn Sea Wash",
    ["61"] = "Metallic Midnight Blue",
    ["62"] = "Metallic Dark Blue",
    ["63"] = "Metallic Saxony Blue",
    ["64"] = "Metallic Blue",
    ["65"] = "Metallic Mariner Blue",
    ["66"] = "Metallic Harbor Blue",
    ["67"] = "Metallic Diamond Blue",
    ["68"] = "Metallic Surf Blue",
    ["69"] = "Metallic Nautical Blue",
    ["70"] = "Metallic Bright Blue",
    ["71"] = "Metallic Purple Blue",
    ["72"] = "Metallic Spinnaker Blue",
    ["73"] = "Metallic Ultra Blue",
    ["74"] = "Metallic Bright Blue",
    ["75"] = "Util Dark Blue",
    ["76"] = "Util Midnight Blue",
    ["77"] = "Util Blue",
    ["78"] = "Util Sea Foam Blue",
    ["79"] = "Util Lightning blue",
    ["80"] = "Util Maui Blue Poly",
    ["81"] = "Util Bright Blue",
    ["82"] = "Matte Dark Blue",
    ["83"] = "Matte Blue",
    ["84"] = "Matte Midnight Blue",
    ["85"] = "Worn Dark blue",
    ["86"] = "Worn Blue",
    ["87"] = "Worn Light blue",
    ["88"] = "Metallic Taxi Yellow",
    ["89"] = "Metallic Race Yellow",
    ["90"] = "Metallic Bronze",
    ["91"] = "Metallic Yellow Bird",
    ["92"] = "Metallic Lime",
    ["93"] = "Metallic Champagne",
    ["94"] = "Metallic Pueblo Beige",
    ["95"] = "Metallic Dark Ivory",
    ["96"] = "Metallic Choco Brown",
    ["97"] = "Metallic Golden Brown",
    ["98"] = "Metallic Light Brown",
    ["99"] = "Metallic Straw Beige",
    ["100"] = "Metallic Moss Brown",
    ["101"] = "Metallic Biston Brown",
    ["102"] = "Metallic Beechwood",
    ["103"] = "Metallic Dark Beechwood",
    ["104"] = "Metallic Choco Orange",
    ["105"] = "Metallic Beach Sand",
    ["106"] = "Metallic Sun Bleeched Sand",
    ["107"] = "Metallic Cream",
    ["108"] = "Util Brown",
    ["109"] = "Util Medium Brown",
    ["110"] = "Util Light Brown",
    ["111"] = "Metallic White",
    ["112"] = "Metallic Frost White",
    ["113"] = "Worn Honey Beige",
    ["114"] = "Worn Brown",
    ["115"] = "Worn Dark Brown",
    ["116"] = "Worn straw beige",
    ["117"] = "Brushed Steel",
    ["118"] = "Brushed Black steel",
    ["119"] = "Brushed Aluminium",
    ["120"] = "Chrome",
    ["121"] = "Worn Off White",
    ["122"] = "Util Off White",
    ["123"] = "Worn Orange",
    ["124"] = "Worn Light Orange",
    ["125"] = "Metallic Securicor Green",
    ["126"] = "Worn Taxi Yellow",
    ["127"] = "police car blue",
    ["128"] = "Matte Green",
    ["129"] = "Matte Brown",
    ["130"] = "Worn Orange",
    ["131"] = "Matte White",
    ["132"] = "Worn White",
    ["133"] = "Worn Olive Army Green",
    ["134"] = "Pure White",
    ["135"] = "Hot Pink",
    ["136"] = "Salmon pink",
    ["137"] = "Metallic Vermillion Pink",
    ["138"] = "Orange",
    ["139"] = "Green",
    ["140"] = "Blue",
    ["141"] = "Mettalic Black Blue",
    ["142"] = "Metallic Black Purple",
    ["143"] = "Metallic Black Red",
    ["144"] = "hunter green",
    ["145"] = "Metallic Purple",
    ["146"] = "Metaillic V Dark Blue",
    ["147"] = "MODSHOP BLACK1",
    ["148"] = "Matte Purple",
    ["149"] = "Matte Dark Purple",
    ["150"] = "Metallic Lava Red",
    ["151"] = "Matte Forest Green",
    ["152"] = "Matte Olive Drab",
    ["153"] = "Matte Desert Brown",
    ["154"] = "Matte Desert Tan",
    ["155"] = "Matte Foilage Green",
    ["156"] = "DEFAULT ALLOY COLOR",
    ["157"] = "Epsilon Blue",
    ["158"] = "Pure Gold",
    ["159"] = "Brushed Gold",
    ["160"] = "Util Yellow",
    ["161"] = "Anodized Red",
    ["162"] = "Anodized Wine",
    ["163"] = "Anodized Purple",
    ["164"] = "Anodized Blue",
    ["165"] = "Anodized Green",
    ["166"] = "Anodized Lime",
    ["167"] = "Anodized Copper",
    ["168"] = "Anodized Bronze",
    ["169"] = "Anodized Champagne",
    ["170"] = "Anodized Gold",
    ["171"] = "Green Blue Flip",
    ["172"] = "Green Red Flip",
    ["173"] = "Green Brown Flip",
    ["174"] = "Green Turqoise Flip",
    ["175"] = "Green Purple Flip",
    ["176"] = "Teal Purple Flip",
    ["177"] = "Turqoise Red Flip",
    ["178"] = "Turqoise Purple Flip",
    ["179"] = "Cyan Purple Flip",
    ["180"] = "Blue Pink Flip",
    ["181"] = "Blue Green Flip",
    ["182"] = "Purple Red Flip",
    ["183"] = "Purple Green Flip",
    ["184"] = "Magenta Green Flip",
    ["185"] = "Magenta Yellow Flip",
    ["186"] = "Burgundy Green Flip",
    ["187"] = "Magenta Cyan Flip",
    ["188"] = "Copper Purple Flip",
    ["189"] = "Magenta Orange Flip",
    ["190"] = "Red Orange Flip",
    ["191"] = "Orange Purple Flip",
    ["192"] = "Orange Blue Flip",
    ["193"] = "White Purple Flip",
    ["194"] = "Red Rainbow Flip",
    ["195"] = "Blue Rainbow Flip",
    ["196"] = "Dark Green Pearl",
    ["197"] = "Dark Teal Pearl",
    ["198"] = "Dark Blue Pearl",
    ["199"] = "Dark Purple Pearl",
    ["200"] = "Oil Slick Pearl",
    ["201"] = "Light Green Pearl",
    ["202"] = "Light Blue Pearl",
    ["203"] = "Light Purple Pearl",
    ["204"] = "Light Pink Pearl",
    ["205"] = "Offwhite Prismatic",
    ["206"] = "Pink Pearl",
    ["207"] = "Yellow Pearl",
    ["208"] = "Green Pearl",
    ["209"] = "Blue Pearl",
    ["210"] = "Cream Pearl",
    ["211"] = "White Prismatic",
    ["212"] = "Graphite Prismatic",
    ["213"] = "Dark Blue Prismatic",
    ["214"] = "Dark Purple Prismatic",
    ["215"] = "Hot Pink Prismatic",
    ["216"] = "Red Prismatic",
    ["217"] = "Green Prismatic",
    ["218"] = "Black Prismatic",
    ["219"] = "Oil Slick Prismatic",
    ["220"] = "Rainbow Brism",
    ["221"] = "Black Holo",
    ["222"] = "White Holo",
    ["223"] = "Anodized Monochrome",
    ["224"] = "Day Night Flip",
    ["225"] = "Verlier Flip",
    ["226"] = "Anodized Sprunk",
    ["227"] = "Vice City Flip",
    ["228"] = "Synthwave Pearl",
    ["229"] = "Seasons Flip",
    ["230"] = "The Ballad Pearl",
    ["231"] = "Bubblegum Pearl",
    ["232"] = "Rainbow Prismatic",
    ["233"] = "Sunset Flip",
    ["234"] = "Visions Prismatic",
    ["235"] = "Maziora Prismatic",
    ["236"] = "Hot Cold Flip",
    ["237"] = "Christmas Flip",
    ["238"] = "Temperature Flip",
    ["239"] = "Hao's Flip",
    ["240"] = "Anodized Electro",
    ["241"] = "Monika Prismatic",
    ["242"] = "Anodized Fubuki"
}

local seatbeltException = {
    "bike1",
    "bike2",
    "blazer",
    "blazer2",
    "blazer3",
    "blazer4",
    "blazer5",
    "rcbandito"
}

RegisterNetEvent("PlayOnOne")
AddEventHandler("PlayOnOne", function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType = "playSound",
        transactionFile = soundFile,
        transactionVolume = soundVolume
    })
end)

function isseatbeltException(veh)
    local model = GetEntityModel(veh)
    for i = 1, #seatbeltException, 1 do
        if model == GetHashKey(seatbeltException[i]) then
            return true
        end
    end
    return false
end

function DisplayHelpText(text)
    if not IsHudHidden() then
        SetTextComponentFormat("STRING")
        AddTextComponentString(text)
        DisplayHelpTextFromStringLabel(0, 0, 0, -1)
    end
end

function IsCar(veh)
    local vc = GetVehicleClass(veh)
    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

function Fwv(entity)
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
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local car = GetVehiclePedIsIn(ped)
        if car ~= 0 and (InVehicle or IsCar(car) and not isseatbeltException(car)) then
            InVehicle = true
            if isUiOpen == false and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
                    displayWindow = "true"
                })
                isUiOpen = true
            end
            if SeatbeltON then
                DisableControlAction(0, 75, true)
                DisableControlAction(27, 75, true)
                if IsDisabledControlJustPressed(0, 75) and IsVehicleStopped(car) then
                    exports["swt_notifications"]:CaptionIcon("Press Y to unbuckle.", "Your seatbelt is on.", "left", 7500, "dark", "white", true, "mdi-seatbelt")
                end
            end
            speedBuffer[2] = speedBuffer[1]
            speedBuffer[1] = GetEntitySpeed(car)
            if not SeatbeltON and speedBuffer[2] ~= nil and GetEntitySpeedVector(car, true).y > 1.0 and speedBuffer[1] > (100.0 / 3.6) and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
                local co = GetEntityCoords(ped)
                local fw = Fwv(ped)
                SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
                SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
                Citizen.Wait(1)
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
            end
            velBuffer[2] = velBuffer[1]
            velBuffer[1] = GetEntityVelocity(car)
            if IsControlJustReleased(0, 246) then
                SeatbeltON = not SeatbeltON
                if SeatbeltON then
                    Citizen.Wait(1)
                    exports["swt_notifications"]:Icon("Buckled", "left", 2000, "dark", "warning", false, "mdi-seatbelt")
                    TriggerServerEvent("PlayOnSource", "buckle", 0.5)
                    if PedHeli == false or PedPlane == false then
                        SendNUIMessage({
                            displayWindow = "false"
                        })
                    end
                    isUiOpen = true
                else
                    exports["swt_notifications"]:Icon("Unbuckled", "left", 2000, "dark", "warning", false, "mdi-seatbelt")
                    TriggerServerEvent("PlayOnSource", "unbuckle", 0.5)
                    if PedHeli == false or PedPlane == false then
                        SendNUIMessage({
                            displayWindow = "true"
                        })
                    end
                    isUiOpen = true
                end
            end
            if IsDisabledControlJustPressed(0, 75) and IsControlPressed(0, 21) then
                SeatbeltON = not SeatbeltON
                if SeatbeltON then
                    TriggerServerEvent("PlayOnSource", "unbuckle", 0.7)
                    exports["swt_notifications"]:Icon("Quick released.", "left", 2000, "dark", "warning", false, "mdi-seatbelt")
                    SendNUIMessage({
                        displayWindow = "false"
                    })
                    isUiOpen = true
                    SeatbeltON = false
                end
            end
        elseif InVehicle then
            InVehicle = false
            SeatbeltON = false
            speedBuffer[1], speedBuffer[2] = 0.0, 0.0
            if isUiOpen == true and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
                    displayWindow = "false"
                })
                isUiOpen = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if InVehicle then
            local Vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local VehSpeed = GetEntitySpeed(Vehicle) * 3.6
            if VehSpeed > -1 then
                ShowWindow = true
            else
                ShowWindow = false
                SendNUIMessage({
                    displayWindow = "false"
                })
            end
            if IsPlayerDead(PlayerId()) or IsPauseMenuActive() then
                if isUiOpen == true then
                    SendNUIMessage({
                        displayWindow = "false"
                    })
                end
            elseif not SeatbeltON and InVehicle and not IsPauseMenuActive() and not IsPlayerDead(PlayerId()) then
                if ShowWindow and VehSpeed > -1 then
                    SendNUIMessage({
                        displayWindow = "true"
                    })
                    DisplayHelpText("~w~Press ~INPUT_MP_TEXT_CHAT_TEAM~ to buckle your seatbelt.")
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3500)
        if not SeatbeltON and InVehicle and not IsPauseMenuActive() and ShowWindow then
            TriggerServerEvent("PlayOnSource", "seatbelt", 0.00)
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local primary, secondary = GetVehicleColours(veh)
            primary = colorNames[tostring(primary)]
            secondary = colorNames[tostring(secondary)]
            TriggerServerEvent("SendNoti", primary)
        end
    end
end)

RegisterNetEvent("GetNoti")
AddEventHandler("GetNoti", function(id, primary)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
    local color = primary
    local model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))
    if pid ~= myId then
        if GetVehicleClass(veh) == 18 then
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(pid)), GetEntityCoords(GetPlayerPed(myId)), true) < 19.999 then
                if math.random(1, 1) == 1 then
                    exports["swt_notifications"]:Icon("A person in a " .. color .. " " .. model .. " vehicle is not wearing their seatbelt.", "left", 5000, "primary", "white", true, "mdi-police-badge")
                end
            end
        end
    end
end)
