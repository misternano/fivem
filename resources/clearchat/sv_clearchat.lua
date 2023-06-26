RegisterCommand("clearchat", function(source, args) 
    if IsPlayerAceAllowed(source, "chat.clear") then
        TriggerClientEvent("chat:clear", -1)
        Citizen.Wait(10)
        Print("Chat has been cleared by " .. GetPlayerName(source) .. " ID: " .. source)
    else 
        print("(#" .. source .. ") ^3Insufficient permissions")
    end
end, false)