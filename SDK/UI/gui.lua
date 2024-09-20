-- SDK for GUI Management

local GuiSDK = {}

-- Roblox Services
local Players = game:GetService("Players")

-- Create a new ScreenGui
function GuiSDK.createScreenGui(name, parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name or "ScreenGui"
    screenGui.Parent = parent or Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

-- Create a new Frame
function GuiSDK.createFrame(parent, size, position, backgroundColor, name)
    local frame = Instance.new("Frame")
    frame.Size = size or UDim2.new(0, 200, 0, 100)
    frame.Position = position or UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = backgroundColor or Color3.fromRGB(255, 255, 255)
    frame.Name = name or "Frame"
    frame.Parent = parent
    return frame
end

-- Create a new TextButton
function GuiSDK.createTextButton(parent, text, size, position, textColor, backgroundColor, name)
    local button = Instance.new("TextButton")
    button.Text = text or "Button"
    button.Size = size or UDim2.new(0, 200, 0, 50)
    button.Position = position or UDim2.new(0.5, -100, 0.5, -25)
    button.TextColor3 = textColor or Color3.fromRGB(0, 0, 0)
    button.BackgroundColor3 = backgroundColor or Color3.fromRGB(200, 200, 200)
    button.Name = name or "TextButton"
    button.Parent = parent
    return button
end

-- Create a new TextLabel
function GuiSDK.createTextLabel(parent, text, size, position, textColor, backgroundColor, name)
    local label = Instance.new("TextLabel")
    label.Text = text or "Label"
    label.Size = size or UDim2.new(0, 200, 0, 50)
    label.Position = position or UDim2.new(0.5, -100, 0.5, -25)
    label.TextColor3 = textColor or Color3.fromRGB(0, 0, 0)
    label.BackgroundColor3 = backgroundColor or Color3.fromRGB(200, 200, 200)
    label.Name = name or "TextLabel"
    label.Parent = parent
    return label
end

-- Create a new ImageLabel
function GuiSDK.createImageLabel(parent, image, size, position, name)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Image = image or ""
    imageLabel.Size = size or UDim2.new(0, 200, 0, 100)
    imageLabel.Position = position or UDim2.new(0.5, -100, 0.5, -50)
    imageLabel.Name = name or "ImageLabel"
    imageLabel.Parent = parent
    return imageLabel
end

-- Create a new ImageButton
function GuiSDK.createImageButton(parent, image, size, position, name)
    local imageButton = Instance.new("ImageButton")
    imageButton.Image = image or ""
    imageButton.Size = size or UDim2.new(0, 200, 0, 100)
    imageButton.Position = position or UDim2.new(0.5, -100, 0.5, -50)
    imageButton.Name = name or "ImageButton"
    imageButton.Parent = parent
    return imageButton
end

-- Remove a GUI element by name
function GuiSDK.removeElementByName(parent, name)
    local element = parent:FindFirstChild(name)
    if element then
        element:Destroy()
    end
end

-- Remove a GUI element by path
function GuiSDK.removeElementByPath(path)
    local element = path and path:FindFirstChildOfClass("GuiBase")
    if element then
        element:Destroy()
    end
end

-- Update properties of a GUI element by name
function GuiSDK.updateElementByName(parent, name, properties)
    local element = parent:FindFirstChild(name)
    if element and properties then
        for property, value in pairs(properties) do
            element[property] = value
        end
    end
end

-- Update properties of a GUI element by path
function GuiSDK.updateElementByPath(path, properties)
    local element = path and path:FindFirstChildOfClass("GuiBase")
    if element and properties then
        for property, value in pairs(properties) do
            element[property] = value
        end
    end
end

-- Get GUI element by name
function GuiSDK.getElementByName(parent, name)
    return parent:FindFirstChild(name)
end

-- Get GUI element by path
function GuiSDK.getElementByPath(path)
    return path and path:FindFirstChildOfClass("GuiBase")
end

return GuiSDK
