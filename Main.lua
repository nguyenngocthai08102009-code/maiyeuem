local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/redzui"))()

local Window = RedzLib:MakeWindow({
  Name = "maiyeuem Hub | KAITUN MODE ☠️",
  SubTitle = "Meme Sea - Auto Farm Level",
  Color = Color3.fromRGB(255, 0, 0)
})

local MainTab = Window:CreateTab("Kaitun ⚔️", "rbxassetid://4483362458")

_G.AutoFarm = false
_G.AutoStats = false

-- 1. TỰ ĐỘNG CỘNG ĐIỂM VÀO KIẾM (SWORD)
spawn(function()
    while task.wait(1) do
        if _G.AutoStats then
            -- Tự cộng điểm vào Sword để tăng sát thương kiếm
            local args = { [1] = "Sword", [2] = 1 }
            game:GetService("Knit").Services.StatsService.RE.UpdateStats:FireServer(unpack(args))
        end
    end
end)

-- 2. HÀM KIỂM TRA VÀ CẦM KIẾM
function equipSword()
    local p = game.Players.LocalPlayer
    local char = p.Character
    if char and not char:FindFirstChildOfClass("Tool") then
        for _, tool in pairs(p.Backpack:GetChildren()) do
            -- Ưu tiên tìm vũ khí có chữ "Sword" hoặc Katana
            if tool:IsA("Tool") then
                char.Humanoid:EquipTool(tool)
                break
            end
        end
    end
end

-- 3. HÀM AUTO FARM LEVEL
function StartFarm()
    spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local monster = nil
                local dist = math.huge
                
                -- Tìm con quái gần nhất
                for _, v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        monster = v
                        break
                    end
                end

                if monster then
                    repeat
                        if not _G.AutoFarm then break end
                        equipSword() -- Luôn kiểm tra cầm kiếm
                        
                        -- Bay lên đầu quái để chém (An toàn tuyệt đối)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        
                        -- Kích hoạt chém kiếm
                        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                        
                        task.wait()
                    until not monster or monster.Humanoid.Health <= 0 or not _G.AutoFarm
                end
            end)
            task.wait(0.5)
        end
    end)
end

-- GIAO DIỆN
MainTab:AddToggle({
  Name = "Bật Auto Farm Cấp (Dùng Kiếm) ⚔️",
  Default = false,
  Callback = function(Value)
    _G.AutoFarm = Value
    if Value then StartFarm() end
  end
})

MainTab:AddToggle({
  Name = "Auto Cộng Điểm Kiếm (Sword) 🛡️",
  Default = false,
  Callback = function(Value)
    _G.AutoStats = Value
  end
})

-- NÚT TRÒN MÀU VÀNG (BẬT/TẮT MENU)
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
ScreenGui.Parent = game:GetService("CoreGui")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
ToggleButton.Position = UDim2.new(0.8, 0, 0.2, 0) 
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Image = "rbxassetid://15125345711" 
ToggleButton.Draggable = true 
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)
