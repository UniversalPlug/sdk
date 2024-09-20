-- SDK for Lighting Manipulation

local LightingSDK = {}

-- Roblox Services
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- 1. Time and Lighting Manipulation

-- Set time of day (in-game time)
function LightingSDK.setTimeOfDay(time)
    Lighting.TimeOfDay = tostring(time)
end

-- Set brightness level
function LightingSDK.setBrightness(level)
    Lighting.Brightness = level
end

-- Toggle between day and night
function LightingSDK.toggleDayNight(isDay)
    if isDay then
        LightingSDK.setTimeOfDay(14)  -- Set to 2 PM (daytime)
        LightingSDK.setBrightness(2)
    else
        LightingSDK.setTimeOfDay(0)   -- Set to midnight (nighttime)
        LightingSDK.setBrightness(0.5)
    end
end

-- Set ambient light color
function LightingSDK.setAmbientLightColor(color)
    Lighting.Ambient = color
end

-- 2. Weather Manipulation

-- Enable or disable fog
function LightingSDK.setFogEnabled(enabled)
    if enabled then
        Lighting.FogStart = 10
        Lighting.FogEnd = 300
        Lighting.FogColor = Color3.new(0.5, 0.5, 0.5)
    else
        Lighting.FogStart = 100000 -- Disable by making it distant
        Lighting.FogEnd = 100000
    end
end

-- Set fog color
function LightingSDK.setFogColor(color)
    Lighting.FogColor = color
end

-- 3. Other Lighting Settings

-- Set outdoor ambient color
function LightingSDK.setOutdoorAmbientColor(color)
    Lighting.OutdoorAmbient = color
end

-- Set global lighting effects (e.g., exposure)
function LightingSDK.setExposure(exposure)
    Lighting.Exposure = exposure
end

-- Set color correction (e.g., tint)
function LightingSDK.setColorCorrection(tintColor)
    Lighting.ColorCorrection.TintColor = tintColor
end

-- 4. Light Creation

-- Create and add a PointLight to a part
function LightingSDK.createPointLight(parent, color, intensity, range)
    local pointLight = Instance.new("PointLight")
    pointLight.Color = color
    pointLight.Intensity = intensity
    pointLight.Range = range
    pointLight.Parent = parent
    return pointLight
end

-- Create and add a SpotLight to a part
function LightingSDK.createSpotLight(parent, color, intensity, range, angle)
    local spotLight = Instance.new("SpotLight")
    spotLight.Color = color
    spotLight.Intensity = intensity
    spotLight.Range = range
    spotLight.Angle = angle
    spotLight.Parent = parent
    return spotLight
end

-- Create and add a SurfaceLight to a part
function LightingSDK.createSurfaceLight(parent, color, intensity, brightness)
    local surfaceLight = Instance.new("SurfaceLight")
    surfaceLight.Color = color
    surfaceLight.Intensity = intensity
    surfaceLight.Brightness = brightness
    surfaceLight.Parent = parent
    return surfaceLight
end

return LightingSDK
