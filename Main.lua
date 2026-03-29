-- 1. Gọi thư viện Redz Library (Bản chuẩn cho Mobile)
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/redzui"))()

-- 2. Tạo Cửa Sổ Menu
local Window = RedzLib:MakeWindow({
  Name = "memehub",
  SubTitle = "by dexngox",
  Color = Color3.fromRGB(255, 0, 0) -- Màu đỏ đặc trưng của Redz
})

-- 3. Tạo một Tab mẫu (Phải có ít nhất 1 Tab nó mới hiện Menu nhé)
local MainTab = Window:CreateTab("Trang Chủ 🏠", "rbxassetid://4483345998")

MainTab:AddSection("Chào mừng em đến với maiyeuem Hub!")
MainTab:AddLabel("Script đang trong quá trình phát triển... ☠️")

-- 4. TẠO CÁI NÚT TRÒN (LOGO) ĐỂ BẬT/TẮT MENU
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

-- Đưa vào CoreGui để không bị mất khi Reset nhân vật
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "MyMemeGui"

ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Màu vàng rực rỡ như em muốn
ToggleButton.BorderSizePixel = 0
-- Vị trí góc trên bên phải (X: 80%, Y: 15%)
ToggleButton.Position = UDim2.new(0.8, 0, 0.15, 0) 
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Image = "rbxassetid://15125345711" -- Icon ngầu
ToggleButton.Draggable = true -- Cho phép em kéo đi khắp màn hình

UICorner.CornerRadius = UDim.new(1, 0) -- Làm cho nút tròn xoe
UICorner.Parent = ToggleButton

-- 5. LOGIC BẬT/TẮT MENU KHI BẤM NÚT
-- Lưu ý: Thư viện Redz thường dùng phím tắt hoặc tự hiện, nhưng chị sẽ ép nó bật/tắt theo cái nút của em
local IsMenuOpen = true
ToggleButton.MouseButton1Click:Connect(function()
    if IsMenuOpen then
        -- Lệnh ẩn Menu của Redz (Giả lập bấm phím để đóng)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
        IsMenuOpen = false
    else
        -- Lệnh hiện Menu
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
        IsMenuOpen = true
    end
end)

-- Thông báo khi chạy thành công
RedzLib:SetTheme("Dark") -- Chỉnh nền tối cho chuẩn Redz
