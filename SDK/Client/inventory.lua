-- SDK for Inventory Management

local InventorySDK = {}

-- Roblox Services
local Players = game:GetService("Players")

-- Check if the player has a specific item in their backpack
local function hasItemInBackpack(player, itemName)
    local backpack = player.Backpack
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == itemName then
            return true
        end
    end
    return false
end

-- Hold an item by name (if available in the player's inventory)
function InventorySDK.holdItem(player, itemName)
    if not player or not itemName then
        return
    end

    -- Check if the player has the item in their backpack
    if hasItemInBackpack(player, itemName) then
        -- Find the item and equip it
        local backpack = player.Backpack
        local item = backpack:FindFirstChild(itemName)
        if item and item:IsA("Tool") then
            item.Parent = player.Character
        end
    else
        warn("Player does not have item:", itemName)
    end
end

-- Remove an item from the player's character
function InventorySDK.removeItemFromCharacter(player, itemName)
    local character = player.Character
    if character then
        local item = character:FindFirstChild(itemName)
        if item and item:IsA("Tool") then
            item.Parent = player.Backpack
        end
    end
end

-- Equip an item directly to the player's character (without checking inventory)
function InventorySDK.equipItem(player, item)
    local character = player.Character
    if character and item and item:IsA("Tool") then
        item.Parent = character
    end
end

-- Unequip all items from the player's character
function InventorySDK.unequipAll(player)
    local character = player.Character
    if character then
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") then
                item.Parent = player.Backpack
            end
        end
    end
end

return InventorySDK
