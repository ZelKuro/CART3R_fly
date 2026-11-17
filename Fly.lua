
-- CART3R.JAILBREAK
-- FLY GUI INTERFACE
-- Interface mobile et PC

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "CART3RFly"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(250, 190)
frame.Position = UDim2.new(0.5, -125, 0.5, -95)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 25, 50)
border.Thickness = 2
border.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "CART3R | FLY"
title.TextColor3 = Color3.fromRGB(255, 35, 55)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = frame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0.8, 0, 0, 38)
toggle.Position = UDim2.new(0.1, 0, 0, 50)
toggle.BackgroundColor3 = Color3.fromRGB(130, 20, 30)
toggle.Text = "FLY : OFF"
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.TextSize = 15
toggle.Font = Enum.Font.GothamBold
toggle.Parent = frame

Instance.new("UICorner", toggle).CornerRadius =
    UDim.new(0, 8)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 25)
label.Position = UDim2.new(0, 0, 0, 100)
label.BackgroundTransparency = 1
label.Text = "SPEED : 50"
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.Gotham
label.TextSize = 14
label.Parent = frame

local slider = Instance.new("TextButton")
slider.Size = UDim2.new(0.8, 0, 0, 12)
slider.Position = UDim2.new(0.1, 0, 0, 140)
slider.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
slider.Text = ""
slider.Parent = frame

Instance.new("UICorner", slider).CornerRadius =
    UDim.new(1, 0)

local fill = Instance.new("Frame")
fill.Size = UDim2.new(0.5, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(255, 35, 55)
fill.Parent = slider

Instance.new("UICorner", fill).CornerRadius =
    UDim.new(1, 0)

local enabled = false
local speed = 50
local dragging = false

local function updateSpeed(input)
    local x = math.clamp(
        (input.Position.X - slider.AbsolutePosition.X)
        / slider.AbsoluteSize.X, 0, 1
    )

    speed = math.floor(1 + x * 99)

    fill.Size = UDim2.new(x, 0, 1, 0)
    label.Text = "SPEED : " .. speed
end

slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        updateSpeed(input)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging then
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSpeed(input)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

toggle.Activated:Connect(function()
    enabled = not enabled

    toggle.Text = enabled and "FLY : ON" or "FLY : OFF"

    toggle.BackgroundColor3 = enabled
        and Color3.fromRGB(20, 130, 60)
        or Color3.fromRGB(130, 20, 30)
end)

print("CART3R GUI LOADED")
