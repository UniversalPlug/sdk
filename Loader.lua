local SDKLoader = {}

local sdkPaths = {
    player = "SDK/Client/player.lua",
    animations = "SDK/Client/animations.lua",
    inventory = "SDK/Client/inventory.lua",
    pathfinding = "SDK/Client/pathfinding.lua",

    camera = "SDK/Camera/camera.lua",

    network = "SDK/Network/network.lua",

    world = "SDK/World/world.lua",
    effects = "SDK/World/effects.lua",
    lighting = "SDK/World/lighting.lua",
    sound = "SDK/World/sound.lua",
 
    gui = "SDK/UI/gui.lua",
 

}

local function loadSDKModule(moduleName)
    local path = sdkPaths[moduleName]
    if path then
        local success, result = pcall(function()
            return loadstring(game:HttpGet("raw.githubusercontent.com/UniversalPlug/sdk/refs/heads/main/" .. path))()
        end)
        if success then
            SDKLoader[moduleName] = result
        else
            warn("Failed to load SDK module:", moduleName)
        end
    else
        warn("SDK module path not found:", moduleName)
    end
end

function SDKLoader.loadAll()
    for moduleName in pairs(sdkPaths) do
        loadSDKModule(moduleName)
    end
end

function SDKLoader.load(moduleName)
    loadSDKModule(moduleName)
end

return SDKLoader
