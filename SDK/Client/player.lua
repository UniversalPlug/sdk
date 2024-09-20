-- SDK for LocalPlayer

local LocalPlayerSDK = {}

-- Roblox Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

-- Ensure the player's character exists
local function GetHumanoid()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
end

-- 1. Movement

-- Set walk speed
function LocalPlayerSDK.setWalkSpeed(speed)
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

-- Set jump power
function LocalPlayerSDK.setJumpPower(jumpPower)
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.JumpPower = jumpPower
    end
end

-- Set custom gravity (affects local player only)
function LocalPlayerSDK.setGravity(gravityValue)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, gravityValue, 0)
    end
end

-- Sprint by increasing walk speed temporarily
function LocalPlayerSDK.startSprint(speedBoost)
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.WalkSpeed = humanoid.WalkSpeed + speedBoost
    end
end

-- Stop sprinting and return to normal speed
function LocalPlayerSDK.stopSprint(normalSpeed)
    LocalPlayerSDK.setWalkSpeed(normalSpeed)
end

-- 2. Camera Manipulation

function LocalPlayerSDK.setFieldOfView(fov)
    workspace.CurrentCamera.FieldOfView = fov
end

-- 3. Health and Regeneration

-- Get current health
function LocalPlayerSDK.getHealth()
    local humanoid = GetHumanoid()
    if humanoid then
        return humanoid.Health
    end
end

-- Set health to a specific value
function LocalPlayerSDK.setHealth(health)
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.Health = health
    end
end

-- Regenerate health gradually
function LocalPlayerSDK.regenerateHealth(amount)
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + amount)
    end
end

-- 4. Teleportation

function LocalPlayerSDK.teleportToPosition(position)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- 5. Visibility and Transparency

function LocalPlayerSDK.setInvisible()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false -- Disable collisions
            end
        end
    end
end

function LocalPlayerSDK.setVisible()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                part.CanCollide = true -- Enable collisions
            end
        end
    end
end

-- 6. Inventory and Tools

-- Equip tool from inventory
function LocalPlayerSDK.equipTool(toolName)
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        local tool = backpack:FindFirstChild(toolName)
        if tool then
            tool.Parent = LocalPlayer.Character
        end
    end
end

-- Unequip tool and send it back to backpack
function LocalPlayerSDK.unequipTool()
    if LocalPlayer.Character then
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            tool.Parent = LocalPlayer:FindFirstChild("Backpack")
        end
    end
end

-- Drop current tool
function LocalPlayerSDK.dropTool()
    if LocalPlayer.Character then
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            tool.Parent = workspace
        end
    end
end

-- 7. Interacting with Other Players

-- Find the nearest player to local player
function LocalPlayerSDK.findNearestPlayer()
    local nearestPlayer = nil
    local nearestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

-- Teleport to nearest player
function LocalPlayerSDK.teleportToNearestPlayer()
    local nearestPlayer = LocalPlayerSDK.findNearestPlayer()
    if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = nearestPlayer.Character.HumanoidRootPart.CFrame
    end
end

-- 8. Crouch Functionality

-- Crouch (simulate by reducing size and speed)
function LocalPlayerSDK.crouch()
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.WalkSpeed = humanoid.WalkSpeed / 2
        LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1) -- Smaller character size
    end
end

-- Stand (return to normal size and speed)
function LocalPlayerSDK.stand()
    local humanoid = GetHumanoid()
    if humanoid then
        humanoid.WalkSpeed = humanoid.WalkSpeed * 2
        LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 2) -- Normal size
    end
end

return LocalPlayerSDK
