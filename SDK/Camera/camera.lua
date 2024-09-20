-- SDK for Camera Manipulation

local CameraSDK = {}

-- Roblox Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Get the local player's camera
local function getCamera()
    local player = Players.LocalPlayer
    if player then
        return player:FindFirstChildOfClass("Camera") or Workspace.CurrentCamera
    end
    return nil
end

-- 1. Camera Manipulation

-- Set the camera's CFrame
function CameraSDK.setCameraCFrame(cframe)
    local camera = getCamera()
    if camera then
        camera.CFrame = cframe
    end
end

-- Get the camera's current CFrame
function CameraSDK.getCameraCFrame()
    local camera = getCamera()
    if camera then
        return camera.CFrame
    end
    return nil
end

-- Set the camera's Field of View (FOV)
function CameraSDK.setCameraFOV(fov)
    local camera = getCamera()
    if camera then
        camera.FieldOfView = fov
    end
end

-- Get the camera's current FOV
function CameraSDK.getCameraFOV()
    local camera = getCamera()
    if camera then
        return camera.FieldOfView
    end
    return nil
end

-- Set the camera's subject (focus on a specific part or model)
function CameraSDK.setCameraSubject(subject)
    local camera = getCamera()
    if camera then
        camera.CameraSubject = subject
    end
end

-- Reset the camera to the default view
function CameraSDK.resetCamera()
    local camera = getCamera()
    if camera then
        camera.CFrame = CFrame.new(Vector3.new(0, 5, 10), Vector3.new(0, 5, 0))  -- Default position and orientation
        camera.FieldOfView = 70  -- Default FOV
    end
end

-- 2. Camera Effects

-- Apply a camera shake effect
function CameraSDK.cameraShake(intensity, duration)
    local camera = getCamera()
    if camera then
        local originalCFrame = camera.CFrame
        local startTime = tick()

        while tick() - startTime < duration do
            camera.CFrame = originalCFrame * CFrame.new(math.random() * intensity, math.random() * intensity, math.random() * intensity)
            wait(0.1)
        end

        camera.CFrame = originalCFrame  -- Reset camera to original CFrame
    end
end

return CameraSDK
