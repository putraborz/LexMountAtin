-- 🟣 UI LEX HOST Neon Style
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LEXReplayUI"
screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 130)
frame.Position = UDim2.new(0.05, 0, 0.75, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
frame.BackgroundTransparency = 0.2
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local glow = Instance.new("UIStroke")
glow.Parent = frame
glow.Color = Color3.fromRGB(150, 100, 255)
glow.Thickness = 3
glow.Transparency = 0.3

-- ✨ Judul LEX HOST dengan efek neon
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0.75, 0, 0, 28)
title.Position = UDim2.new(0.05, 0, 0, 4)
title.Text = "LEX HOST"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 0.2
title.BackgroundColor3 = Color3.fromRGB(60, 40, 100)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 12)

-- 🌈 Animasi warna pelangi pada teks
local hue = 0
game:GetService("RunService").RenderStepped:Connect(function()
    hue = (hue + 1) % 360
    title.TextColor3 = Color3.fromHSV(hue / 360, 1, 1)
end)

-- 🔆 Cahaya neon luar untuk teks
local titleGlow = Instance.new("UIStroke")
titleGlow.Parent = title
titleGlow.Color = Color3.fromRGB(255, 255, 255)
titleGlow.Thickness = 2
titleGlow.Transparency = 0.4

-- ❌ Tombol close
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(0.78, 0, 0, 4)
closeBtn.Text = "✖"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 10)

local closeGlow = Instance.new("UIStroke")
closeGlow.Parent = closeBtn
closeGlow.Color = Color3.fromRGB(255, 50, 100)
closeGlow.Thickness = 2
closeGlow.Transparency = 0.6

closeBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(closeGlow, TweenInfo.new(0.2), {Transparency = 0.1, Thickness = 4}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(closeGlow, TweenInfo.new(0.2), {Transparency = 0.6, Thickness = 2}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ▶ Tombol Start/Stop
local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0.8, 0, 0.25, 0)
toggleBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
toggleBtn.Text = "▶ Start"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 200, 120)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 14)

local toggleGlow = Instance.new("UIStroke")
toggleGlow.Parent = toggleBtn
toggleGlow.Color = Color3.fromRGB(0, 255, 255)
toggleGlow.Thickness = 2
toggleGlow.Transparency = 0.4

toggleBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(toggleGlow, TweenInfo.new(0.2), {Transparency = 0.1, Thickness = 4}):Play()
end)
toggleBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(toggleGlow, TweenInfo.new(0.2), {Transparency = 0.4, Thickness = 2}):Play()
end)

-- 🔢 Label kecepatan
local speedLabel = Instance.new("TextLabel", frame)
speedLabel.Size = UDim2.new(0.35, 0, 0.2, 0)
speedLabel.Position = UDim2.new(0.325, 0, 0.7, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextScaled = true
speedLabel.Text = "1x"

local speedDown = Instance.new("TextButton", frame)
speedDown.Size = UDim2.new(0.2, 0, 0.2, 0)
speedDown.Position = UDim2.new(0.05, 0, 0.7, 0)
speedDown.Text = "-"
speedDown.Font = Enum.Font.GothamBold
speedDown.TextScaled = true
speedDown.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
speedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", speedDown).CornerRadius = UDim.new(0, 6)

local speedUp = Instance.new("TextButton", frame)
speedUp.Size = UDim2.new(0.2, 0, 0.2, 0)
speedUp.Position = UDim2.new(0.75, 0, 0.7, 0)
speedUp.Text = "+"
speedUp.Font = Enum.Font.GothamBold
speedUp.TextScaled = true
speedUp.BackgroundColor3 = Color3.fromRGB(80, 80, 130)
speedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", speedUp).CornerRadius = UDim.new(0, 6)
