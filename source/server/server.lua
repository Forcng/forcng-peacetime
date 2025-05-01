ESX = exports["es_extended"]:getSharedObject()
local isPeaceTime = false

-- Peace Time Command
RegisterCommand('peacetime', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.getGroup() == 'director' or xPlayer.getGroup() == 'AddMinimapOverlay' then
        isPeaceTime = not isPeaceTime

        TriggerClientEvent('forcng:client:peaceTime', -1, isPeaceTime)

        -- If You want to use ox lib notifications for alerting users that its on or off then uncomment the lines below.

        if isPeaceTime then
            -- TriggerClientEvent('ox_lib:notify', -1, {
            --     title = 'Peace Time',
            --     description = 'Peace time has been enabled.',
            --     position = 'center-right',
            --     icon = "fa-solid fa-clock",
            --     duration = 30000,
            -- })
        else
            -- TriggerClientEvent('ox_lib:notify', -1, {
            --     title = 'Peace Time',
            --     description = 'Peace time has ended.',
            --     position = 'center-right',
            --     icon = "fa-solid fa-clock",
            --     duration = 30000,
            -- })
        end
    else
        TriggerClientEvent('ox_lib:notify', source, {
            description = 'You don\'t have permission to use this command.',
            type = 'error',
            position = 'center-right',
            icon = "fa-solid fa-clock",
            duration = 3000,
        })
    end
end)

-- Don't Remove, This Will Sync The Peace Time Status To All Players When They Join
AddEventHandler('esx:playerLoaded', function(playerId)
    TriggerClientEvent('forcng:client:peaceTime', playerId, isPeaceTime)
end)
