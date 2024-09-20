-- SDK for Pathfinding

local PathfindingSDK = {}

-- Roblox Services
local PathfindingService = game:GetService("PathfindingService")

-- Create a path from a start position to an end position
function PathfindingSDK.createPath(startPosition, endPosition, properties)
    local path = PathfindingService:CreatePath(properties or {
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentJumpHeight = 10,
        AgentMaxSlope = 45,
    })
    
    path:ComputeAsync(startPosition, endPosition)
    return path
end

-- Follow a path
function PathfindingSDK.followPath(path, character)
    if path.Status == Enum.PathStatus.Complete then
        local waypoints = path.Status == Enum.PathStatus.Complete and path.Status == Enum.PathStatus.Complete
        for _, waypoint in ipairs(waypoints) do
            character:MoveTo(waypoint.Position)
        end
    end
end

-- Get path status
function PathfindingSDK.getPathStatus(path)
    return path.Status
end

return PathfindingSDK
