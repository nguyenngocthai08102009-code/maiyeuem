-- 1. Gọi thư viện giao diện (Dùng Rayfield cho nhẹ và ổn định)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 2. Tạo Nút Tròn (Logo Button) để mở Menu
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game:GetService("CoreGui")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
-- Vị trí góc trên bên phải (X: 75%, Y: 15%)
ToggleButton.Position = UDim2.new(0.75, 0, 0.15, 0) 
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Image = "rbxassetid://15125345711" -- Icon tạm
ToggleButton.Draggable = true -- Có thể kéo nút đi chỗ khác

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ToggleButton

-- 3. Tạo Cửa Sổ Menu (Mặc định sẽ ẩn khi mới chạy)
local Window = Rayfield:CreateWindow({
   Name = "dexngoxhub",
   LoadingTitle = "Đang tải Script...",
   LoadingSubtitle = "by Nguyen Ngoc Thai",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- Tạo một Tab trống để Menu không bị lỗi
local Tab = Window:CreateTab("Trang Chủ", 4483362458)

-- Ẩn Menu lúc mới vào (chỉ hiện cái nút tròn thôi)
Rayfield:SetCloseCallback(function()
    print("Menu đã đóng")
end)

-- 4. Logic: Bấm nút tròn để Hiện/Ẩn Menu
ToggleButton.MouseButton1Click:Connect(function()
    -- Lệnh này sẽ bật/tắt hiển thị của Menu Rayfield
    local gui = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if gui then
        gui.Enabled = not gui.Enabled
    end
end)

Rayfield:Notify({
   Title = "Thành Công!",
   Content = "Script đã chạy. Bấm nút tròn để mở Menu!",
   Duration = 5,
   Image = 4483345998,
})
