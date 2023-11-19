RegisterServerEvent("saveData")
AddEventHandler("saveData", function(data)
    local issuingOfficer = data.issuingOfficer
    local citationReason = data.citationReason
    local citationsFine = data.citationsFine
    local citationDate = data.citationDate
    local vehicleType = data.vehicleType
    local vehiclePlate = data.vehiclePlate

    -- Process and use the data in your server script
    -- ...

    -- Send a response back to the client if needed
    TriggerClientEvent("dataSaved", source, "Data saved successfully!")
end)

RegisterServerEvent('toggleTextboxVisibility')
AddEventHandler('toggleTextboxVisibility', function(isVisible)
    TriggerClientEvent('toggleTextboxVisibility', -1, isVisible)
end)

RegisterServerEvent('toggleImageVisibility')
AddEventHandler('toggleImageVisibility', function(isVisible)
    TriggerClientEvent('toggleImageVisibility', -1, isVisible)
end)


RegisterServerEvent("getVarsFromClient")
RegisterServerEvent("requestPrintServerVars")

local fine1, reason1, officer1, date1 -- Declare the variables at the server script level

AddEventHandler("getVarsFromClient", function(fine, reason, officer, date)
    -- Assign the received values to the server variables
    fine1 = fine
    reason1 = reason
    officer1 = officer
    date1 = date
end)

AddEventHandler("requestPrintServerVars", function()
    -- Send the server variables to the client for printing
    TriggerClientEvent("changetext3event", -1, fine1, reason1, officer1, date1)
end)











-- Event handler to update data
RegisterServerEvent('mychat:updateData')
AddEventHandler('mychat:updateData', function(officer, reason, fine, date)
    syncedData = {
        officer = officer,
        reason = reason,
        fine = fine,
        date = date
    }

    -- Send the updated data to all clients
    TriggerClientEvent('mychat:syncDataToClient', -1, syncedData)
end)

-- Test command to print data on the server
RegisterCommand('printdata', function(source, args, rawCommand)
    print("Officer:", syncedData.officer)
    print("Reason:", syncedData.reason)
    print("Fine:", syncedData.fine)
    print("Date:", syncedData.date)
end, false)






RegisterServerEvent("printNearestPlayerInfo")
AddEventHandler("printNearestPlayerInfo", function(nearestPlayerId)
    local sourcePlayer = source

    -- Trigger a client event only for the nearest player
    TriggerClientEvent("showNearestPlayerInfo", nearestPlayerId, nearestPlayerId)

    -- Optionally, broadcast the information to all clients
    TriggerClientEvent("broadcastNearestPlayerInfo", -1, nearestPlayerId)
end)


RegisterServerEvent("printNearestPlayerInfo2")
AddEventHandler("printNearestPlayerInfo2", function(nearestPlayerId)
    local sourcePlayer = source

    -- Trigger a client event only for the nearest player
    TriggerClientEvent("showNearestPlayerInfo", nearestPlayerId, nearestPlayerId)

    -- Optionally, broadcast the information to all clients
    TriggerClientEvent("broadcastNearestPlayerInfo2", -1, nearestPlayerId)
	print("Arrived")
end)