-- TzHzk Hub | Escape Traffic For Brainrots v2
-- discord.gg/TKp5vzE3

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "TzHzk Hub | Escape Traffic",
    LoadingTitle = "TzHzk Hub",
    LoadingSubtitle = "discord.gg/TKp5vzE3",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

-- REMOTES
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local PlotRemotes = Remotes:WaitForChild("Plot")
local UpgradeSpeed5x = PlotRemotes:WaitForChild("UpgradeSpeed5x")
local CollectCash = PlotRemotes:WaitForChild("CollectCash")

-- VARIABLES
local flyEnabled = false
local flyConn = nil
local noclipEnabled = false
local noclipConn = nil
local unkillEnabled = false
local unkillConn = nil
local autoCollectEnabled = false
local autoCollectConn = nil
local autoSpeedEnabled = false
local infJump = false
local autoTpBrainrot = nil
local autoTpConn = nil

-- Brainrots del campo (sin gamepass)
local brainrots = {
    "14", "67",
    "Avocadini Antilopini", "Avocadini Guffo", "Balerina Sigma",
    "Ballerina Cappuccina", "Bambini Crostini", "Banana Ballerina",
    "Bananita Dolphinita", "Bananito Bandito", "Bandito Bobritto",
    "Barr Barr Barr Sahur", "Biscuitini creaminini", "Blueberrinni Octopusini",
    "Bombardini Gusini", "Bombardiro Crocodilo", "Boneca Ambalabu",
    "Brr Brr Patapim", "Brri Brri Bicus Dicus Bombicus", "Cacto Hipopotamo",
    "Cameloni Meleloni", "Cappuccino Assassino", "Capybarelli camionelli",
    "Carta", "Cattino timeno", "Celularcini Viciosini", "Chimpanzini Bananini",
    "Chocolatini slasherini", "Chocorat Cherat", "Citruski Oranski",
    "Coc coc coc coconut", "Cocofanto Elefanto", "Confestteo", "Corazon",
    "Corazon Bici", "Dragon Cannelloni", "Dragonni Lovini", "Fluriflura",
    "Frigo Camelo", "Gangster Footera", "Garama", "Girafa Celestre",
    "Glorbo Fruttodrillo", "Gorillo Watermelondrillo", "Heartinis",
    "Job Job Job Sahur", "La Grande Combination", "La Grande Love",
    "La Vacca Saturno Saturnita", "LaVaca Saturno", "Lionel Cactuseli",
    "Lirilì Larilà", "Los Bbs Grande", "Los Bros",
    "Los LaVacca Saturno Saturnita", "Los Talpa Di Ferro", "Los Tralalero Tralala",
    "Love Love Cat", "Love Tralala", "Lovers", "Madung", "Melon Otter",
    "Noo My Love", "Noobini Pizzanini", "Odin Din Din Dun",
    "Orangutini Ananassini", "Perrito", "Pipe Man", "Pipi Kiwi",
    "Salamino Penguino", "Strawberry Elefant", "Svinina Bombardino",
    "Ta Ta Ta Ta Sahur", "Talpa Di Fero", "Tim Cheese", "Tralalero Tralala",
    "TricTrac Baraboom", "Trippi Troppi", "Trulimero Trulicina",
    "Tung Tung Sahur", "Vaca", "Vaca Corazon", "Valentimat and Lovematmamat"
}

-- Funcion para buscar brainrot en workspace
local function findBrainrotInWorkspace(name)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") then
            -- busca por nombre exacto o parcial
            if v.Name == name then
                local root = v:FindFirstChild("HumanoidRootPart") 
                    or v:FindFirstChild("Root")
                    or v:FindFirstChildWhichIsA("BasePart")
                if root then return root end
            end
        end
    end
    -- segunda busqueda con find
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name:find(name, 1, true) then
            local root = v:FindFirstChild("HumanoidRootPart") 
                or v:FindFirstChild("Root")
                or v:FindFirstChildWhichIsA("BasePart")
            if root then return root end
        end
    end
    return nil
end

-- CHARACTER RELOAD
lp.CharacterAdded:Connect(function(c)
    char = c
    hrp = c:WaitForChild("HumanoidRootPart")
    hum = c:WaitForChild("Humanoid")
    -- re-apply unkill
    if unkillEnabled then
        hum:SetAttribute("MaxHealth", math.huge)
        hum.MaxHealth = math.huge
        hum.Health = math.huge
    end
end)

-- =====================
-- TAB: PLAYER
-- =====================
local PlayerTab = Window:CreateTab("⚡ Player", nil)

PlayerTab:CreateSection("Movement")

-- Speed Slider
PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(val)
        if hum then hum.WalkSpeed = val end
    end
})

-- Jump Power Slider
PlayerTab:CreateSlider({
    Name = "Jump Height",
    Range = {7, 200},
    Increment = 1,
    CurrentValue = 7,
    Flag = "JumpPower",
    Callback = function(val)
        if hum then
            hum.JumpHeight = val
            -- fallback para versiones antigas
            pcall(function() hum.JumpPower = val * 3 end)
        end
    end
})

-- Infinite Jump
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(val)
        infJump = val
    end
})

UIS.JumpRequest:Connect(function()
    if infJump and char and hum then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

PlayerTab:CreateSection("Abilities")

-- Noclip
PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(val)
        noclipEnabled = val
        if val then
            noclipConn = RunService.Stepped:Connect(function()
                if char then
                    for _, p in pairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() noclipConn = nil end
        end
    end
})

-- Fly
PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(val)
        flyEnabled = val
        if val then
            local bg = Instance.new("BodyGyro", hrp)
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.P = 9e4
            bg.Name = "TzHzkFlyGyro"
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Velocity = Vector3.zero
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Name = "TzHzkFlyVel"

            flyConn = RunService.RenderStepped:Connect(function()
                if not flyEnabled then return end
                local gyro = hrp:FindFirstChild("TzHzkFlyGyro")
                local vel = hrp:FindFirstChild("TzHzkFlyVel")
                if not gyro or not vel then return end
                gyro.CFrame = workspace.CurrentCamera.CFrame
                local move = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
                vel.Velocity = move * 80
            end)
        else
            flyEnabled = false
            if flyConn then flyConn:Disconnect() flyConn = nil end
            if hrp then
                local g = hrp:FindFirstChild("TzHzkFlyGyro")
                local v = hrp:FindFirstChild("TzHzkFlyVel")
                if g then g:Destroy() end
                if v then v:Destroy() end
            end
        end
    end
})

PlayerTab:CreateSection("Survival")

-- Unkill (God Mode)
PlayerTab:CreateToggle({
    Name = "Unkill (God Mode)",
    CurrentValue = false,
    Flag = "Unkill",
    Callback = function(val)
        unkillEnabled = val
        if val then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
            unkillConn = RunService.Heartbeat:Connect(function()
                if hum and hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
            end)
        else
            if unkillConn then unkillConn:Disconnect() unkillConn = nil end
            hum.MaxHealth = 100
            hum.Health = 100
        end
    end
})

-- =====================
-- TAB: FARM
-- =====================
local FarmTab = Window:CreateTab("💰 Farm", nil)

FarmTab:CreateSection("Auto Farm")

FarmTab:CreateToggle({
    Name = "Auto Collect Cash",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(val)
        autoCollectEnabled = val
        if val then
            autoCollectConn = RunService.Heartbeat:Connect(function()
                pcall(function() CollectCash:FireServer() end)
            end)
        else
            if autoCollectConn then autoCollectConn:Disconnect() autoCollectConn = nil end
        end
    end
})

FarmTab:CreateToggle({
    Name = "Auto Upgrade Speed 5x",
    CurrentValue = false,
    Flag = "AutoSpeed",
    Callback = function(val)
        autoSpeedEnabled = val
        if val then
            task.spawn(function()
                while autoSpeedEnabled do
                    pcall(function() UpgradeSpeed5x:FireServer() end)
                    task.wait(0.3)
                end
            end)
        end
    end
})

-- =====================
-- TAB: TELEPORT
-- =====================
local TpTab = Window:CreateTab("🌀 Teleport", nil)

TpTab:CreateSection("Teleport to Brainrot")

TpTab:CreateDropdown({
    Name = "Seleccionar Brainrot",
    Options = brainrots,
    CurrentOption = {"Tralalero Tralala"},
    Flag = "BrainrotSelect",
    MultipleOptions = false,
    Callback = function(selected) end
})

TpTab:CreateButton({
    Name = "⚡ Ir al Brainrot",
    Callback = function()
        local Flags = Rayfield.Flags
        local selected = Flags and Flags.BrainrotSelect and Flags.BrainrotSelect.Value
        local name = type(selected) == "table" and selected[1] or selected
        if not name then
            Rayfield:Notify({Title = "Error", Content = "Selecciona un brainrot primero", Duration = 3})
            return
        end
        local root = findBrainrotInWorkspace(name)
        if root then
            hrp.CFrame = root.CFrame + Vector3.new(0, 5, 0)
            Rayfield:Notify({Title = "✅ Teleport", Content = "TP a "..name, Duration = 3})
        else
            Rayfield:Notify({Title = "❌ No encontrado", Content = name.." no está en el mapa ahora", Duration = 3})
        end
    end
})

TpTab:CreateSection("Auto TP cuando aparezca")

TpTab:CreateDropdown({
    Name = "Brainrot a vigilar",
    Options = brainrots,
    CurrentOption = {"Tralalero Tralala"},
    Flag = "AutoTpSelect",
    MultipleOptions = false,
    Callback = function(selected) end
})

TpTab:CreateToggle({
    Name = "Auto TP al aparecer",
    CurrentValue = false,
    Flag = "AutoTpToggle",
    Callback = function(val)
        if val then
            autoTpConn = RunService.Heartbeat:Connect(function()
                local Flags = Rayfield.Flags
                local selected = Flags and Flags.AutoTpSelect and Flags.AutoTpSelect.Value
                local name = type(selected) == "table" and selected[1] or selected
                if not name then return end
                local root = findBrainrotInWorkspace(name)
                if root then
                    local dist = (hrp.Position - root.Position).Magnitude
                    if dist > 20 then
                        hrp.CFrame = root.CFrame + Vector3.new(0, 5, 0)
                        Rayfield:Notify({Title = "🎯 Auto TP", Content = name.." apareció!", Duration = 3})
                    end
                end
            end)
        else
            if autoTpConn then autoTpConn:Disconnect() autoTpConn = nil end
        end
    end
})

TpTab:CreateSection("Teleport a Jugadores")

local function getPlayerList()
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then table.insert(list, p.Name) end
    end
    return list
end

TpTab:CreateDropdown({
    Name = "Seleccionar Jugador",
    Options = getPlayerList(),
    CurrentOption = {},
    Flag = "PlayerSelect",
    MultipleOptions = false,
    Callback = function(selected) end
})

TpTab:CreateButton({
    Name = "⚡ Ir al Jugador",
    Callback = function()
        local Flags = Rayfield.Flags
        local selected = Flags and Flags.PlayerSelect and Flags.PlayerSelect.Value
        local name = type(selected) == "table" and selected[1] or selected
        if not name then
            Rayfield:Notify({Title = "Error", Content = "Selecciona un jugador primero", Duration = 3})
            return
        end
        local target = Players:FindFirstChild(name)
        if target and target.Character then
            local root = target.Character:FindFirstChild("HumanoidRootPart")
            if root then
                hrp.CFrame = root.CFrame + Vector3.new(0, 3, 3)
                Rayfield:Notify({Title = "✅ Teleport", Content = "TP a "..name, Duration = 3})
            end
        end
    end
})

TpTab:CreateButton({
    Name = "🔄 Refrescar jugadores",
    Callback = function()
        Rayfield:Notify({Title = "Info", Content = "Rejoin para ver nuevos jugadores", Duration = 3})
    end
})

TpTab:CreateSection("Otros")

TpTab:CreateButton({
    Name = "🏠 Teleport al Spawn",
    Callback = function()
        hrp.CFrame = CFrame.new(0, 10, 0)
        Rayfield:Notify({Title = "✅ Teleport", Content = "TP al spawn", Duration = 2})
    end
})

-- =====================
-- TAB: SETTINGS
-- =====================
local SettingsTab = Window:CreateTab("⚙️ Settings", nil)

SettingsTab:CreateSection("Info")
SettingsTab:CreateLabel("TzHzk Hub v2 | Escape Traffic For Brainrots")
SettingsTab:CreateLabel("discord.gg/TKp5vzE3")

SettingsTab:CreateSection("Opciones")

SettingsTab:CreateButton({
    Name = "📋 Copiar Discord",
    Callback = function()
        setclipboard("discord.gg/TKp5vzE3")
        Rayfield:Notify({Title = "✅ Copiado", Content = "discord.gg/TKp5vzE3", Duration = 3})
    end
})

SettingsTab:CreateButton({
    Name = "🔄 Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
    end
})

Rayfield:LoadConfiguration()
