-- ============================================================
--  TzHzk Animation Hub v3.2
--  discord.gg/TKp5vzE3 | By TzHzk
-- ============================================================
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players  = game:GetService("Players")
local player   = Players.LocalPlayer

-- ============================================================
-- LANGUAGE
-- ============================================================
local lang = "EN"
local T = {
    EN = {
        windowName="TzHzk Animation Hub", loadTitle="TzHzk Hub", loadSub="by TzHzk",
        tabHome="🏠 Home", tabPresets="🎬 Presets", tabMix="🎨 Mix Anims",
        tabSave="💾 Save Anim", tabEmotes="💃 Emotes", tabSettings="⚙️ Settings",
        secOwner="👑 Owner Info",
        labelOwner="Owner & Developer: TzHzk",
        labelVersion="Version: 3.2 | Animation Hub R15",
        secUpdate="📢 New Update / Nueva Actualizacion",
        labelUpdate="v3.2: adidas Sports + adidas Community + Emotes tab added.",
        btnReapply="🔄 Reapply Animations",
        btnGameDefault="🎮 Restore Game Default Anims",
        labelJoin="discord.gg/TKp5vzE3",
        btnCopyDiscord="📋 Copy Discord Link",
        secPresets="Apply a full animation pack",
        secMixSlots="Mix per slot",
        secApply="Apply",
        btnApplyMix="Apply Mix",
        dropIdle="Idle", dropWalk="Walk", dropRun="Run", dropJump="Jump", dropFall="Fall",
        labelCurrentSlots="Slots loaded from your save!",
        secAutoReapply="Auto Reapply",
        toggleAutoReapply="Auto Reapply on Respawn",
        secLanguage="Language / Idioma",
        secData="Data",
        labelDataInfo="Your animations are saved by Player ID.",
        btnDeleteData="Delete All Saved Data",
        labelID="Player ID: ",
        secCredits="Credits",
        labelCredits="Made by TzHzk",
        labelDiscordCredits="discord.gg/TKp5vzE3",
        btnReExecute="🔁 Re-Execute Hub",
        notifWelcome="Welcome! v3.2 loaded.",
        notifApplied="Applied!",
        notifCopied="Copied! discord.gg/TKp5vzE3",
        notifDataDeleted="All data deleted.",
        notifAutoON="Auto Reapply ON",
        notifAutoOFF="Auto Reapply OFF",
        notifGameDefault="Game default animations restored!",
        notifReExecute="Re-executing hub...",
    },
    ES = {
        windowName="TzHzk Animation Hub", loadTitle="TzHzk Hub", loadSub="by TzHzk",
        tabHome="🏠 Home", tabPresets="🎬 Presets", tabMix="🎨 Mix Anims",
        tabSave="💾 Save Anim", tabEmotes="💃 Emotes", tabSettings="⚙️ Settings",
        secOwner="👑 Info Owner",
        labelOwner="Owner y Desarrollador: TzHzk",
        labelVersion="Version: 3.2 | Animation Hub R15",
        secUpdate="📢 New Update / Nueva Actualizacion",
        labelUpdate="v3.2: adidas Sports + adidas Community + tab Emotes agregados.",
        btnReapply="🔄 Reaplicar Animaciones",
        btnGameDefault="🎮 Restaurar Anims del Juego",
        labelJoin="discord.gg/TKp5vzE3",
        btnCopyDiscord="📋 Copiar Discord",
        secPresets="Aplicar pack completo",
        secMixSlots="Mix por slot",
        secApply="Aplicar",
        btnApplyMix="Aplicar Mix",
        dropIdle="Idle", dropWalk="Walk", dropRun="Run", dropJump="Jump", dropFall="Fall",
        labelCurrentSlots="Slots cargados desde tu guardado!",
        secAutoReapply="Auto Reapply",
        toggleAutoReapply="Auto Reapply al Respawn",
        secLanguage="Language / Idioma",
        secData="Datos",
        labelDataInfo="Tus animaciones se guardan por Player ID.",
        btnDeleteData="Borrar Todos los Datos",
        labelID="Player ID: ",
        secCredits="Creditos",
        labelCredits="Hecho por TzHzk",
        labelDiscordCredits="discord.gg/TKp5vzE3",
        btnReExecute="🔁 Re-Ejecutar Hub",
        notifWelcome="Bienvenido! v3.2 cargado.",
        notifApplied="Aplicado!",
        notifCopied="Copiado! discord.gg/TKp5vzE3",
        notifDataDeleted="Datos borrados.",
        notifAutoON="Auto Reapply ON",
        notifAutoOFF="Auto Reapply OFF",
        notifGameDefault="Animaciones del juego restauradas!",
        notifReExecute="Re-ejecutando hub...",
    }
}
local function L(k) return T[lang][k] or k end

-- ============================================================
-- EMOTES — sistema nativo PlayEmote de Roblox
-- animId = [1] de cada emote en Motiona
-- ============================================================
local EmoteList = {
    -- Clasicos
    { name="Salute",            id=10714389988  },
    { name="Applaud",           id=10713966026  },
    { name="Shrug",             id=10714374484  },
    { name="Hello",             id=10714359093  },
    { name="Shy",               id=10714369325  },
    { name="Haha",              id=10714350889  },
    { name="Happy",             id=10714352626  },
    { name="Sad",               id=10714392876  },
    { name="Bored",             id=10713992055  },
    { name="Confused",          id=4940561610   },
    { name="Cower",             id=4940563117   },
    { name="Sleep",             id=10714360343  },
    { name="Godlike",           id=10714347256  },
    { name="Greatest",          id=10714349037  },
    { name="Hero Landing",      id=10714360164  },
    { name="Superhero Reveal",  id=10714355069  },
    { name="Heisman Pose",      id=10714357129  },
    { name="Stadium",           id=10714356920  },
    { name="Tilt",              id=10714338461  },
    { name="Monkey",            id=10714388352  },
    { name="Curtsy",            id=10714061912  },
    { name="Point",             id=10714395441  },
    { name="High Wave",         id=10714362852  },
    { name="Quiet Waves",       id=10714390497  },
    -- Bailes
    { name="Hype Dance",        id=10714369624  },
    { name="Floss Dance",       id=10714340543  },
    { name="Cha-Cha",           id=10714018192  },
    { name="Air Guitar",        id=10713959108  },
    { name="Line Dance",        id=10714383856  },
    { name="Baby Dance",        id=10713983178  },
    { name="Celebrate",         id=10714016223  },
    -- Artistas
    { name="Elton John - Heart Shuffle", id=17748314784  },
    { name="Elton John - Heart Skip",    id=11309255148  },
    { name="Elton John - Rock Out",      id=11753474067  },
    { name="Lil Nas X - Old Town Road",  id=10714391240  },
    { name="KSI - Show Dem Wrists",      id=10714377090  },
    { name="BLACKPINK - Pink Venom",     id=14548619594  },
    { name="Yungblud - Happier Jump",    id=15609995579  },
    { name="d4vd - Backflip",            id=15693621070  },
    { name="Cuco - Levitate",            id=15698404340  },
    { name="Mae Stephens - Piano Hands", id=16553163212  },
    { name="Mae Stephens - Arm Wave",    id=16584481352  },
    { name="TMNT Dance",                 id=18665811005  },
    { name="Team USA Breaking",          id=18526288497  },
    { name="The Zabb",                   id=129470135909814 },
    { name="Chappell Roan HOT TO GO",    id=85267023718407  },
    { name="KATSEYE - Touch",            id=135876612109535 },
    -- Marcas
    { name="BURBERRY - Hydro",           id=10147823318  },
    { name="BURBERRY - Bloom",           id=10714007154  },
    { name="BURBERRY - Reflex",          id=10714010337  },
    { name="BURBERRY - Nimbus",          id=10147821284  },
    { name="BURBERRY - Gem",             id=10714008655  },
    { name="Tommy Hilfiger - V Pose",    id=10214319518  },
    { name="Tommy Hilfiger - Frosty",    id=10214311282  },
    { name="Alo Yoga - Lotus",           id=12507085924  },
    { name="Baby Queen - Bouncy Twirl",  id=14352343065  },
    { name="Baby Queen - Face Frame",    id=14352340648  },
    { name="Baby Queen - Strut",         id=14352362059  },
    { name="Skibidi - Laser Spin",       id=134283166482394 },
}

-- ============================================================
-- EMOTE ENGINE
-- Usa PlayEmote BindableFunction nativa del Animate script
-- igual que Motiona — funciona con cualquier emote de Roblox
-- ============================================================
local loopEmoteConn  = nil
local loopEmoteActive = false
local currentLoopId  = nil

local function stopLoopEmote()
    loopEmoteActive = false
    currentLoopId   = nil
    if loopEmoteConn then
        loopEmoteConn:Disconnect()
        loopEmoteConn = nil
    end
end

local function playEmoteOnce(animId)
    stopLoopEmote()
    local char = player.Character
    if not char then return end
    local animate = char:FindFirstChild("Animate")
    if not animate then return end
    local playEmote = animate:FindFirstChild("PlayEmote")
    if not playEmote or not playEmote:IsA("BindableFunction") then return end

    local anim = Instance.new("Animation")
    anim.Name = "TzEmote_"..tostring(animId)
    anim.AnimationId = "rbxassetid://"..tostring(animId)
    anim.Parent = animate -- temporal

    local ok, err = pcall(function()
        playEmote:Invoke(anim)
    end)

    task.delay(0.5, function()
        pcall(function() anim:Destroy() end)
    end)

    if not ok then
        Rayfield:Notify({Title="Emote Error", Content=tostring(err):sub(1,60), Duration=3})
    end
end

local function playEmoteLoop(animId, emoteName)
    stopLoopEmote()
    loopEmoteActive = true
    currentLoopId   = animId

    task.spawn(function()
        while loopEmoteActive and currentLoopId == animId do
            local char = player.Character
            if not char then task.wait(1); continue end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then task.wait(1); continue end
            local animate = char:FindFirstChild("Animate")
            if not animate then task.wait(1); continue end
            local playEmote = animate:FindFirstChild("PlayEmote")
            if not playEmote or not playEmote:IsA("BindableFunction") then task.wait(1); continue end

            -- solo reproducir si el humanoid esta parado
            local state = hum:GetState()
            if state == Enum.HumanoidStateType.Running
            or state == Enum.HumanoidStateType.RunningNoPhysics
            or state == Enum.HumanoidStateType.Standing then
                local anim = Instance.new("Animation")
                anim.Name = "TzEmoteLoop_"..tostring(animId)
                anim.AnimationId = "rbxassetid://"..tostring(animId)
                anim.Parent = animate
                pcall(function() playEmote:Invoke(anim) end)
                task.delay(0.3, function() pcall(function() anim:Destroy() end) end)
                task.wait(3) -- esperar que termine aprox antes de repetir
            else
                task.wait(0.5)
            end
        end
    end)

    Rayfield:Notify({
        Title="Loop Emote ON",
        Content=emoteName.."\nPresiona Stop Loop para parar.",
        Duration=3
    })
end

-- ============================================================
-- ANIMATION LIBRARY
-- ============================================================
local AnimLibrary = {
    ["Your Animation"]   = {idle1="507766666",idle2="507766666",walk="507777826",run="507767714",jump="507765000",climb="507765644",fall="507767968"},
    ["Default"]          = {idle1="507766666",  idle2="507766666",  walk="507777826",  run="507767714",  jump="507765000",  climb="507765644", fall="507767968"},
    ["Zombie"]           = {idle1="616158929",  idle2="616160636",  walk="616168032",  run="616163682",  jump="616161997",  climb="616156119", fall="616157476"},
    ["Zombie FE"]        = {idle1="3489171152", idle2="3489171152", walk="3489174223", run="3489173414", jump="616161997",  climb="616156119", fall="616157476"},
    ["Ninja"]            = {idle1="656117400",  idle2="656118341",  walk="656121766",  run="656118852",  jump="656117878",  climb="656114359", fall="656115606"},
    ["Ninja FE"]         = {idle1="656117400",  idle2="656118341",  walk="656121766",  run="656118852",  jump="658832070",  climb="656114359", fall="658831500"},
    ["Levitation"]       = {idle1="616006778",  idle2="616008087",  walk="616013216",  run="616010382",  jump="616008936",  climb="616003713", fall="616005863"},
    ["Vampire"]          = {idle1="1083445855", idle2="1083450166", walk="1083473930", run="1083462077", jump="1083455352", climb="1083439238",fall="1083443587"},
    ["Hero"]             = {idle1="616111295",  idle2="616113536",  walk="616122287",  run="616117076",  jump="616115533",  climb="616104706", fall="616108001"},
    ["Mage"]             = {idle1="707742142",  idle2="707855907",  walk="707897309",  run="707861613",  jump="707853694",  climb="707826056", fall="707829716"},
    ["Knight"]           = {idle1="657595757",  idle2="657568135",  walk="657552124",  run="657564596",  jump="658409194",  climb="658360781", fall="657600338"},
    ["Cowboy"]           = {idle1="1014390418", idle2="1014398616", walk="1014421541", run="1014401683", jump="1014394726", climb="1014380606",fall="1014384571"},
    ["Pirate"]           = {idle1="750781874",  idle2="750782770",  walk="750785693",  run="750783738",  jump="750782230",  climb="750779899", fall="750780242"},
    ["Werewolf"]         = {idle1="1083195517", idle2="1083214717", walk="1083178339", run="1083216690", jump="1083218792", climb="1083182000",fall="1083189019"},
    ["Ghost"]            = {idle1="616006778",  idle2="616008087",  walk="616010382",  run="616013216",  jump="616008936",  climb="616003713", fall="616005863"},
    ["Elder"]            = {idle1="845397899",  idle2="845400520",  walk="845403856",  run="845386501",  jump="845398858",  climb="845392038", fall="845396048"},
    ["Astronaut"]        = {idle1="891621366",  idle2="891633237",  walk="891667138",  run="891636393",  jump="891627522",  climb="891609353", fall="891617961"},
    ["Cartoon"]          = {idle1="742637544",  idle2="742638445",  walk="742640026",  run="742638842",  jump="742637942",  climb="742636889", fall="742637151"},
    ["Sneaky"]           = {idle1="1132473842", idle2="1132477671", walk="1132510133", run="1132494274", jump="1132489853", climb="1132461372",fall="1132469004"},
    ["Toy"]              = {idle1="782841498",  idle2="782845736",  walk="782843345",  run="782842708",  jump="782847020",  climb="782843869", fall="782846423"},
    ["Confident"]        = {idle1="1069977950", idle2="1069987858", walk="1070017263", run="1070001516", jump="1069984524", climb="1069946257",fall="1069973677"},
    ["Popstar"]          = {idle1="1212900985", idle2="1212900985", walk="1212980338", run="1212980348", jump="1212954642", climb="1213044953",fall="1212900995"},
    ["Princess"]         = {idle1="941003647",  idle2="941013098",  walk="941028902",  run="941015281",  jump="941008832",  climb="940996062", fall="941000007"},
    ["Patrol"]           = {idle1="1149612882", idle2="1150842221", walk="1151231493", run="1150967949", jump="1150944216", climb="1148811837",fall="1148863382"},
    ["Supervillain"]     = {idle1="1284465370", idle2="1284476201", walk="1284473418", run="1284474312", jump="1284471813", climb="1284469123",fall="1284470263"},
    ["Robot"]            = {idle1="3281945838", idle2="3281945838", walk="3281950166", run="3281950166", jump="3281947534", climb="3281952012",fall="3281951008"},
    ["Skating"]          = {idle1="180435571",  idle2="180435571",  walk="10714177846",run="10714177846",jump="507765000",  climb="507765644", fall="507767968"},
    ["Gangster"]         = {idle1="616158929",  idle2="616160636",  walk="1284473418", run="1070001516", jump="656117878",  climb="616156119", fall="616157476"},
    ["Anime Run"]        = {idle1="656117400",  idle2="656118341",  walk="656121766",  run="4849061668", jump="658832070",  climb="656114359", fall="658831500"},
    ["Rthro"]            = {idle1="10921258489",idle2="10921259953",walk="10921269718",run="10921261968", jump="10921263860",climb="10921257536",fall="10921262864"},
    ["Bubbly"]           = {idle1="10921054344",idle2="10921055107",walk="10980888364",run="10921057244", jump="10921062673",climb="10921053544",fall="10921061530"},
    ["Cartoony"]         = {idle1="10921071918",idle2="10921072875",walk="10921082452",run="10921076136", jump="10921078135",climb="10921070953",fall="10921077030"},
    ["Superhero"]        = {idle1="10921288909",idle2="10921290167",walk="10921298616",run="10921291831", jump="10921294559",climb="10921286911",fall="10921293373"},
    ["Stylish"]          = {idle1="10921272275",idle2="10921273958",walk="10921283326",run="10921276116", jump="10921279832",climb="10921271391",fall="10921278648"},
    ["adidas Sports"]    = {idle1="18537376492",idle2="18537371272",walk="18537392113",run="18537384940", jump="18537380791",climb="18537363391",fall="18537367238"},
    ["adidas Community"] = {idle1="126354114956642",idle2="126354114956642",walk="106810508343012",run="124765145869332",jump="115715495289805",climb="93993406355955",fall="93993406355955"},
}

-- ============================================================
-- SCAN FUNCTIONS
-- ============================================================
local originalGameAnims = nil
local yourAnimSlots     = nil
local yourAnimScanned   = false

local function scanYourAnims(char)
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return nil end
    local result = {}
    local idleF = Animate:FindFirstChild("idle")
    if idleF then
        local anims = {}
        for _,c in ipairs(idleF:GetChildren()) do
            if c:IsA("Animation") then table.insert(anims, c.AnimationId) end
        end
        result.idle1 = anims[1] or "rbxassetid://507766666"
        result.idle2 = anims[2] or anims[1] or "rbxassetid://507766666"
    end
    local function firstAnim(n)
        local f = Animate:FindFirstChild(n)
        if not f then return nil end
        for _,c in ipairs(f:GetChildren()) do
            if c:IsA("Animation") then return c.AnimationId end
        end
        return nil
    end
    result.walk  = firstAnim("walk")  or "rbxassetid://507777826"
    result.run   = firstAnim("run")   or "rbxassetid://507767714"
    result.jump  = firstAnim("jump")  or "rbxassetid://507765000"
    result.fall  = firstAnim("fall")  or "rbxassetid://507767968"
    result.climb = firstAnim("climb") or "rbxassetid://507765644"
    return result
end

local function scanOriginalAnims(char)
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return nil end
    local result = {}
    for _, fn in ipairs({"idle","walk","run","jump","fall","climb","swim","swimidle","sit","toolnone","toolslash","toollunge"}) do
        local folder = Animate:FindFirstChild(fn)
        if folder then
            result[fn] = {}
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("Animation") then
                    result[fn][child.Name] = child.AnimationId
                end
            end
        end
    end
    return result
end

-- ============================================================
-- SAVE SYSTEM
-- ============================================================
local saveFile    = "TzHzkHub_"..player.UserId..".txt"
local presetsFile = "TzHzkHub_"..player.UserId.."_presets.txt"

local function saveSlots(slots)
    pcall(function()
        if writefile then
            writefile(saveFile, slots.idle.."|"..slots.walk.."|"..slots.run.."|"..slots.jump.."|"..slots.fall)
        end
    end)
end

local function loadSlots()
    local def={idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
    local ok, data = pcall(function()
        if not readfile then return nil end
        local p=string.split(readfile(saveFile),"|")
        if #p==5 then return {idle=p[1],walk=p[2],run=p[3],jump=p[4],fall=p[5]} end
        return nil
    end)
    if ok and data then
        for k,v in pairs(data) do if not AnimLibrary[v] then data[k]="Default" end end
        return data
    end
    return def
end

local savedPresets={}
for i=1,8 do savedPresets[i]={name="",idle="Default",walk="Default",run="Default",jump="Default",fall="Default"} end

local function savePresets()
    pcall(function()
        if not writefile then return end
        local lines={}
        for i=1,8 do
            local p=savedPresets[i]
            table.insert(lines,p.name.."|"..p.idle.."|"..p.walk.."|"..p.run.."|"..p.jump.."|"..p.fall)
        end
        writefile(presetsFile,table.concat(lines,"\n"))
    end)
end

local function loadPresets()
    pcall(function()
        if not readfile then return end
        local ok,raw=pcall(readfile,presetsFile)
        if not ok or not raw or raw=="" then return end
        for i,line in ipairs(string.split(raw,"\n")) do
            if i>8 then break end
            local p=string.split(line,"|")
            if #p==6 then
                savedPresets[i]={
                    name=p[1],
                    idle =AnimLibrary[p[2]] and p[2] or "Default",
                    walk =AnimLibrary[p[3]] and p[3] or "Default",
                    run  =AnimLibrary[p[4]] and p[4] or "Default",
                    jump =AnimLibrary[p[5]] and p[5] or "Default",
                    fall =AnimLibrary[p[6]] and p[6] or "Default",
                }
            end
        end
    end)
end
loadPresets()

local currentSlots = loadSlots()
local autoReapply  = true

local animNames = {}
table.insert(animNames, "Your Animation")
for k in pairs(AnimLibrary) do
    if k ~= "Your Animation" then table.insert(animNames, k) end
end
table.sort(animNames, function(a,b)
    if a == "Your Animation" then return true end
    if b == "Your Animation" then return false end
    return a < b
end)

local function getVal(v) return type(v)=="table" and v[1] or v end

-- ============================================================
-- SET ANIM IN FOLDER
-- ============================================================
local function setAnimInFolder(folder, newId)
    if not folder then return false end
    for _, child in ipairs(folder:GetChildren()) do
        if child:IsA("Animation") then
            local keepName = child.Name
            local n = Instance.new("Animation")
            n.Name = keepName
            n.AnimationId = newId
            n.Parent = folder
            child:Destroy()
        end
    end
end

-- ============================================================
-- APPLY MIX
-- ============================================================
local function applyMix(silent)
    local char = player.Character
    if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then animator=Instance.new("Animator"); animator.Parent=hum end
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return end

    for k,v in pairs(currentSlots) do
        if not AnimLibrary[v] then currentSlots[k]="Default" end
    end

    local lib = AnimLibrary

    local idleFolder = Animate:FindFirstChild("idle")
    if idleFolder then
        local filtered = {}
        for _,c in ipairs(idleFolder:GetChildren()) do
            if c:IsA("Animation") then table.insert(filtered,c) end
        end
        for idx, child in ipairs(filtered) do
            local newId = idx==1
                and ("rbxassetid://"..lib[currentSlots.idle].idle1)
                or  ("rbxassetid://"..lib[currentSlots.idle].idle2)
            local n=Instance.new("Animation"); n.Name=child.Name; n.AnimationId=newId; n.Parent=idleFolder
            child:Destroy()
        end
    end

    local slots = {
        {folder="walk",  id="rbxassetid://"..lib[currentSlots.walk].walk},
        {folder="run",   id="rbxassetid://"..lib[currentSlots.run].run},
        {folder="jump",  id="rbxassetid://"..lib[currentSlots.jump].jump},
        {folder="fall",  id="rbxassetid://"..lib[currentSlots.fall].fall},
        {folder="climb", id="rbxassetid://"..lib[currentSlots.idle].climb},
    }
    for _,s in ipairs(slots) do
        setAnimInFolder(Animate:FindFirstChild(s.folder), s.id)
    end

    for _,t in ipairs(animator:GetPlayingAnimationTracks()) do t:Stop(0) end
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    task.wait()
    hum:ChangeState(Enum.HumanoidStateType.Running)
    saveSlots(currentSlots)

    if not silent then
        Rayfield:Notify({
            Title="TzHzk Hub — Applied!",
            Content="I:"..currentSlots.idle.." | W:"..currentSlots.walk.."\nR:"..currentSlots.run.." | J:"..currentSlots.jump.." | F:"..currentSlots.fall,
            Duration=4
        })
    end
end

-- ============================================================
-- RESTORE GAME DEFAULT
-- ============================================================
local function restoreGameDefault()
    local char = player.Character
    if not char then return end
    if not originalGameAnims then
        Rayfield:Notify({Title="TzHzk Hub", Content="Original anims not scanned yet. Respawn or re-execute.", Duration=4})
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then animator=Instance.new("Animator"); animator.Parent=hum end
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return end

    for folderName, animTable in pairs(originalGameAnims) do
        local folder = Animate:FindFirstChild(folderName)
        if folder then
            for animName, animId in pairs(animTable) do
                local existing = folder:FindFirstChild(animName)
                if existing and existing:IsA("Animation") then
                    local n=Instance.new("Animation"); n.Name=animName; n.AnimationId=animId; n.Parent=folder
                    existing:Destroy()
                end
            end
        end
    end

    for _,t in ipairs(animator:GetPlayingAnimationTracks()) do t:Stop(0) end
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    task.wait()
    hum:ChangeState(Enum.HumanoidStateType.Running)
    Rayfield:Notify({Title="TzHzk Hub", Content=L("notifGameDefault"), Duration=4})
end

-- ============================================================
-- RE-EXECUTE
-- ============================================================
local SCRIPT_URL = "https://raw.githubusercontent.com/TzHzk/hub/main/AnimHub.lua"

local function reExecute()
    Rayfield:Notify({Title="TzHzk Hub", Content=L("notifReExecute"), Duration=2})
    task.wait(1.5)
    for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
        if gui.Name and (gui.Name:find("Rayfield") or gui.Name:find("TzHzk")) then
            pcall(function() gui:Destroy() end)
        end
    end
    pcall(function() loadstring(game:HttpGet(SCRIPT_URL))() end)
end

-- ============================================================
-- SETUP CHARACTER
-- ============================================================
local function setupCharacter(char)
    task.spawn(function()
        local hum    = char:WaitForChild("Humanoid",10)
        local animate= char:WaitForChild("Animate",10)
        local hrp    = char:WaitForChild("HumanoidRootPart",10)
        if not hum or not animate or not hrp then return end

        local waited=0
        repeat task.wait(0.1); waited+=0.1
        until (hum.Health>0
              and hum:GetState()~=Enum.HumanoidStateType.Dead
              and hum:GetState()~=Enum.HumanoidStateType.None)
              or waited>=5

        if hum.Health<=0 then return end

        if not originalGameAnims then
            task.wait(0.3)
            originalGameAnims = scanOriginalAnims(char)
            local scanned = scanYourAnims(char)
            if scanned then
                yourAnimSlots = scanned
                AnimLibrary["Your Animation"] = {
                    idle1=scanned.idle1:match("%d+") or "507766666",
                    idle2=scanned.idle2:match("%d+") or "507766666",
                    walk =scanned.walk:match("%d+")  or "507777826",
                    run  =scanned.run:match("%d+")   or "507767714",
                    jump =scanned.jump:match("%d+")  or "507765000",
                    climb=scanned.climb:match("%d+") or "507765644",
                    fall =scanned.fall:match("%d+")  or "507767968",
                }
                yourAnimScanned = true
            end
        end

        -- parar loop emote en respawn
        stopLoopEmote()

        task.wait(0.2)
        if autoReapply then applyMix(true) end
    end)
end

player.CharacterAdded:Connect(function(char)
    originalGameAnims=nil; yourAnimScanned=false
    setupCharacter(char)
end)
if player.Character then task.spawn(function() setupCharacter(player.Character) end) end

-- ============================================================
-- WINDOW
-- ============================================================
local Window = Rayfield:CreateWindow({
    Name=L("windowName"), LoadingTitle=L("loadTitle"), LoadingSubtitle=L("loadSub"),
    ConfigurationSaving={Enabled=false}, KeySystem=false
})

-- ============================================================
-- TAB HOME
-- ============================================================
local HomeTab = Window:CreateTab(L("tabHome"), 4483362458)

HomeTab:CreateSection(L("secOwner"))
HomeTab:CreateLabel(L("labelOwner"))
HomeTab:CreateLabel(L("labelVersion"))

HomeTab:CreateSection(L("secUpdate"))
HomeTab:CreateLabel(L("labelUpdate"))

HomeTab:CreateSection("Actions")
HomeTab:CreateButton({Name=L("btnReapply"),    Callback=function() applyMix(false) end})
HomeTab:CreateButton({Name=L("btnGameDefault"),Callback=function() restoreGameDefault() end})
HomeTab:CreateButton({
    Name=L("btnCopyDiscord"),
    Callback=function()
        if setclipboard then setclipboard("discord.gg/TKp5vzE3") end
        Rayfield:Notify({Title="TzHzk Hub", Content=L("notifCopied"), Duration=3})
    end
})

-- ============================================================
-- TAB PRESETS
-- ============================================================
local PresetsTab = Window:CreateTab(L("tabPresets"), 4483362458)

PresetsTab:CreateSection("Special")
PresetsTab:CreateButton({
    Name="⭐ Your Animation",
    Callback=function()
        if not yourAnimScanned then
            Rayfield:Notify({Title="TzHzk Hub", Content="Your animation is still being scanned. Try again!", Duration=3})
            return
        end
        currentSlots={idle="Your Animation",walk="Your Animation",run="Your Animation",jump="Your Animation",fall="Your Animation"}
        applyMix(false)
    end
})
PresetsTab:CreateButton({Name="🎮 Game Default", Callback=function() restoreGameDefault() end})

PresetsTab:CreateSection(L("secPresets"))
for _, name in ipairs(animNames) do
    if name ~= "Default" and name ~= "Your Animation" then
        local n = name
        PresetsTab:CreateButton({
            Name=n,
            Callback=function()
                currentSlots={idle=n,walk=n,run=n,jump=n,fall=n}
                applyMix(false)
            end
        })
    end
end

-- ============================================================
-- TAB MIX ANIMS
-- ============================================================
local MixTab = Window:CreateTab(L("tabMix"), 4483362458)

MixTab:CreateSection(L("secMixSlots"))
MixTab:CreateLabel(L("labelCurrentSlots"))
MixTab:CreateDropdown({Name=L("dropIdle"), Options=animNames, CurrentOption={currentSlots.idle}, MultipleOptions=false, Callback=function(v) currentSlots.idle=getVal(v) end})
MixTab:CreateDropdown({Name=L("dropWalk"), Options=animNames, CurrentOption={currentSlots.walk}, MultipleOptions=false, Callback=function(v) currentSlots.walk=getVal(v) end})
MixTab:CreateDropdown({Name=L("dropRun"),  Options=animNames, CurrentOption={currentSlots.run},  MultipleOptions=false, Callback=function(v) currentSlots.run=getVal(v) end})
MixTab:CreateDropdown({Name=L("dropJump"), Options=animNames, CurrentOption={currentSlots.jump}, MultipleOptions=false, Callback=function(v) currentSlots.jump=getVal(v) end})
MixTab:CreateDropdown({Name=L("dropFall"), Options=animNames, CurrentOption={currentSlots.fall}, MultipleOptions=false, Callback=function(v) currentSlots.fall=getVal(v) end})

MixTab:CreateSection(L("secApply"))
MixTab:CreateButton({Name=L("btnApplyMix"), Callback=function() applyMix(false) end})
MixTab:CreateButton({Name="🎮 Game Default", Callback=function() restoreGameDefault() end})

-- ============================================================
-- TAB SAVE ANIM
-- ============================================================
local SaveTab = Window:CreateTab(L("tabSave"), 4483362458)

SaveTab:CreateSection("How to use")
SaveTab:CreateLabel("1. Set your mix in Mix Anims tab")
SaveTab:CreateLabel("2. Write a name and press Save")
SaveTab:CreateLabel("3. Press Load anytime to re-apply it")

local slotNameInputs={}
local slotLabels={}

local function slotLblText(i)
    local p=savedPresets[i]
    if p.name~="" then
        return("Slot %d [%s]  I:%s W:%s R:%s J:%s F:%s"):format(
            i,p.name,p.idle:sub(1,6),p.walk:sub(1,6),p.run:sub(1,6),p.jump:sub(1,6),p.fall:sub(1,6))
    end
    return "Slot "..i..": (empty)"
end

for i=1,8 do
    local ci=i
    SaveTab:CreateSection("Slot "..ci)
    local lbl=SaveTab:CreateLabel(slotLblText(ci))
    slotLabels[ci]=lbl; slotNameInputs[ci]=""
    SaveTab:CreateInput({
        Name="Name for Slot "..ci, PlaceholderText="e.g. My Zombie Mix",
        RemoveTextAfterFocus=false, Callback=function(t) slotNameInputs[ci]=t end
    })
    SaveTab:CreateButton({
        Name="Save to Slot "..ci,
        Callback=function()
            local nm=slotNameInputs[ci]=="" and ("Preset "..ci) or slotNameInputs[ci]
            savedPresets[ci]={name=nm,idle=currentSlots.idle,walk=currentSlots.walk,
                              run=currentSlots.run,jump=currentSlots.jump,fall=currentSlots.fall}
            savePresets(); lbl:Set(slotLblText(ci))
            Rayfield:Notify({Title="Saved — Slot "..ci,
                Content=nm.."\nI:"..currentSlots.idle.." W:"..currentSlots.walk.."\nR:"..currentSlots.run.." J:"..currentSlots.jump.." F:"..currentSlots.fall,
                Duration=4})
        end
    })
    SaveTab:CreateButton({
        Name="Load Slot "..ci,
        Callback=function()
            local p=savedPresets[ci]
            if p.name=="" then Rayfield:Notify({Title="TzHzk Hub",Content="Slot "..ci.." is empty!",Duration=3}); return end
            currentSlots={idle=p.idle,walk=p.walk,run=p.run,jump=p.jump,fall=p.fall}
            applyMix(false)
            Rayfield:Notify({Title="Loaded: "..p.name,
                Content="I:"..p.idle.." W:"..p.walk.."\nR:"..p.run.." J:"..p.jump.." F:"..p.fall,Duration=4})
        end
    })
    SaveTab:CreateButton({
        Name="Clear Slot "..ci,
        Callback=function()
            savedPresets[ci]={name="",idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
            savePresets(); lbl:Set(slotLblText(ci))
            Rayfield:Notify({Title="TzHzk Hub",Content="Slot "..ci.." cleared.",Duration=2})
        end
    })
end

-- ============================================================
-- TAB EMOTES
-- Sistema: PlayEmote BindableFunction nativa de Roblox
-- Igual que Motiona — funciona en cualquier juego R15
-- ============================================================
local EmotesTab = Window:CreateTab(L("tabEmotes"), 4483362458)

EmotesTab:CreateSection("Controls")
EmotesTab:CreateLabel("Press a button to play the emote once.")
EmotesTab:CreateLabel("Use Loop to repeat it. Stop Loop to cancel.")
EmotesTab:CreateButton({
    Name="⏹ Stop Loop Emote",
    Callback=function()
        stopLoopEmote()
        Rayfield:Notify({Title="TzHzk Hub", Content="Loop emote stopped.", Duration=2})
    end
})

-- Secciones por categoria
local categories = {
    { name="🎭 Clasicos", entries={
        "Salute","Applaud","Shrug","Hello","Shy","Haha","Happy","Sad",
        "Bored","Confused","Cower","Sleep","Godlike","Greatest",
        "Hero Landing","Superhero Reveal","Heisman Pose","Stadium",
        "Tilt","Monkey","Curtsy","Point","High Wave","Quiet Waves",
    }},
    { name="💃 Bailes", entries={
        "Hype Dance","Floss Dance","Cha-Cha","Air Guitar",
        "Line Dance","Baby Dance","Celebrate",
    }},
    { name="🎤 Artistas", entries={
        "Elton John - Heart Shuffle","Elton John - Heart Skip","Elton John - Rock Out",
        "Lil Nas X - Old Town Road","KSI - Show Dem Wrists","BLACKPINK - Pink Venom",
        "Yungblud - Happier Jump","d4vd - Backflip","Cuco - Levitate",
        "Mae Stephens - Piano Hands","Mae Stephens - Arm Wave",
        "TMNT Dance","Team USA Breaking","The Zabb",
        "Chappell Roan HOT TO GO","KATSEYE - Touch",
    }},
    { name="🏷️ Marcas", entries={
        "BURBERRY - Hydro","BURBERRY - Bloom","BURBERRY - Reflex",
        "BURBERRY - Nimbus","BURBERRY - Gem",
        "Tommy Hilfiger - V Pose","Tommy Hilfiger - Frosty",
        "Alo Yoga - Lotus","Baby Queen - Bouncy Twirl",
        "Baby Queen - Face Frame","Baby Queen - Strut",
        "Skibidi - Laser Spin",
    }},
}

-- Mapear nombre → id
local emoteMap = {}
for _, e in ipairs(EmoteList) do emoteMap[e.name] = e.id end

for _, cat in ipairs(categories) do
    EmotesTab:CreateSection(cat.name)
    for _, emoteName in ipairs(cat.entries) do
        local eid  = emoteMap[emoteName]
        local ename= emoteName
        if eid then
            EmotesTab:CreateButton({
                Name="▶ "..ename,
                Callback=function() playEmoteOnce(eid) end
            })
            EmotesTab:CreateButton({
                Name="🔁 Loop — "..ename,
                Callback=function() playEmoteLoop(eid, ename) end
            })
        end
    end
end

-- ============================================================
-- TAB SETTINGS
-- ============================================================
local SettingsTab = Window:CreateTab(L("tabSettings"), 4483362458)

SettingsTab:CreateSection(L("secAutoReapply"))
SettingsTab:CreateToggle({
    Name=L("toggleAutoReapply"), CurrentValue=true,
    Callback=function(v)
        autoReapply=v
        Rayfield:Notify({Title="TzHzk Hub", Content=v and L("notifAutoON") or L("notifAutoOFF"), Duration=3})
    end
})

SettingsTab:CreateSection(L("secLanguage"))
SettingsTab:CreateDropdown({
    Name="Language / Idioma",
    Options={"English","Español"},
    CurrentOption={"English"},
    MultipleOptions=false,
    Callback=function(v) lang=getVal(v)=="English" and "EN" or "ES" end
})
SettingsTab:CreateButton({
    Name=L("btnReExecute"),
    Callback=function() reExecute() end
})

SettingsTab:CreateSection(L("secData"))
SettingsTab:CreateLabel(L("labelDataInfo"))
SettingsTab:CreateLabel(L("labelID")..player.UserId)
SettingsTab:CreateButton({
    Name=L("btnDeleteData"),
    Callback=function()
        pcall(function()
            if writefile then
                writefile(saveFile,"Default|Default|Default|Default|Default")
                writefile(presetsFile,"")
            end
        end)
        currentSlots={idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
        for i=1,8 do
            savedPresets[i]={name="",idle="Default",walk="Default",run="Default",jump="Default",fall="Default"}
            if slotLabels[i] then slotLabels[i]:Set(slotLblText(i)) end
        end
        applyMix(false)
        Rayfield:Notify({Title="TzHzk Hub", Content=L("notifDataDeleted"), Duration=3})
    end
})

SettingsTab:CreateSection(L("secCredits"))
SettingsTab:CreateLabel(L("labelCredits"))
SettingsTab:CreateLabel(L("labelDiscordCredits"))

-- ============================================================
Rayfield:Notify({Title="TzHzk Hub v3.2", Content=L("notifWelcome"), Duration=5})
