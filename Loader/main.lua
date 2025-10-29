local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local urlVip = "https://raw.githubusercontent.com/putraborz/VerifikasiScWata/refs/heads/main/Loader/vip.txt"
local urlSatuan = "https://raw.githubusercontent.com/putraborz/VerifikasiScWata/refs/heads/main/Loader/1.txt"

local successUrls = {
    "https://raw.githubusercontent.com/putraborz/WataXMountAtin/main/Loader/WataX.lua",
    "https://raw.githubusercontent.com/putraborz/WataXMountAtin/main/Loader/mainmap792.lua"
}

local TIKTOK_LINK = "https://www.tiktok.com/@alex"
local DISCORD_LINK = "https://discord.gg/tfNqRQsqHK"

local function fetch(url)
    local ok, res = pcall(function()
        return game:HttpGet(url, true)
    end)
    return ok and res or nil
end

local function isVerified(uname)
    local vip = fetch(urlVip)
    local sat = fetch(urlSatuan)
    if not vip or not sat then return false end
    uname = uname:lower()

    local function checkList(list)
        for line in list:gmatch("[^\r\n]+") do
            local nameOnly = line:match("^(.-)%s*%-%-") or line
            nameOnly = nameOnly:match("^%s*(.-)%s*$")
            if nameOnly:lower() == uname then
                return true
            end
        end
        return false
    end

    return checkList(vip) or checkList(sat)
end

local function notify(title, text, duration)
    local ok = pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Info",
            Text = text or "",
            Duration = duration or 4
        })
    end)
    if not ok then
        print(("[%s] %s"):format(title or "Info", text or ""))
    end
end

-- GUI utama
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "LexLoader"
gui.ResetOnSpawn = false

-- === TEKS LEXHOST DI POJOK KIRI ATAS ===
local lexHostCorner = Instance.new("TextLabel", gui)
lexHostCorner.Size = UDim2.new(0, 200, 0, 30)
lexHostCorner.Position = UDim2.new(0, 10, 0, 10)
lexHostCorner.BackgroundTransparency = 1
lexHostCorner.Font = Enum.Font.GothamBold
lexHostCorner.TextSize = 20
lexHostCorner.Text = "LexHost"
lexHostCorner.TextColor3 = Color3.fromRGB(255, 0, 0)
lexHostCorner.TextXAlignment = Enum.TextXAlignment.Left
lexHostCorner.TextYAlignment = Enum.TextYAlignment.Top

-- RGB animasi untuk teks LexHost
task.spawn(function()
    local hue = 0
    while lexHostCorner.Parent do
        hue = (hue + 0.005) % 1
        lexHostCorner.TextColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait(0.03)
    end
end)

-- === FRAME UTAMA ===
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 1
frame.Size = UDim2.new(0, 100, 0, 60)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2

TweenService:Create(frame, TweenInfo.new(0), {BackgroundTransparency = 1}):Play()
task.wait(0.1)
TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 200),
    BackgroundTransparency = 0
}):Play()

task.spawn(function()
    local hue = 0
    while frame.Parent do
        hue = (hue + 0.002) % 1
        stroke.Color = Color3.fromHSV(hue, 1, 1)
        task.wait(0.02)
    end
end)

-- Label LexHost kecil (bawah kanan frame)
local lexHost = Instance.new("TextLabel", frame)
lexHost.Size = UDim2.new(0, 100, 0, 20)
lexHost.Position = UDim2.new(1, -105, 1, -25)
lexHost.BackgroundTransparency = 1
lexHost.Font = Enum.Font.GothamBold
lexHost.Text = "LexHost"
lexHost.TextSize = 14
lexHost.TextColor3 = Color3.fromRGB(255, 0, 0)
lexHost.TextXAlignment = Enum.TextXAlignment.Right

task.spawn(function()
    local hue = 0
    while lexHost.Parent do
        hue = (hue + 0.01) % 1
        lexHost.TextColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait(0.05)
    end
end)

-- Tombol close
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 100, 0, 60),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.4)
    gui:Destroy()
end)

-- Avatar, tombol, dan verifikasi (tidak diubah dari aslinya)
-- ...

