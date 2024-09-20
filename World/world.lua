-- SDK for World Manipulation

local WorldSDK = {}

-- Roblox Services
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

-- 1. Time and Lighting Manipulation

-- Set time of day (in-game time)
function WorldSDK.setTimeOfDay(time)
    Lighting.TimeOfDay = tostring(time)
end

-- Set brightness level
function WorldSDK.setBrightness(level)
    Lighting.Brightness = level
end

-- Toggle between day and night
function WorldSDK.toggleDayNight(isDay)
    if isDay then
        WorldSDK.setTimeOfDay(14)  -- Set to 2 PM (daytime)
        WorldSDK.setBrightness(2)
    else
        WorldSDK.setTimeOfDay(0)   -- Set to midnight (nighttime)
        WorldSDK.setBrightness(0.5)
    end
end

-- Set ambient light color
function WorldSDK.setAmbientLightColor(color)
    Lighting.Ambient = color
end

-- 2. Weather Manipulation

-- Enable or disable fog
function WorldSDK.setFogEnabled(enabled)
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
function WorldSDK.setFogColor(color)
    Lighting.FogColor = color
end

-- 3. Gravity Control

-- Set gravity for the entire world
function WorldSDK.setGlobalGravity(gravity)
    Workspace.Gravity = gravity
end

-- 4. Terrain Manipulation

-- Clear all terrain in the workspace
function WorldSDK.clearTerrain()
    for _, terrain in pairs(Workspace:GetDescendants()) do
        if terrain:IsA("Terrain") then
            terrain:Clear()  -- Clear any existing terrain
        end
    end
end

-- Spawn terrain at a specific location
function WorldSDK.spawnTerrain(cframe, size)
    local terrain = Workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        terrain:FillBlock(cframe, size, Enum.Material.Grass)
    end
end

-- 5. Entity/Model Manipulation

-- Spawn a model or entity in the world
function WorldSDK.spawnEntity(entityModel, position)
    local model = entityModel:Clone()
    model.Parent = Workspace
    model:SetPrimaryPartCFrame(CFrame.new(position))
end

-- Remove a specific entity from the world by name
function WorldSDK.removeEntityByName(name)
    local entity = Workspace:FindFirstChild(name)
    if entity then
        entity:Destroy()
    end
end

-- Remove all entities of a specific class (e.g., 'Part', 'Model')
function WorldSDK.removeAllEntitiesByClass(classType)
    for _, entity in pairs(Workspace:GetChildren()) do
        if entity:IsA(classType) then
            entity:Destroy()
        end
    end
end

-- 6. Interaction with Other Players

-- Teleport all players to a specific position
function WorldSDK.teleportAllPlayers(position)
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
        end
    end
end

-- Remove all players from the game world (kill them)
function WorldSDK.removeAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0  -- Set health to 0 (kills them)
        end
    end
end

return WorldSDK
