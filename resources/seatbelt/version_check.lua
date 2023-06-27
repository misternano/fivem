-------------------------------------------------------------
-- CIOT- A Simple FiveM Script, Made By Rocket Development --
-------------------------------------------------------------
----------------------------------------------------------------------------------------------
-- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
-- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------
-- Branding!
local label = [[^3CIOT^7]]

Citizen.CreateThread(function()
    local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
    if not CurrentVersion then
        print('^1CIOT Version Check Failed!^7')
    end

    function VersionCheckHTTPRequest()
        PerformHttpRequest('https://raw.githubusercontent.com/Jordan2139/versions/master/ciot.json', VersionCheck, 'GET')
    end

    function VersionCheck(err, response, headers)
        Citizen.Wait(3000)
        if err == 200 then
            local Data = json.decode(response)
            if CurrentVersion ~= Data.NewestVersion then
                print(label)
                print('   ^1Outdated!^7')
                print('   Current version: ^2' .. Data.NewestVersion .. '^7')
                print('   Your version: ^1' .. CurrentVersion .. '^7')
                print('   Latest from ^5' .. Data.DownloadLocation .. '^7')
                print('')
            end
        else
            print(label)
            print('   ^1There was an error getting the latest version information, if the issue persists contact Jordan.#2139 on Discord.\n^0  ||\n  \\\\\n')
        end

        SetTimeout(60000000, VersionCheckHTTPRequest)
    end

    VersionCheckHTTPRequest()
end)
