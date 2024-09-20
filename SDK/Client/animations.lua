-- SDK for Animation Management

local AnimationsSDK = {}

-- Roblox Services
local Players = game:GetService("Players")

-- Play an animation on a character
function AnimationsSDK.playAnimation(character, animationId)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. animationId
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
        return animationTrack
    end
    return nil
end

-- Stop an animation on a character
function AnimationsSDK.stopAnimation(animationTrack)
    if animationTrack then
        animationTrack:Stop()
    end
end

-- Set animation speed
function AnimationsSDK.setAnimationSpeed(animationTrack, speed)
    if animationTrack then
        animationTrack.Speed = speed
    end
end

return AnimationsSDK
