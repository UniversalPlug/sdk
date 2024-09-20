local SDKLoader = {}

-- Paths for each SDK module
local sdkPaths = {
    --// Client
    player = "SDK/Client/player.lua",
    animations = "SDK/Client/animations.lua",
    inventory = "SDK/Client/inventory.lua",
    pathfinding = "SDK/Client/pathfinding.lua",

    --// Camera
    camera = "SDK/Camera/camera.lua",

    --// Network
    network = "SDK/Network/network.lua",

    --// World
    world = "SDK/World/world.lua",
    effects = "SDK/World/effects.lua",
    lighting = "SDK/World/lighting.lua",
    sound = "SDK/World/sound.lua",
 
    --// UI
    gui = "SDK/UI/gui.lua",
}

-- Function to load an SDK module
local function loadSDKModule(moduleName)
    local path = sdkPaths[moduleName]
    if path then
        local url = "https://raw.githubusercontent.com/UniversalPlug/sdk/main/" .. path
        print("Loading SDK module from:", url)  -- Debugging line
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)
        if success then
            SDKLoader[moduleName] = result
            print("Successfully loaded SDK module:", moduleName)  -- Debugging line
        else
            warn("Failed to load SDK module:", moduleName, "Error:", result)
        end
    else
        warn("SDK module path not found:", moduleName)
    end
end

-- Load all SDK modules
function SDKLoader.loadAll()
    for moduleName in pairs(sdkPaths) do
        loadSDKModule(moduleName)
    end
end

-- Load a specific SDK module
function SDKLoader.load(moduleName)
    loadSDKModule(moduleName)
end

return SDKLoader
