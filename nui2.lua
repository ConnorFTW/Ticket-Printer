

--███╗░░░███╗░█████╗░██████╗░  ███╗░░░███╗░█████╗░██╗░░██╗███████╗██████╗░░██████╗"
--████╗░████║██╔══██╗██╔══██╗  ████╗░████║██╔══██╗██║░██╔╝██╔════╝██╔══██╗██╔════╝"
--██╔████╔██║██║░░██║██║░░██║  ██╔████╔██║███████║█████═╝░█████╗░░██████╔╝╚█████╗░"
--██║╚██╔╝██║██║░░██║██║░░██║  ██║╚██╔╝██║██╔══██║██╔═██╗░██╔══╝░░██╔══██╗░╚═══██╗"
--██║░╚═╝░██║╚█████╔╝██████╔╝  ██║░╚═╝░██║██║░░██║██║░╚██╗███████╗██║░░██║██████╔╝"
--╚═╝░░░░░╚═╝░╚════╝░╚═════╝░  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░"

        -- CODE WRITTEN BY CONNOR SAVAGE --
        -- CODE STARTED 7/15/2023 --
        -- CODE FINISHED 11/18/2023 --

   

   local display = false

print('MOD MAKERS --- TICKET PRINTER LOADED')

function SendSystemMessage(targetPlayer, message)
    TriggerClientEvent('chatMessage', targetPlayer, 'SYSTEM', {255, 0, 0}, message)
end

RegisterNetEvent("dataSaved")
AddEventHandler("dataSaved", function(message)
    print(message)
end)

local syncedData = {
    officer = "",
    reason = "",
    fine = 0,
    date = ""
}

function updateSyncedData(newData)
    syncedData = newData
    printSyncedData()
end

function printSyncedData()
    print("Officer:", syncedData.officer)
    print("Reason:", syncedData.reason)
    print("Fine:", syncedData.fine)
    print("Date:", syncedData.date)
end

RegisterNetEvent('mychat:syncDataToClient')
AddEventHandler('mychat:syncDataToClient', updateSyncedData)

RegisterCommand("ticketprinter", function(source, args)
    SetDisplay(not display)
end)

RegisterNetEvent('toggletextbox')
AddEventHandler('toggletextbox', function()
    isVisibleTextbox = not isVisibleTextbox
    TriggerEvent('toggleTextboxVisibility', isVisibleTextbox)
end)

RegisterNetEvent('toggleimage')
AddEventHandler('toggleimage', function()
    isVisibleImage = not isVisibleImage
    TriggerEvent('toggleImageVisibility', isVisibleImage)
end)

RegisterNetEvent('toggleTextboxVisibility')
AddEventHandler('toggleTextboxVisibility', function(isVisible)
    TriggerEvent('toggleTextboxVisibilityClient', isVisible)
end)

RegisterNetEvent('updateTextboxes3')
AddEventHandler('updateTextboxes', function(data)
    syncedData = data
    updateTextboxes(syncedData)
end)

function updateTextboxes(data)
    print("Updating textboxes with data:", data)
    SendNUIMessage({
        myTextbox = data.myTextbox or "",
        myTextbox2 = data.myTextbox2 or "",
        myTextbox3 = data.myTextbox3 or "",
        myTextbox4 = data.myTextbox4 or "",
        myTextbox5 = data.myTextbox5 or "",
        myTextbox6 = data.myTextbox6 or "",
    })
end

RegisterNetEvent('toggleImageVisibility')
AddEventHandler('toggleImageVisibility', function(isVisible)
    TriggerEvent('toggleImageVisibilityClient', isVisible)
end)

AddEventHandler('toggleTextboxVisibilityClient', function(isVisible)
    SendNUIMessage({ visibilityTextbox = isVisible })
end)

AddEventHandler('toggleImageVisibilityClient', function(isVisible)
    SendNUIMessage({ visibilityImage = isVisible })
end)

local pressEToCloseText = "Press E to Close"

RegisterNetEvent('updatePressEToCloseText')
AddEventHandler('updatePressEToCloseText', function(newText)
    pressEToCloseText = newText
    print("Updated Press E to Close text: " .. pressEToCloseText)
end)

RegisterNetEvent('OpenBoxes')
AddEventHandler('OpenBoxes', function(isVisible)
    Citizen.Wait(5000)
    print("Done")
    TriggerEvent("toggleimage")
    TriggerEvent("toggletextbox")
    TriggerEvent('changetext3')
    ExecuteCommand("ticketprinter")
    Citizen.Wait(100)
    ExecuteCommand("getthevarb")
    Citizen.Wait(200)
    TriggerEvent('changetext')
    TriggerEvent('changetext3')
    SendNUIMessage({
        type = 'setTextPressEToClose',
        text = "Press E to Close -- Press Y to Hand to Recipient"
    })
    local isOpen = true
    while isOpen do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then
            print("Closed")
            TriggerEvent("toggleimage")
            TriggerEvent("toggletextbox")
            isOpen = false
            TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Ticket Closed")
        elseif IsControlJustPressed(0, 246) then
            TriggerEvent('triggerNearestEvent')
            TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Copy of Ticket was Given to Recipient")
        end
    end
end)

RegisterNetEvent('close')
AddEventHandler('close', function(isVisible)
    SendNUIMessage({ visibilityTextbox = isVisible })
end)

local citationsFine = "$100"
local textForTextbox2 = "Default Text for myTextbox2"
local date = "11/15/2023"
local officer = "John Doe"

RegisterNetEvent('OpenForUser2')
AddEventHandler('OpenForUser2', function(newReasons)
    TriggerEvent("toggleimage")
end)

local syncedData = {
    officer = "",
    reason = "",
    fine = 0,
    date = ""
}

function updateSyncedData(newData)
    syncedData = newData
    printSyncedData()
end

function printSyncedData()
    print("Officer:", syncedData.officer)
    print("Reason:", syncedData.reason)
    print("Fine:", syncedData.fine)
    print("Date:", syncedData.date)
end

RegisterNetEvent('mychat:syncDataToClient')
AddEventHandler('mychat:syncDataToClient', updateSyncedData)

RegisterCommand('printclientdata', function(source, args, rawCommand)
    printSyncedData()
end, false)

RegisterNUICallback("submitData", function(data)
    local officer = data.officer
    local reason = data.reason
    local fine = data.fine
    local date = data.date
    local vehicleType = data.vehicleType
    local vehiclePlate = data.vehiclePlate
    local soundEffect = 'SoundEffect'
    print("Officer: " .. officer)
    print("Reason: " .. reason)
    print("Fine: " .. fine)
    print("Date: " .. date)
    print("Vehicle Type: " .. vehicleType)
    print("Vehicle Plate: " .. vehiclePlate)
    TriggerEvent('updateOfficer', officer)
    TriggerEvent('OpenBoxes')
    TriggerEvent("updateReasons", reason)
    TriggerEvent("updateFine", fine)
    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Printing Ticket...")
end)

local officer = "John Doe"
local date = "11/15/2023"
local textForTextbox2 = "Default Text for myTextbox2"
local citationsFine = "$100"

RegisterNetEvent('updateOfficer')
AddEventHandler('updateOfficer', function(newOfficer)
    officer = newOfficer
    print("Updated officer: " .. officer)
end)

RegisterNetEvent('updateFine')
AddEventHandler('updateFine', function(newFine)
    fine = newFine
    print("Updated officer: " .. fine)
end)

RegisterNetEvent('updateReasons')
AddEventHandler('updateReasons', function(newReasons)
    reason = newReasons
    print("Updated Reasons: " .. reason)
end)

RegisterNetEvent('updateCitationsFine')
AddEventHandler('updateCitationsFine', function(newCitationsFine)
    citationsFine = newCitationsFine
    print("Updated citations fine: " .. citationsFine)
end)

RegisterNetEvent('updateCitationDate')
AddEventHandler('updateCitationDate', function(newCitationDate)
    date = newCitationDate
    print("Updated citation date: " .. date)
end)

RegisterNetEvent('updateTextbox2')
AddEventHandler('updateTextbox2', function(newTextForTextbox2)
    textForTextbox2 = newTextForTextbox2
    print("Updated text for myTextbox2: " .. textForTextbox2)
end)

RegisterNetEvent('changetext')
AddEventHandler('changetext', function(officer, date, reason, fine)
    SendNUIMessage({
        type = 'setText',
        text = officer
    })
    SendNUIMessage({
        type = 'setTextCitationDate',
        text = date
    })
    SendNUIMessage({
        type = 'setTextForTextbox2',
        text = reason
    })
    SendNUIMessage({
        type = 'setTextCitationsFine',
        text = fine
    })
end)

RegisterNetEvent('changetext3')
AddEventHandler('changetext3', function()
    TriggerServerEvent('requestPrintServerVars')
end)

RegisterNetEvent("changetext3event")
AddEventHandler("changetext3event", function(fine1, reason1, officer1, date1)
    print("Fine1: " .. fine1)
    print("Reason1: " .. reason1)
    print("Officer1: " .. officer1)
    print("Date1: " .. date1)
    SendNUIMessage({
        type = 'setText',
        text = officer1
    })
    SendNUIMessage({
        type = 'setTextCitationDate',
        text = date1
    })
    SendNUIMessage({
        type = 'setTextForTextbox2',
        text = reason1
    })
    SendNUIMessage({
        type = 'setTextCitationsFine',
        text = fine1
    })
end)

RegisterCommand("getthevarb", function()
    TriggerServerEvent("getVarsFromClient", fine, reason, officer, date)
end, false)

RegisterCommand("printserver", function()
    TriggerServerEvent("requestPrintServerVars")
end, false)

RegisterNetEvent("printServerVars")
AddEventHandler("printServerVars", function(fine1, reason1, officer1, date1)
    print("Fine1: " .. fine1)
    print("Reason1: " .. reason1)
    print("Officer1: " .. officer1)
    print("Date1: " .. date1)
end)

function executeSendData1Command(userInput1, userInput2, userInput3, userInput4, userInput5, userInput6)
    TriggerEvent("senddata1", userInput1, userInput2, userInput3, userInput4, userInput5, userInput6)
end

RegisterNUICallback("exit", function(data)
    chat("exited", {0,255,0})
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    chat(data.text, {0,255,0})
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
    print("NUI Display Status:", bool)
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end

if Config.show then
    Config.print(Config.text)
    function updateUIText()
        Citizen.Wait(2000)
        print("Updating")
        SendNUIMessage({
            type = 'updateIssueingDepartmentText',
            text = Config.issueingDepartmentText
        })
    end
    updateUIText()
end

RegisterCommand("nearest", function()
    print("Finding nearest player...")
    Citizen.CreateThread(function()
        getNearestPlayer()
    end)
end, false)

RegisterCommand("nearest3", function()
    print("Finding nearest player...")
    Citizen.CreateThread(function()
        getNearestPlayer3()
    end)
end, false)

RegisterNetEvent("showNearestPlayerInfo")
AddEventHandler("showNearestPlayerInfo", function(nearestPlayerId)
    local myPlayerId = PlayerId()
    if nearestPlayerId == myPlayerId then
        print("Received and displayed nearest player ID: " .. nearestPlayerId)
    end
end)

RegisterNetEvent("broadcastNearestPlayerInfo")
AddEventHandler("broadcastNearestPlayerInfo", function(nearestPlayerId)
    local myPlayerId = PlayerId()
    if nearestPlayerId == myPlayerId then
        print("Broadcasted nearest player ID: " .. nearestPlayerId)
        ExecuteCommand("printserver")
        TriggerEvent("toggleimage")
        TriggerEvent("toggletextbox")
        TriggerEvent('changetext3')
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "You Have Been Given a Copy of a Ticket")
        SendNUIMessage({
            type = 'setTextPressEToClose',
            text = "Press E to Close -- Press Y to Sign"
        })
        local isOpen = true
        while isOpen do
            Citizen.Wait(0)
            if IsControlJustPressed(0, 38) then
                print("Closed")
                TriggerEvent("toggleimage")
                TriggerEvent("toggletextbox")
                isOpen = false
                TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "You have closed the ticket")
            elseif IsControlJustPressed(0, 246) then
                TriggerEvent("toggleimage")
                TriggerEvent("toggletextbox")
                TriggerEvent('triggerNearestEvent2')
                isOpen = false
                TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "You Have Signed The Ticket")
                TriggerServerEvent("TicketSigned")
            end
        end
    end
end)

RegisterNetEvent("broadcastNearestPlayerInfo2")
AddEventHandler("broadcastNearestPlayerInfo2", function(nearestPlayerId)
    local myPlayerId = PlayerId()
    if nearestPlayerId == myPlayerId then
        print("Broadcasted nearest player ID: " .. nearestPlayerId)
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Recipient has Signed the Ticket")
    end
end)

RegisterNetEvent('triggerNearestEvent')
AddEventHandler('triggerNearestEvent', function()
    local playerPed = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(playerPed, false))
    local players = GetActivePlayers()
    local closestDistance = -1
    local nearestPlayer = -1
    local radius = 10
    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(targetPed, false)
        local distance = GetDistanceBetweenCoords(x, y, z, targetCoords.x, targetCoords.y, targetCoords.z, true)

        if player ~= PlayerId() and distance <= radius and (closestDistance == -1 or distance < closestDistance) then
            closestDistance = distance
            nearestPlayer = player
        end
    end

    if nearestPlayer ~= -1 then
        TriggerServerEvent("printNearestPlayerInfo", nearestPlayer)
    else
        print("No nearest player found.")
    end
end)


RegisterNetEvent('triggerNearestEvent2')
AddEventHandler('triggerNearestEvent2', function()
    print("starting")
    local playerPed = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(playerPed, false))
    local players = GetActivePlayers()

    local closestDistance = -1
    local nearestPlayer = -1
    local radius = 10

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(targetPed, false)
        local distance = GetDistanceBetweenCoords(x, y, z, targetCoords.x, targetCoords.y, targetCoords.z, true)

        if player ~= PlayerId() and distance <= radius and (closestDistance == -1 or distance < closestDistance) then
            closestDistance = distance
            nearestPlayer = player
        end
    end

    if nearestPlayer ~= -1 then
        TriggerServerEvent("printNearestPlayerInfo2", nearestPlayer)
        print("Triggering")
    else
        print("No nearest player found.")
    end
end)
