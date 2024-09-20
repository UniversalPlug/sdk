-- SDK for Sound Manipulation

local SoundSDK = {}

-- Roblox Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Create a new sound
function SoundSDK.createSound(parent, soundId, volume, pitch, name)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId or ""
    sound.Volume = volume or 1
    sound.Pitch = pitch or 1
    sound.Name = name or "Sound"
    sound.Parent = parent or Workspace
    return sound
end

-- Remove a specific sound by name
function SoundSDK.removeSoundByName(name)
    local sound = Workspace:FindFirstChild(name)
    if sound and sound:IsA("Sound") then
        sound:Destroy()
    end
end

-- Set the SoundId of a specific sound
function SoundSDK.setSoundId(sound, soundId)
    if sound and sound:IsA("Sound") then
        sound.SoundId = soundId
    end
end

-- Set the volume of a specific sound
function SoundSDK.setVolume(sound, volume)
    if sound and sound:IsA("Sound") then
        sound.Volume = volume
    end
end

-- Set the pitch of a specific sound
function SoundSDK.setPitch(sound, pitch)
    if sound and sound:IsA("Sound") then
        sound.Pitch = pitch
    end
end

-- Set the playback state of a specific sound
function SoundSDK.setPlaybackState(sound, isPlaying)
    if sound and sound:IsA("Sound") then
        if isPlaying then
            sound:Play()
        else
            sound:Stop()
        end
    end
end

-- Get all sounds in the parent
function SoundSDK.getAllSounds(parent)
    local sounds = {}
    for _, child in ipairs((parent or Workspace):GetChildren()) do
        if child:IsA("Sound") then
            table.insert(sounds, child)
        end
    end
    return sounds
end

-- Update sound properties
function SoundSDK.updateSound(sound, properties)
    if sound and sound:IsA("Sound") and properties then
        for property, value in pairs(properties) do
            sound[property] = value
        end
    end
end

return SoundSDK
