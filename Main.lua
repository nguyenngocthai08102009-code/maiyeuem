_G.AutoRaid = false -- Biến điều khiển bật/tắt

local function GetBestTarget()
    -- Tìm con quái gần nhất trong thư mục Monsters (hoặc thư mục chứa quái của Raid)
    local target = nil
    local dist = math.huge
    -- Lưu ý: Em cần dùng SimpleSpy để check chính xác tên thư mục chứa quái trong Raid
    for _, v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            local d = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then
                dist = d
                target = v
            end
        end
    end
    return target
end

-- Hàm thực thi Auto Raid
task.spawn(function()
    while task.wait() do
        if _G.AutoRaid then
            pcall(function()
                local monster = GetBestTarget()
                if monster then
                    -- 1. Bay lên đầu con quái (Cách 10-12 stud để nó không đánh trúng)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster.HumanoidRootPart.CFrame * CFrame.new(0, 11, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    
                    -- 2. Tự động cầm vũ khí (Tool)
                    local backpack = game.Players.LocalPlayer.Backpack
                    local character = game.Players.LocalPlayer.Character
                    if not character:FindFirstChildOfClass("Tool") then
                        local tool = backpack:FindFirstChildOfClass("Tool")
                        if tool then
                            character.Humanoid:EquipTool(tool)
                        end
                    end
                    
                    -- 3. Vung kiếm/đấm
                    local currentTool = character:FindFirstChildOfClass("Tool")
                    if currentTool then
                        currentTool:Activate()
                    end
                else
                    -- Nếu không có quái, bay về vị trí trung tâm Raid để đợi Wave tiếp theo
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 100) -- Thay tọa độ trung tâm Raid vào đây
                end
            end)
        end
    end
end)
