local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Win = Rayfield:CreateWindow({
    Name = "TzHzk Hub | EFTB",
    LoadingTitle = "TzHzk Hub",
    LoadingSubtitle = "discord.gg/TKp5vzE3",
    ConfigurationSaving = {Enabled = false},
    KeySystem = true,
    KeySettings = {
        Title = "TzHzk Hub",
        Subtitle = "Key System",
        Note = "Get key at: work.ink/2mfK/TzHzkKey",
        FileName = "TzHzkKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"TzHzk-FREE-2026"}
    }
})

local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

lp.CharacterAdded:Connect(function(c)
    char = c
    hrp = c:WaitForChild("HumanoidRootPart")
    hum = c:WaitForChild("Humanoid")
end)

local fly = false
local flyconn
local noclipconn
local unkillconn
local infj = false

local Tab1 = Win:CreateTab("Player", nil)

Tab1:CreateSlider({
    Name = "Speed",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Flag = "spd",
    Callback = function(v)
        if hum then hum.WalkSpeed = v end
    end
})

Tab1:CreateSlider({
    Name = "Jump",
    Range = {7, 300},
    Increment = 1,
    CurrentValue = 7,
    Flag = "jmp",
    Callback = function(v)
        if hum then hum.JumpHeight = v end
    end
})

Tab1:CreateToggle({
    Name = "Inf Jump",
    CurrentValue = false,
    Flag = "infj",
    Callback = function(v)
        infj = v
    end
})

UIS.JumpRequest:Connect(function()
    if infj and hum then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Tab1:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip",
    Callback = function(v)
        if v then
            noclipconn = RS.Stepped:Connect(function()
                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end)
        else
            if noclipconn then noclipconn:Disconnect() noclipconn = nil end
        end
    end
})

Tab1:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "fly",
    Callback = function(v)
        fly = v
        if v then
            local bg = Instance.new("BodyGyro", hrp)
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bg.P = 9e4
            bg.Name = "tzfly_g"
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Velocity = Vector3.zero
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)
            bv.Name = "tzfly_v"
            flyconn = RS.RenderStepped:Connect(function()
                if not fly then return end
                local g = hrp:FindFirstChild("tzfly_g")
                local vel = hrp:FindFirstChild("tzfly_v")
                if not g or not vel then return end
                local cam = workspace.CurrentCamera
                g.CFrame = cam.CFrame
                local m = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then m = m + cam.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then m = m - cam.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then m = m - cam.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then m = m + cam.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then m = m - Vector3.new(0,1,0) end
                vel.Velocity = m * 80
            end)
        else
            fly = false
            if flyconn then flyconn:Disconnect() flyconn = nil end
            if hrp:FindFirstChild("tzfly_g") then hrp.tzfly_g:Destroy() end
            if hrp:FindFirstChild("tzfly_v") then hrp.tzfly_v:Destroy() end
        end
    end
})

Tab1:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Flag = "god",
    Callback = function(v)
        if v then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
            unkillconn = RS.Heartbeat:Connect(function()
                if hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
            end)
        else
            if unkillconn then unkillconn:Disconnect() unkillconn = nil end
            hum.MaxHealth = 100
            hum.Health = 100
        end
    end
})

local Tab2 = Win:CreateTab("Farm", nil)

local autocashconn
local autospd = false

Tab2:CreateToggle({
    Name = "Auto Collect Cash",
    CurrentValue = false,
    Flag = "cash",
    Callback = function(v)
        if v then
            local rem = game.ReplicatedStorage.Remotes.Plot.CollectCash
            autocashconn = RS.Heartbeat:Connect(function()
                pcall(function() rem:FireServer() end)
            end)
        else
            if autocashconn then autocashconn:Disconnect() autocashconn = nil end
        end
    end
})

Tab2:CreateToggle({
    Name = "Auto Upgrade Speed",
    CurrentValue = false,
    Flag = "aspd",
    Callback = function(v)
        autospd = v
        if v then
            task.spawn(function()
                local rem = game.ReplicatedStorage.Remotes.Plot.UpgradeSpeed5x
                while autospd do
                    pcall(function() rem:FireServer() end)
                    task.wait(0.3)
                end
            end)
        end
    end
})

local Tab3 = Win:CreateTab("Teleport", nil)

local brainrots = {"14","67","Avocadini Antilopini","Avocadini Guffo","Balerina Sigma","Ballerina Cappuccina","Bambini Crostini","Banana Ballerina","Bananita Dolphinita","Bananito Bandito","Bandito Bobritto","Barr Barr Barr Sahur","Biscuitini creaminini","Blueberrinni Octopusini","Bombardini Gusini","Bombardiro Crocodilo","Boneca Ambalabu","Brr Brr Patapim","Brri Brri Bicus Dicus Bombicus","Cacto Hipopotamo","Cameloni Meleloni","Cappuccino Assassino","Capybarelli camionelli","Carta","Cattino timeno","Celularcini Viciosini","Chimpanzini Bananini","Chocolatini slasherini","Chocorat Cherat","Citruski Oranski","Coc coc coc coconut","Cocofanto Elefanto","Confestteo","Corazon","Corazon Bici","Dragon Cannelloni","Dragonni Lovini","Fluriflura","Frigo Camelo","Gangster Footera","Garama","Girafa Celestre","Glorbo Fruttodrillo","Gorillo Watermelondrillo","Heartinis","Job Job Job Sahur","La Grande Combination","La Grande Love","La Vacca Saturno Saturnita","LaVaca Saturno","Lionel Cactuseli","Lirilì Larilà","Los Bbs Grande","Los Bros","Los LaVacca Saturno Saturnita","Los Talpa Di Ferro","Los Tralalero Tralala","Love Love Cat","Love Tralala","Lovers","Madung","Melon Otter","Noo My Love","Noobini Pizzanini","Odin Din Din Dun","Orangutini Ananassini","Perrito","Pipe Man","Pipi Kiwi","Salamino Penguino","Strawberry Elefant","Svinina Bombardino","Ta Ta Ta Ta Sahur","Talpa Di Fero","Tim Cheese","Tralalero Tralala","TricTrac Baraboom","Trippi Troppi","Trulimero Trulicina","Tung Tung Sahur","Vaca","Vaca Corazon","Valentimat and Lovematmamat"}

local function findnpc(name)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == name then
            local r = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart")
            if r then return r end
        end
    end
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name:find(name, 1, true) then
            local r = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart")
            if r then return r end
        end
    end
end

Tab3:CreateDropdown({
    Name = "Brainrot",
    Options = brainrots,
    CurrentOption = {"Tralalero Tralala"},
    Flag = "brdrop",
    MultipleOptions = false,
    Callback = function() end
})

Tab3:CreateButton({
    Name = "Tp to Brainrot",
    Callback = function()
        local sel = Rayfield.Flags.brdrop and Rayfield.Flags.brdrop.Value
        local name = type(sel) == "table" and sel[1] or sel
        if not name then return end
        local r = findnpc(name)
        if r then
            hrp.CFrame = r.CFrame + Vector3.new(0,5,0)
        else
            Rayfield:Notify({Title = "Not found", Content = name.." not in map", Duration = 3})
        end
    end
})

local autotp = false
local autotpconn

Tab3:CreateDropdown({
    Name = "Auto TP Brainrot",
    Options = brainrots,
    CurrentOption = {"Tralalero Tralala"},
    Flag = "autobr",
    MultipleOptions = false,
    Callback = function() end
})

Tab3:CreateToggle({
    Name = "Auto TP when spawns",
    CurrentValue = false,
    Flag = "autotp",
    Callback = function(v)
        autotp = v
        if v then
            autotpconn = RS.Heartbeat:Connect(function()
                local sel = Rayfield.Flags.autobr and Rayfield.Flags.autobr.Value
                local name = type(sel) == "table" and sel[1] or sel
                if not name then return end
                local r = findnpc(name)
                if r and (hrp.Position - r.Position).Magnitude > 20 then
                    hrp.CFrame = r.CFrame + Vector3.new(0,5,0)
                end
            end)
        else
            if autotpconn then autotpconn:Disconnect() autotpconn = nil end
        end
    end
})

Tab3:CreateButton({
    Name = "Tp Spawn",
    Callback = function()
        hrp.CFrame = CFrame.new(0,10,0)
    end
})

local Tab4 = Win:CreateTab("Misc", nil)

Tab4:CreateButton({
    Name = "Copy Discord",
    Callback = function()
        setclipboard("discord.gg/TKp5vzE3")
        Rayfield:Notify({Title = "Copied", Content = "discord.gg/TKp5vzE3", Duration = 2})
    end
})

Tab4:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
    end
})

Rayfield:LoadConfiguration()
