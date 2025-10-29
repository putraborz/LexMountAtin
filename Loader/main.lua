local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- URL script utama (langsung dijalankan)
local successUrls = {
    "https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/WataX.lua",
    "https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/mainmap792.lua"
}

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

-- GUI sederhana (opsional)
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "WataXLoader"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 150)
frame.Position = UDim2.new(0.5, -160, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", frame).Color = Color3.fromRGB(255,255,255)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "WataX Loader"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 30)
status.Position = UDim2.new(0, 10, 0, 70)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,255,255)
status.Text = "⏳ Memuat script..."

task.spawn(function()
    task.wait(1)
    for _,url in ipairs(successUrls) do
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if ok then
            notify("WataX", "✅ Script dimuat dari:\n" .. url, 3)
        else
            warn("Gagal memuat:", url, err)
            notify("WataX", "⚠️ Gagal memuat script dari:\n" .. url, 4)
        end
    end
    status.Text = "✅ Semua script sudah dijalankan!"
    task.wait(1)
    if gui and gui.Parent then gui:Destroy() end
end)
