-- SDK for Effects Management

local EffectsSDK = {}

-- Roblox Services
local Workspace = game:GetService("Workspace")

-- Create a new particle effect
function EffectsSDK.createParticleEffect(effectName, position, parent)
    local effect = Instance.new(effectName)
    effect.Position = position
    effect.Parent = parent or Workspace
    return effect
end

-- Remove a particle effect
function EffectsSDK.removeParticleEffect(effect)
    if effect then
        effect:Destroy()
    end
end

-- Set properties of a particle effect
function EffectsSDK.setParticleEffectProperties(effect, properties)
    if effect and properties then
        for property, value in pairs(properties) do
            effect[property] = value
        end
    end
end

-- Stop all particle effects in a parent
function EffectsSDK.stopAllEffects(parent)
    for _, child in ipairs((parent or Workspace):GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Destroy()
        end
    end
end

return EffectsSDK
