Config = {}

-- In-Game Command
Config.ToggleCommand = 'speedo' -- Command to toggle Speedometer settings

-- Measurement type
Config.UseMetricMeasurements = true -- true for kilometers (km/h), false for miles (mph)

-- UI Display Options
Config.Display = {
    ShowRpm = true,  -- Toggle to show/hide RPM
    ShowGear = true,  -- Toggle to show/hide gear
}

-- Sound Settings
Config.Sound = {
    EnableSounds = true,  -- Enable or disable sound effects
}

-- Fuel System
Config.EnableFuel = true -- Enable or disable fuel system

Config.FuelSystem = 'cdn-fuel' -- Options: LegacyFuel / cdn-fuel / nd-fuel / ox-fuel

Config.GetVehicleFuel = function(vehicle)
    if Config.EnableFuel then
        if DoesEntityExist(vehicle) then
            if Config.FuelSystem == 'LegacyFuel' then
                return exports["LegacyFuel"]:GetFuel(vehicle)
            elseif Config.FuelSystem == 'cdn-fuel' then
                return exports['cdn-fuel']:GetFuel(vehicle)
            elseif Config.FuelSystem == 'nd-fuel' then
                return exports["nd-fuel"]:GetFuel(vehicle)
            elseif Config.FuelSystem == 'ox-fuel' then
                return GetVehicleFuelLevel(vehicle)
            else
                -- You can add other fuel systems here if needed
                return 100 -- Default to full if unknown system
            end
        end
    else
        -- Fallback to the default game fuel level if fuel system is disabled
        return GetVehicleFuelLevel(vehicle)
    end
end