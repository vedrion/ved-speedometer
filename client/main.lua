local lastGear = 0

-- Event to show the speedometer with all the required data
RegisterNetEvent("speedometer:show")
AddEventHandler("speedometer:show", function(isMetric, speed, rpm, gear, fuelLevel, engineHealth)
    local showRpm = Config.Display.ShowRpm
    local showGear = Config.Display.ShowGear
    local enableSounds = Config.Sound.EnableSounds

    if not showGear then
        enableSounds = false
    end

    -- Send all data to NUI
    SendNUIMessage({
        action = "show",
        isMetric = isMetric,
        speed = speed,
        rpm = showRpm and rpm or nil,
        gear = showGear and gear or nil,
        fuel = fuelLevel,
        engineHealth = engineHealth
    })

    if gear ~= lastGear then
        if gear == 0 and enableSounds then
            PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
        elseif gear > lastGear and enableSounds then
            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        end

        lastGear = gear
    end
end)

-- Event to hide the speedometer
RegisterNetEvent("speedometer:hide")
AddEventHandler("speedometer:hide", function()
    SendNUIMessage({
        action = "hide"
    })
end)

-- Constantly update the speedometer information
Citizen.CreateThread(function()
    while true do
        local pedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if pedVehicle ~= 0 and GetIsVehicleEngineRunning(pedVehicle) then
            local fuelLevel = Config.GetVehicleFuel(pedVehicle)
            local engineHealth = GetVehicleEngineHealth(pedVehicle) / 10
            TriggerEvent("speedometer:show", Config.UseMetricMeasurements, GetEntitySpeed(pedVehicle), GetVehicleCurrentRpm(pedVehicle), GetVehicleCurrentGear(pedVehicle), fuelLevel, engineHealth) 
        else
            TriggerEvent("speedometer:hide")
        end

        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(9)

        Citizen.Wait(1)
    end
end)

-- Command to toggle speedometer settings
RegisterCommand(Config.ToggleCommand, function(source, args, rawCommand)
    local setting = args[1]
    local pedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if setting then
        if setting == "rpm" then
            Config.Display.ShowRpm = not Config.Display.ShowRpm
            TriggerEvent("speedometer:show", Config.UseMetricMeasurements, GetEntitySpeed(pedVehicle), GetVehicleCurrentRpm(pedVehicle), GetVehicleCurrentGear(pedVehicle))
            SendNUIMessage({
                action = "update",
                showRpm = Config.Display.ShowRpm,
                showGear = Config.Display.ShowGear,
                useMetric = Config.UseMetricMeasurements,
            })

        elseif setting == "gear" then
            Config.Display.ShowGear = not Config.Display.ShowGear
            SendNUIMessage({
                action = "update",
                showRpm = Config.Display.ShowRpm,
                showGear = Config.Display.ShowGear,
                useMetric = Config.UseMetricMeasurements,
            })

        elseif setting == "sounds" then
            Config.Sound.EnableSounds = not Config.Sound.EnableSounds
            
        elseif setting == "metric" then
            Config.UseMetricMeasurements = not Config.UseMetricMeasurements
            SendNUIMessage({
                action = "update",
                showRpm = Config.Display.ShowRpm,
                showGear = Config.Display.ShowGear,
                useMetric = Config.UseMetricMeasurements,
            })
        end
    end
end, false)

TriggerEvent('chat:addSuggestion', '/' ..Config.ToggleCommand, 'Options: rpm, gear, sounds, metric')