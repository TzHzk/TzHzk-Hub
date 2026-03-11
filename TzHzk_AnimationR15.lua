local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local lang = "EN"

local translations = {
    EN = {
        windowName = "TzHzk Animation Hub",
        loadTitle = "TzHzk Hub",
        loadSub = "by TzHzk",
        tabHome = "🏠 TzHzk Hub",
        tabPlayer = "⚡ Player",
        tabPresets = "🎬 Presets",
        tabMix = "🎨 Mix Anims",
        tabMusic = "🎵 Discord",
        tabSettings = "⚙️ Settings",
        secOwner = "👑 Owner",
        labelOwner = "Owner & Developer: TzHzk",
        labelVersion = "Version: 2.0 | Animation Hub R15",
        secUpdate = "📢 Next Update",
        labelUpdate = "Coming soon: More animations • Custom anim by ID • More hub features",
        secConfig = "💾 Your Config",
        labelID = "Player ID: ",
        labelSaved = "Slots saved automatically!",
        btnReapply = "🔄 Reapply My Animations",
        secCommunity = "🎮 TzHzk Community",
        labelWelcome = "Welcome to TzHzk's official Hub!",
        labelJoin = "Join the server for scripts, updates and more!",
        btnCopyDiscord = "📋 Copy Discord Server",
        secPresets = "Apply full animation set",
        secMixSlots = "Choose animation per slot",
        secApply = "Apply",
        btnApplyMix = "✅ Apply Mix",
        btnReset = "🔄 Reset Default",
        dropIdle = "Idle", dropWalk = "Walk", dropRun = "Run",
        dropJump = "Jump", dropFall = "Fall",
        labelCurrentSlots = "Your saved slots loaded automatically!",
        secAutoReapply = "Auto Reapply",
        toggleAutoReapply = "Auto Reapply on Spawn",
        secLanguage = "🌐 Language",
        secData = "💾 Data",
        labelDataInfo = "Anims saved automatically by your Player ID.",
        btnDeleteData = "🗑️ Delete My Saved Data",
        secCredits = "Credits",
        labelCredits = "Made by TzHzk",
        labelDiscordCredits = "discord.gg/TKp5vzE3",
        notifWelcome = "Welcome! Your saved animations have been loaded.",
        notifApplied = "Animations applied!",
        notifCopied = "Copied! discord.gg/TKp5vzE3",
        notifReset = "Reset to Default!",
        notifDataDeleted = "Data deleted! Reset to Default.",
        notifAutoON = "✅ ON - Anims saved on death/spawn",
        notifAutoOFF = "❌ OFF - Auto reapply disabled",
    },
    ES = {
        windowName = "TzHzk Animation Hub",
        loadTitle = "TzHzk Hub",
        loadSub = "by TzHzk",
        tabHome = "🏠 TzHzk Hub",
        tabPlayer = "⚡ Player",
        tabPresets = "🎬 Presets",
        tabMix = "🎨 Mix Anims",
        tabMusic = "🎵 Discord",
        tabSettings = "⚙️ Settings",
        secOwner = "👑 Owner",
        labelOwner = "Owner y Desarrollador: TzHzk",
        labelVersion = "Version: 2.0 | Animation Hub R15",
        secUpdate = "📢 Proxima Actualizacion",
        labelUpdate = "Pronto: Mas animaciones • Anim custom por ID • Mas features",
        secConfig = "💾 Tu Configuracion",
        labelID = "Player ID: ",
        labelSaved = "Slots guardados automaticamente!",
        btnReapply = "🔄 Reaplicar Mis Animaciones",
        secCommunity = "🎮 Comunidad TzHzk",
        labelWelcome = "Bienvenido al Hub oficial de TzHzk!",
        labelJoin = "Unete al servidor para scripts, updates y mas!",
        btnCopyDiscord = "📋 Copiar Discord Server",
        secPresets = "Aplicar set completo de animaciones",
        secMixSlots = "Elige animacion por slot",
        secApply = "Aplicar",
        btnApplyMix = "✅ Aplicar Mix",
        btnReset = "🔄 Reset Default",
        dropIdle = "Idle", dropWalk = "Walk", dropRun = "Run",
        dropJump = "Jump", dropFall = "Fall",
        labelCurrentSlots = "Tus slots guardados cargados automaticamente!",
        secAutoReapply = "Auto Reapply",
        toggleAutoReapply = "Auto Reapply al Spawn",
        secLanguage = "🌐 Idioma",
        secData = "💾 Datos",
        labelDataInfo = "Anims guardadas automaticamente por tu Player ID.",
        btnDeleteData = "🗑️ Borrar Mis Datos Guardados",
        secCredits = "Creditos",
        labelCredits = "Hecho por TzHzk",
        labelDiscordCredits = "discord.gg/TKp5vzE3",
        notifWelcome = "Bienvenido! Tus animaciones guardadas han sido cargadas.",
        notifApplied = "Animaciones aplicadas!",
        notifCopied = "Copiado! discord.gg/TKp5vzE3",
        notifReset = "Reset a Default!",
        notifDataDeleted = "Datos borrados! Reset a Default.",
        notifAutoON = "✅ ON - Anims guardadas al morir/spawn",
        notifAutoOFF = "❌ OFF - Auto reapply desactivado",
    }
}

local function L(key)
    return translations[lang][key] or key
end

local AnimLibrary = {
    ["Default"] = {idle1="507766666",idle2="507766666",walk="507777826",run="507767714",jump="507765000",climb="507765644",fall="507767968"},
    ["Zombie"] = {idle1="616158929",idle2="616160636",walk="616168032",run="616163682",jump="616161997",climb="616156119",fall="616157476"},
    ["Zombie FE"] = {idle1="3489171152",idle2="3489171152",walk="3489174223",run="3489173414",jump="616161997",climb="616156119",fall="616157476"},
    ["Ninja"] = {idle1="656117400",idle2="656118341",walk="656121766",run="656118852",jump="656117878",climb="656114359",fall="656115606"},
    ["Ninja FE"] = {idle1="656117400",idle2="656118341",walk="656121766",run="656118852",jump="658832070",climb="656114359",fall="658831500"},
    ["Levitation"] = {idle1="616006778",idle2="616008087",walk="616013216",run="616010382",jump="616008936",climb="616003713",fall="616005863"},
    ["Vampire"] = {idle1="1083445855",idle2="1083450166",walk="1083473930",run="1083462077",jump="1083455352",climb="1083439238",fall="1083443587"},
    ["Hero"] = {idle1="616111295",idle2="616113536",walk="616122287",run="616117076",jump="616115533",climb="616104706",fall="616108001"},
    ["Mage"] = {idle1="707742142",idle2="707855907",walk="707897309",run="707861613",jump="707853694",climb="707826056",fall="707829716"},
    ["Knight"] = {idle1="657595757",idle2="657568135",walk="657552124",run="657564596",jump="658409194",climb="658360781",fall="657600338"},
    ["Cowboy"] = {idle1="1014390418",idle2="1014398616",walk="1014421541",run="1014401683",jump="1014394726",climb="1014380606",fall="1014384571"},
    ["Pirate"] = {idle1="750781874",idle2="750782770",walk="750785693",run="750783738",jump="750782230",climb="750779899",fall="750780242"},
    ["Werewolf"] = {idle1="1083195517",idle2="1083214717",walk="1083178339",run="1083216690",jump="1083218792",climb="1083182000",fall="1083189019"},
    ["Ghost"] = {idle1="616006778",idle2="616008087",walk="616010382",run="616013216",jump="616008936",climb="616003713",fall="616005863"},
    ["Elder"] = {idle1="845397899",idle2="845400520",walk="845403856",run="845386501",jump="845398858",climb="845392038",fall="845396048"},
    ["Astronaut"] = {idle1="891621366",idle2="891633237",walk="891667138",run="891636393",jump="891627522",climb="891609353",fall="891617961"},
    ["Cartoon"] = {idle1="742637544",idle2="742638445",walk="742640026",run="742638842",jump="742637942",climb="742636889",fall="742637151"},
    ["Sneaky"] = {idle1="1132473842",idle2="1132477671",walk="1132510133",run="1132494274",jump="1132489853",climb="1132461372",fall="1132469004"},
    ["Toy"] = {idle1="782841498",idle2="782845736",walk="782843345",run="782842708",jump="782847020",climb="782843869",fall="782846423"},
    ["Confident"] = {idle1="1069977950",idle2="1069987858",walk="1070017263",run="1070001516",jump="1069984524",climb="1069946257",fall="1069973677"},
    ["Popstar"] = {idle1="1212900985",idle2="1212900985",walk="1212980338",run="1212980348",jump="1212954642",climb="1213044953",fall="1212900995"},
    ["Princess"] = {idle1="941003647",idle2="941013098",walk="941028902",run="941015281",jump="941008832",climb="940996062",fall="941000007"},
    ["Patrol"] = {idle1="1149612882",idle2="1150842221",walk="1151231493",run="1150967949",jump="1150944216",climb="1148811837",fall="1148863382"},
    ["Supervillain"] = {idle1="1284465370",idle2="1284476201",walk="1284473418",run="1284474312",jump="1284471813",climb="1284469123",fall="1284470263"},
    ["Stylish"] = {idle1="180435571",idle2="180435571",walk="180426354",run="180426354",jump="125750702",climb="180436334",fall="180436148"},
    ["Robot"] = {idle1="3281945838",idle2="3281945838",walk="3281950166",run="3281950166",jump="3281947534",climb="3281952012",fall="3281951008"},
    ["Samurai"] = {idle1="4849053522",idle2="4849053522",walk="4849061668",run="4849061668",jump="4849057380",climb="4849055690",fall="4849056598"},
    ["Witch"] = {idle1="5117027490",idle2="5117027490",walk="5117030060",run="5117030060",jump="5117028830",climb="5117029380",fall="5117029380"},
    ["Fairy"] = {idle1="6638680218",idle2="6638680218",walk="6638683058",run="6638683058",jump="6638681258",climb="6638682258",fall="6638681808"},
    ["Skating"] = {idle1="180435571",idle2="180435571",walk="10714177846",run="10714177846",jump="507765000",climb="507765644",fall="507767968"},
    ["Gangster"] = {idle1="616158929",idle2="616160636",walk="1284473418",run="1070001516",jump="656117878",climb="616156119",fall="616157476"},
    ["Anime Run"] = {idle1="656117400",idle2="656118341",walk="656121766",run="4849061668",jump="658832070",climb="656114359",fall="658831500"},
    ["Zombie Walk"] = {idle1="10921344533",idle2="10921344533",walk="616006778",run="754635032",jump="658832070",climb="616156119",fall="658831500"},
}

local saveFile = "TzHzkHub_"..player.UserId..".txt"

local function saveSlots(slots)
    pcall(function()
        if writefile then
            writefile(saveFile, slots.idle.."|"..slots.walk.."|"..slots.run.."|"..slots.jump.."|"..slots.fall)
        end
    end)
end

local function loadSlots()
    local default = {idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
    local ok, data = pcall(function()
        if readfile then
            local p = string.split(readfile(saveFile), "|")
            if #p == 5 then return {idle=p[1],walk=p[2],run=p[3],jump=p[4],fall=p[5]} end
        end
        return nil
    end)
    if ok and data then
        for k,v in pairs(data) do
            if not AnimLibrary[v] then data[k] = "Default" end
        end
        return data
    end
    return default
end

local currentSlots = loadSlots()
local autoReapply = true

local animNames = {}
for k in pairs(AnimLibrary) do table.insert(animNames, k) end
table.sort(animNames)

local function getVal(val)
    if type(val) == "table" then return val[1] else return val end
end

-- =====================
-- PLAYER MODS
-- =====================
local speedEnabled = false
local jumpEnabled = false
local noclipEnabled = false
local customSpeed = 16
local customJump = 50
local noclipConnection = nil
local originalRootSize = Vector3.new(2, 2, 1)

local function setSpeed(enabled)
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.WalkSpeed = enabled and customSpeed or 16
end

local function setJump(enabled)
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.JumpPower = enabled and customJump or 50
end

local function startNoclip()
    if noclipConnection then noclipConnection:Disconnect() end
    noclipConnection = RunService.Stepped:Connect(function()
        if not noclipEnabled then return end
        local char = player.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        -- hitbox reducido al 25% — medio traspasa paredes como wallhop
        root.Size = Vector3.new(0.5, 2, 0.25)
    end)
end

local function stopNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Size = originalRootSize
    end
end

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if speedEnabled then setSpeed(true) end
    if jumpEnabled then setJump(true) end
    if noclipEnabled then startNoclip() end
end)

-- =====================
-- APPLY ANIM
-- =====================
local function applyMix(silent)
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = hum
    end
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return end

    local slots = {
        idle  = {Animation1="rbxassetid://"..AnimLibrary[currentSlots.idle].idle1, Animation2="rbxassetid://"..AnimLibrary[currentSlots.idle].idle2},
        walk  = {WalkAnim="rbxassetid://"..AnimLibrary[currentSlots.walk].walk},
        run   = {RunAnim="rbxassetid://"..AnimLibrary[currentSlots.run].run},
        jump  = {JumpAnim="rbxassetid://"..AnimLibrary[currentSlots.jump].jump},
        fall  = {FallAnim="rbxassetid://"..AnimLibrary[currentSlots.fall].fall},
        climb = {ClimbAnim="rbxassetid://"..AnimLibrary[currentSlots.idle].climb},
    }

    for folderName, anims in pairs(slots) do
        local folder = Animate:FindFirstChild(folderName)
        if folder then
            for animName, animId in pairs(anims) do
                local old = folder:FindFirstChild(animName)
                if old then
                    local newAnim = Instance.new("Animation")
                    newAnim.Name = animName
                    newAnim.AnimationId = animId
                    newAnim.Parent = folder
                    old:Destroy()
                end
            end
        end
    end

    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do track:Stop(0) end
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    task.wait()
    hum:ChangeState(Enum.HumanoidStateType.Running)

    saveSlots(currentSlots)
    if not silent then
        Rayfield:Notify({
            Title="✅ TzHzk Hub",
            Content=L("notifApplied").."\nIdle: "..currentSlots.idle.." | Walk: "..currentSlots.walk.."\nRun: "..currentSlots.run.." | Jump: "..currentSlots.jump.." | Fall: "..currentSlots.fall,
            Duration=4
        })
    end
end

local function setupCharacter(char)
    task.spawn(function()
        char:WaitForChild("Animate")
        char:WaitForChild("Humanoid")
        task.wait(0.1)
        if autoReapply then applyMix(true) end
    end)
end

player.CharacterAdded:Connect(setupCharacter)
if player.Character then task.spawn(function() setupCharacter(player.Character) end) end

-- =====================
-- WINDOW
-- =====================
local Window = Rayfield:CreateWindow({
    Name = L("windowName"),
    LoadingTitle = L("loadTitle"),
    LoadingSubtitle = L("loadSub"),
    ConfigurationSaving = {Enabled=false},
    KeySystem = false
})

-- =====================
-- TAB 1: HOME
-- =====================
local HomeTab = Window:CreateTab(L("tabHome"), 4483362458)
HomeTab:CreateSection(L("secOwner"))
HomeTab:CreateLabel(L("labelOwner"))
HomeTab:CreateLabel(L("labelVersion"))
HomeTab:CreateSection(L("secUpdate"))
HomeTab:CreateLabel(L("labelUpdate"))
HomeTab:CreateSection(L("secConfig"))
HomeTab:CreateLabel(L("labelID")..player.UserId)
HomeTab:CreateLabel(L("labelSaved"))
HomeTab:CreateButton({Name=L("btnReapply"), Callback=function() applyMix(false) end})

-- =====================
-- TAB 2: PLAYER
-- =====================
local PlayerTab = Window:CreateTab(L("tabPlayer"), 4483362458)

PlayerTab:CreateSection("🚶 Movement")
PlayerTab:CreateToggle({
    Name = "Custom Speed",
    CurrentValue = false,
    Callback = function(val)
        speedEnabled = val
        setSpeed(val)
        Rayfield:Notify({Title="TzHzk Hub", Content=val and ("Speed ON: "..customSpeed) or "Speed reset to default", Duration=2})
    end
})
PlayerTab:CreateSlider({
    Name = "Speed Value",
    Range = {1, 150},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(val)
        customSpeed = val
        if speedEnabled then setSpeed(true) end
    end
})
PlayerTab:CreateToggle({
    Name = "Custom Jump",
    CurrentValue = false,
    Callback = function(val)
        jumpEnabled = val
        setJump(val)
        Rayfield:Notify({Title="TzHzk Hub", Content=val and ("Jump ON: "..customJump) or "Jump reset to default", Duration=2})
    end
})
PlayerTab:CreateSlider({
    Name = "Jump Value",
    Range = {1, 300},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(val)
        customJump = val
        if jumpEnabled then setJump(true) end
    end
})

PlayerTab:CreateSection("🧱 Wallhop COOMING SOON - MUY PRONTO")
PlayerTab:CreateToggle({
    Name = "Wallhop Noclip (MM2 Style)",
    CurrentValue = false,
    Callback = function(val)
        noclipEnabled = val
        if val then
            startNoclip()
            Rayfield:Notify({Title="TzHzk Hub", Content="Wallhop ON 👑 hitbox 25%", Duration=3})
        else
            stopNoclip()
            Rayfield:Notify({Title="TzHzk Hub", Content="Wallhop OFF", Duration=2})
        end
    end
})
PlayerTab:CreateLabel("New Update")

-- =====================
-- TAB 3: PRESETS
-- =====================
local PresetsTab = Window:CreateTab(L("tabPresets"), 4483362458)
PresetsTab:CreateSection(L("secPresets"))
for _, name in ipairs(animNames) do
    PresetsTab:CreateButton({
        Name = name,
        Callback = function()
            currentSlots = {idle=name,walk=name,run=name,jump=name,fall=name}
            applyMix(false)
        end
    })
end

-- =====================
-- TAB 4: MIX
-- =====================
local MixTab = Window:CreateTab(L("tabMix"), 4483362458)
MixTab:CreateSection(L("secMixSlots"))
MixTab:CreateLabel(L("labelCurrentSlots"))
MixTab:CreateDropdown({Name=L("dropIdle"),Options=animNames,CurrentOption={currentSlots.idle},MultipleOptions=false,Callback=function(val) currentSlots.idle=getVal(val) end})
MixTab:CreateDropdown({Name=L("dropWalk"),Options=animNames,CurrentOption={currentSlots.walk},MultipleOptions=false,Callback=function(val) currentSlots.walk=getVal(val) end})
MixTab:CreateDropdown({Name=L("dropRun"),Options=animNames,CurrentOption={currentSlots.run},MultipleOptions=false,Callback=function(val) currentSlots.run=getVal(val) end})
MixTab:CreateDropdown({Name=L("dropJump"),Options=animNames,CurrentOption={currentSlots.jump},MultipleOptions=false,Callback=function(val) currentSlots.jump=getVal(val) end})
MixTab:CreateDropdown({Name=L("dropFall"),Options=animNames,CurrentOption={currentSlots.fall},MultipleOptions=false,Callback=function(val) currentSlots.fall=getVal(val) end})
MixTab:CreateSection(L("secApply"))
MixTab:CreateButton({Name=L("btnApplyMix"), Callback=function() applyMix(false) end})
MixTab:CreateButton({Name=L("btnReset"), Callback=function()
    currentSlots={idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
    applyMix(false)
    Rayfield:Notify({Title="TzHzk Hub", Content=L("notifReset"), Duration=3})
end})

-- =====================
-- TAB 5: DISCORD
-- =====================
local DiscordTab = Window:CreateTab(L("tabMusic"), 4483362458)
DiscordTab:CreateSection(L("secCommunity"))
DiscordTab:CreateLabel(L("labelWelcome"))
DiscordTab:CreateLabel(L("labelJoin"))
DiscordTab:CreateButton({
    Name=L("btnCopyDiscord"),
    Callback=function()
        if setclipboard then setclipboard("discord.gg/TKp5vzE3") end
        Rayfield:Notify({Title="✅ TzHzk Hub", Content=L("notifCopied"), Duration=3})
    end
})

-- =====================
-- TAB 6: SETTINGS
-- =====================
local SettingsTab = Window:CreateTab(L("tabSettings"), 4483362458)
SettingsTab:CreateSection(L("secAutoReapply"))
SettingsTab:CreateToggle({
    Name=L("toggleAutoReapply"),
    CurrentValue=true,
    Callback=function(val)
        autoReapply=val
        Rayfield:Notify({Title="TzHzk Hub", Content=val and L("notifAutoON") or L("notifAutoOFF"), Duration=3})
    end
})
SettingsTab:CreateSection(L("secLanguage"))
SettingsTab:CreateDropdown({
    Name="Language / Idioma",
    Options={"English","Español"},
    CurrentOption={"English"},
    MultipleOptions=false,
    Callback=function(val)
        lang=getVal(val)=="English" and "EN" or "ES"
        Rayfield:Notify({
            Title="TzHzk Hub",
            Content=lang=="EN" and "Language set to English! Re-execute to apply." or "Idioma: Español! Re-ejecutar para aplicar.",
            Duration=4
        })
    end
})
SettingsTab:CreateSection(L("secData"))
SettingsTab:CreateLabel(L("labelDataInfo"))
SettingsTab:CreateLabel(L("labelID")..player.UserId)
SettingsTab:CreateButton({
    Name=L("btnDeleteData"),
    Callback=function()
        pcall(function() if writefile then writefile(saveFile,"Default|Default|Default|Default|Default") end end)
        currentSlots={idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
        applyMix(false)
        Rayfield:Notify({Title="TzHzk Hub", Content=L("notifDataDeleted"), Duration=3})
    end
})
SettingsTab:CreateSection(L("secCredits"))
SettingsTab:CreateLabel(L("labelCredits"))
SettingsTab:CreateLabel(L("labelDiscordCredits"))

Rayfield:Notify({Title="👑 TzHzk Hub", Content=L("notifWelcome"), Duration=5})
