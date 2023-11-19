RegisterCommand("ticket", function(source, args, rawCommand)
    local source = source
    if (source > 0) then
        -- Add your permission check here
        -- The following checks if they wish to remove or setup a tripod
        local args = args[1]
        local remove = false
        if (args ~= nil) then
            if (args == "speeding") then
                TriggerClientEvent("Client:SpeedingTicket", source, remove)
            elseif (args == "parking") then
                TriggerClientEvent("Client:ParkingTicket", source, remove)
            elseif (args == "reckless") then
                TriggerClientEvent("Client:RecklessDriving", source, remove)
            elseif (args == "stopsign") then
                TriggerClientEvent("Client:StopSign", source, remove)
            elseif (args == "redlight") then
                TriggerClientEvent("Client:RedLight", source, remove)
            end
        end
    end
end, false)