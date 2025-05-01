local isPeaceTime = false

RegisterNetEvent('forcng:client:peaceTime')
AddEventHandler('forcng:client:peaceTime', function(isActive)
    isPeaceTime = isActive

    if isActive then
        SendNUIMessage({
            action = 'isPeaceTimeOn',
            status = true
        })
    else
        SendNUIMessage({
            action = 'isPeaceTimeOn',
            status = false
        })
    end
end)

-- Stops Players From Being Able To Aim, Punch
CreateThread(function()
    while true do
        Wait(0)

        if isPeaceTime then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 257, true)
            DisablePlayerFiring(PlayerId(), true)
        end
    end
end)

