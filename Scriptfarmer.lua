local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Clean up old UI if it exists
if playerGui:FindFirstChild("ScriptfarmerUI") then
    playerGui.ScriptfarmerUI:Destroy()
end

-- Create Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptfarmerUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 220)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 100) -- Neon Green
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Branding Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "SCRIPTFARMER"
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 24
Title.Parent = MainFrame

-- Key Input
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -40, 0, 40)
KeyInput.Position = UDim2.new(0, 20, 0, 55)
KeyInput.PlaceholderText = "Paste Key Here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 150, 100)
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 25, 20)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.TextSize = 14
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)
local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(0, 120, 50)
InputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
InputStroke.Parent = KeyInput

-- Verify Button
local CheckButton = Instance.new("TextButton")
CheckButton.Size = UDim2.new(1, -40, 0, 40)
CheckButton.Position = UDim2.new(0, 20, 0, 105)
CheckButton.Text = "CHECK KEY"
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 180, 70)
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextSize = 16
CheckButton.AutoButtonColor = true
CheckButton.Parent = MainFrame
Instance.new("UICorner", CheckButton).CornerRadius = UDim.new(0, 6)

---------------------------------------------------------
-- BOTTOM BUTTONS (Based on your exact PC/Mobile code)
---------------------------------------------------------

-- [ GET KEY BUTTON ]
local GetKeyBtn = Instance.new('TextButton')
GetKeyBtn.Size = UDim2.new(0, 110, 0, 40)
GetKeyBtn.Position = UDim2.new(0, 10, 0, 160)
GetKeyBtn.Text = 'Get Key'
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 14
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GetKeyBtn.BackgroundTransparency = 0.2
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.Parent = MainFrame
local GetKeyCorner = Instance.new('UICorner')
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

-- [ YOUTUBE BUTTON ]
local YoutubeButton = Instance.new('TextButton')
YoutubeButton.Size = UDim2.new(0, 110, 0, 40)
YoutubeButton.Position = UDim2.new(0, 125, 0, 160)
YoutubeButton.Text = 'YouTube'
YoutubeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YoutubeButton.TextSize = 14
YoutubeButton.Font = Enum.Font.GothamBold
YoutubeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YoutubeButton.BackgroundTransparency = 0.2
YoutubeButton.BorderSizePixel = 0
YoutubeButton.Parent = MainFrame
local YoutubeCorner = Instance.new('UICorner')
YoutubeCorner.CornerRadius = UDim.new(0, 6)
YoutubeCorner.Parent = YoutubeButton

-- [ DISCORD BUTTON ]
local DiscordButton = Instance.new('TextButton')
DiscordButton.Size = UDim2.new(0, 110, 0, 40)
DiscordButton.Position = UDim2.new(0, 240, 0, 160)
DiscordButton.Text = 'Discord'
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.TextSize = 14
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.BackgroundTransparency = 0.2
DiscordButton.BorderSizePixel = 0
DiscordButton.Parent = MainFrame
local DiscordCorner = Instance.new('UICorner')
DiscordCorner.CornerRadius = UDim.new(0, 6)
DiscordCorner.Parent = DiscordButton

---------------------------------------------------------
-- MOBILE COPY FALLBACK & LOGIC
---------------------------------------------------------

local FallbackFrame = Instance.new("Frame")
FallbackFrame.Size = UDim2.new(1, 0, 1, 0)
FallbackFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 12)
FallbackFrame.Visible = false
FallbackFrame.ZIndex = 10
FallbackFrame.Parent = MainFrame
Instance.new("UICorner", FallbackFrame).CornerRadius = UDim.new(0, 10)

local FallbackLabel = Instance.new("TextLabel")
FallbackLabel.Size = UDim2.new(1, 0, 0.3, 0)
FallbackLabel.Text = "Long press the link to copy:"
FallbackLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
FallbackLabel.BackgroundTransparency = 1
FallbackLabel.Font = Enum.Font.GothamBold
FallbackLabel.TextSize = 16
FallbackLabel.ZIndex = 11
FallbackLabel.Parent = FallbackFrame

local FallbackTextBox = Instance.new("TextBox")
FallbackTextBox.Size = UDim2.new(0.9, 0, 0.3, 0)
FallbackTextBox.Position = UDim2.new(0.05, 0, 0.35, 0)
FallbackTextBox.TextEditable = false
FallbackTextBox.ClearTextOnFocus = false
FallbackTextBox.BackgroundColor3 = Color3.fromRGB(20, 25, 20)
FallbackTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FallbackTextBox.TextSize = 12
FallbackTextBox.ZIndex = 11
FallbackTextBox.Parent = FallbackFrame
Instance.new("UICorner", FallbackTextBox).CornerRadius = UDim.new(0, 6)

local CloseFallback = Instance.new("TextButton")
CloseFallback.Size = UDim2.new(0.5, 0, 0.2, 0)
CloseFallback.Position = UDim2.new(0.25, 0, 0.75, 0)
CloseFallback.Text = "CLOSE"
CloseFallback.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseFallback.TextColor3 = Color3.new(1, 1, 1)
CloseFallback.Font = Enum.Font.GothamBold
CloseFallback.ZIndex = 11
CloseFallback.Parent = FallbackFrame
Instance.new("UICorner", CloseFallback).CornerRadius = UDim.new(0, 6)

-- Logic
CloseFallback.Activated:Connect(function()
    FallbackFrame.Visible = false
end)

local function copyLink(url)
    pcall(function()
        if setclipboard then setclipboard(url) 
        elseif toclipboard then toclipboard(url) 
        end
    end)
    FallbackTextBox.Text = url
    FallbackFrame.Visible = true
end

local function playSuccessAnimation()
    local shrinkInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    local shrinkTween = TweenService:Create(MainFrame, shrinkInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1
    })
    
    local fadeTween = TweenService:Create(MainStroke, shrinkInfo, {Transparency = 1})
    local textFade1 = TweenService:Create(CheckButton, shrinkInfo, {TextTransparency = 1, BackgroundTransparency = 1})
    local textFade2 = TweenService:Create(KeyInput, shrinkInfo, {TextTransparency = 1, BackgroundTransparency = 1})
    
    shrinkTween:Play()
    fadeTween:Play()
    textFade1:Play()
    textFade2:Play()
    
    shrinkTween.Completed:Wait()
    ScreenGui:Destroy()
end

CheckButton.Activated:Connect(function()
    if string.match(KeyInput.Text, "GAG_SCRIPTHUB_568") then
        CheckButton.Text = "ACCESS GRANTED"
        CheckButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        
        playSuccessAnimation()
        
        local success, result = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/INF-Hub-PL/GrowaGarden2_/refs/heads/main/main_v1.5")
        end)
        
        if success and not string.match(result, "404: Not Found") and result ~= "" then
            pcall(function() loadstring(result)() end)
        else
            warn("Error 404: The script link provided is currently dead.")
        end
    else
        CheckButton.Text = "INVALID KEY"
        CheckButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        CheckButton.Text = "CHECK KEY"
        CheckButton.BackgroundColor3 = Color3.fromRGB(0, 180, 70)
    end
end)

GetKeyBtn.Activated:Connect(function()
    copyLink("https://youtube.com/@scriptfarmer2.0?si=c7Nd04r3G2zX72rE")
end)

YoutubeButton.Activated:Connect(function()
    copyLink("https://youtube.com/@scriptfarmer2.0?si=c7Nd04r3G2zX72rE")
end)

DiscordButton.Activated:Connect(function()
    copyLink("https://discord.gg/7q2TvZ9GYX")
end)
