-- SDK for Network Management

local NetworkSDK = {}

-- Roblox Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Create a RemoteEvent
function NetworkSDK.createRemoteEvent(name)
    local remoteEvent = Instance.new("RemoteEvent")
    remoteEvent.Name = name or "RemoteEvent"
    remoteEvent.Parent = ReplicatedStorage
    return remoteEvent
end

-- Create a RemoteFunction
function NetworkSDK.createRemoteFunction(name)
    local remoteFunction = Instance.new("RemoteFunction")
    remoteFunction.Name = name or "RemoteFunction"
    remoteFunction.Parent = ReplicatedStorage
    return remoteFunction
end

-- Edit RemoteEvent name
function NetworkSDK.editRemoteEventName(oldName, newName)
    local remoteEvent = ReplicatedStorage:FindFirstChild(oldName)
    if remoteEvent and remoteEvent:IsA("RemoteEvent") then
        remoteEvent.Name = newName or oldName
    end
end

-- Edit RemoteFunction name
function NetworkSDK.editRemoteFunctionName(oldName, newName)
    local remoteFunction = ReplicatedStorage:FindFirstChild(oldName)
    if remoteFunction and remoteFunction:IsA("RemoteFunction") then
        remoteFunction.Name = newName or oldName
    end
end

-- Edit RemoteEvent path
function NetworkSDK.editRemoteEventPath(name, newParent)
    local remoteEvent = ReplicatedStorage:FindFirstChild(name)
    if remoteEvent and remoteEvent:IsA("RemoteEvent") then
        remoteEvent.Parent = newParent or ReplicatedStorage
    end
end

-- Edit RemoteFunction path
function NetworkSDK.editRemoteFunctionPath(name, newParent)
    local remoteFunction = ReplicatedStorage:FindFirstChild(name)
    if remoteFunction and remoteFunction:IsA("RemoteFunction") then
        remoteFunction.Parent = newParent or ReplicatedStorage
    end
end

-- Fire RemoteEvent to all clients
function NetworkSDK.fireRemoteEvent(name, ...)
    local remoteEvent = ReplicatedStorage:FindFirstChild(name)
    if remoteEvent and remoteEvent:IsA("RemoteEvent") then
        remoteEvent:FireAllClients(...)
    end
end

-- Fire RemoteEvent to a specific player
function NetworkSDK.fireRemoteEventToPlayer(player, name, ...)
    local remoteEvent = ReplicatedStorage:FindFirstChild(name)
    if remoteEvent and remoteEvent:IsA("RemoteEvent") then
        remoteEvent:FireClient(player, ...)
    end
end

-- Invoke RemoteFunction from client
function NetworkSDK.invokeRemoteFunction(name, ...)
    local remoteFunction = ReplicatedStorage:FindFirstChild(name)
    if remoteFunction and remoteFunction:IsA("RemoteFunction") then
        return remoteFunction:InvokeServer(...)
    end
end

-- Set RemoteFunction callback
function NetworkSDK.setRemoteFunctionCallback(name, callback)
    local remoteFunction = ReplicatedStorage:FindFirstChild(name)
    if remoteFunction and remoteFunction:IsA("RemoteFunction") then
        remoteFunction.OnServerInvoke = callback
    end
end

return NetworkSDK
