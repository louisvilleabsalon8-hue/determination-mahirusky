-- DETERMINATION + PSM FRESH SKY V2
-- iPad / Delta
-- Visual pack + JUMP SFX ONLY + PSM Sky

local env=(getgenv and getgenv()) or _G
local KEY="__DETERMINATION_PSM_COMBINED_V1"

if env[KEY] and env[KEY].cleanup then
    pcall(env[KEY].cleanup)
end

local state={connections={},running=true,queued=setmetatable({},{__mode="k"})}
env[KEY]=state

local W,A=writefile,getcustomasset or getsynasset
if not(W and A)then
    warn("Custom asset APIs missing")
    return
end

local function disconnectAll()
    for _,c in ipairs(state.connections) do
        pcall(function()c:Disconnect()end)
    end
end

--==================================================
-- SECTION 1: DETERMINATION VISUAL PACK + JUMP SFX
--==================================================

local Rules={}

local function add(ids,url,name)
    table.insert(Rules,{ids=ids,url=url,name=name})
end

local function replace(ids,id,name)
    table.insert(Rules,{ids=ids,with_id=id,name=name})
end

-- Fonts
add({12187323909,12187320363,12187354260,12187342816,
12187280273,12187303601,12187262242,12187288714,
12187341500,12187271237,12187341020},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/deltarune.ttf","Deltarune font")

add({12187323909,12187320363,12187354260,12187342816,
12187280273,12187303601,12187262242,12187288714,
12187341500,12187271237,12187341020},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/PixelOperator-Bold.ttf","Pixel font")

-- Arena
replace({7658055825},6372755229,"Arena basalt")

-- Icons and images
add({16802957270},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/heartbroken.png","Elimination icon")

add({81461991645938},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/lvl.png","Level icon")

add({13854780042},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/heartleft.png","Heart left")

add({13854780213},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/heartright.png","Heart right")

add({17803962335},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/undlogo.png","Logo")

add({13188153054,13188242420,13220167472,13220167337},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/lvl.png","HUD")

-- Skybox-related visual replacements
replace({
2108482005,14147881792,135908632589654,84214501374682,
10196550937,12261809766,2108545280,10196550667,
14147882149,103020541883227,89972436184102,12261813110,
14147883091,2108482395,10196550128,14147882405,
2108482542,10196549902,14147881297,72960281658487,
92138082970751,2108482676,10196567794,12261813678,
14147882761,10196550367,2108482231
},7658055825,"Trap skybox")

add({127338559130032,16294586406,75156669118637,93477262732302},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/SyneMono-Regular.ttf","Onyx support")

-- Character / rank images
add({133917828562858,121503061771505},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/58a20c59c8dd3432c6fa8221.png","Flowey")

add({133793956251748},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Archnemisis_heart_1.png","Arch X+")

add({116941545385923},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Nemisis_heart_1.png","Nemesis X")

add({106623367501544,131795064007344,73543520622815},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/f.png","Bronze 3")

add({80716950169934},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Silver_1_heart.png","Silver 1")

add({136100661820261},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/silver_2_heart.png","Silver 2")

add({107898816876115},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/silver_3_heart.png","Silver 3")

add({134520747948636},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Gold_1_heart.png","Gold 1")

add({114166096331502},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Gold_2_heart.png","Gold 2")

add({90039594400813},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Gold_3_heart.png","Gold 3")

add({133903971285645},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Plat_1_heart.png","Plat 1")

add({82834564754747},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Plat_2_heart.png","Plat 2")

add({73345783863790},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Plat_3_heart.png","Plat 3")

add({113997689031026},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Diam_1_heart.png","Diamond 1")

add({88059506918419},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Diam_2_heart.png","Diamond 2")

add({112183171942172},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Diam_3_heart.png","Diamond 3")

add({104871954739030},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Onyx_1_heart.png","Onyx 1")

add({109012386782238},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Onyx_2_heart.png","Onyx 2")

add({127982903682334},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/Onyx_3_heart.png","Onyx 3")

add({106623367501544},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/bronze_1_heart_fixed_2_times.png","Bronze 1")

add({131795064007344},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/bronze_2_heart.png","Bronze 2")

add({17175092502,17094014569},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/streak.png","Streak icon")

add({111599878354131},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/unranked_heart.png","Unranked")

-- ONLY SOUND EFFECT KEPT: JUMP
add({16770456156},
"https://raw.githubusercontent.com/prism658/undertale-txtpack/main/mus_sfx_a_lithit.wav","Jump sound")

--==================================================
-- ASSET DOWNLOADER
--==================================================

local function getAsset(url,name)
    local ok,result=pcall(function()
        local clean=url:match("^[^?]+") or url
        local ext=clean:match("%.([%w]+)$") or "asset"
        local file="det_psm_"..name.."."..ext

        local body=game:HttpGet(url)
        if type(body)~="string" or #body<=80 then
            error("Download failed: "..name)
        end

        W(file,body)
        return A(file)
    end)

    if ok then return result end
    warn("[DETERMINATION] "..tostring(result))
end

local IdMap={}

for i,rule in ipairs(Rules) do
    if not state.running then return end

    local replacement

    if rule.url then
        replacement=getAsset(rule.url,"det_"..i)
    elseif rule.with_id then
        replacement="rbxassetid://"..tostring(rule.with_id)
    end

    if replacement then
        for _,id in ipairs(rule.ids) do
            IdMap[tostring(id)]=replacement
        end
    end

    if i%4==0 then task.wait(0.05) end
end

local function idOf(v)
    if type(v)~="string" then return nil end
    return v:match("rbxassetid://(%d+)")
        or v:match("[?&]id=(%d+)")
        or v:match("(%d+)")
end

--==================================================
-- SECTION 2: PSM FRESH SKY V2
--==================================================

local SkyURLs={
    ft="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_ft.png",
    lf="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_lf.png",
    rt="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_rt.png",
    dn="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_dn.png",
    bk="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_bk%20(2).png",
    up="https://raw.githubusercontent.com/sukablyst400-eng/fleasion_z7/main/sky512_up.png"
}

local SkyProperties={
    bk="SkyboxBk",dn="SkyboxDn",ft="SkyboxFt",
    lf="SkyboxLf",rt="SkyboxRt",up="SkyboxUp"
}

local SkyAssets={}

for _,face in ipairs({"bk","dn","ft","lf","rt","up"}) do
    if not state.running then return end
    SkyAssets[face]=getAsset(SkyURLs[face],"sky_"..face)
    task.wait(0.12)
end

local Lighting=game:GetService("Lighting")
local creating=false

local function freshSky()
    if not state.running or creating then return end
    creating=true

    for _,v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            pcall(function()v:Destroy()end)
        end
    end

    local sky=Instance.new("Sky")
    sky.Name="PSMFreshSky"

    for face,asset in pairs(SkyAssets) do
        if asset then
            pcall(function()
                sky[SkyProperties[face]]=asset
            end)
        end
    end

    sky.Parent=Lighting
    creating=false
end

freshSky()

for _,t in ipairs({0.5,1.5,3,6,10}) do
    task.delay(t,freshSky)
end

local last=0

table.insert(state.connections,Lighting.ChildAdded:Connect(function(obj)
    if not state.running then return end

    if obj:IsA("Sky") and obj.Name~="PSMFreshSky" then
        local now=os.clock()
        if now-last>0.5 then
            last=now
            task.delay(0.15,freshSky)
        end
    end
end))

--==================================================
-- SECTION 3: ADAPTIVE REPLACEMENT LOADER
--==================================================

local queue={}
local head=1

local function inspect(obj)
    if not state.running or not obj or not obj.Parent then return end

    if obj:IsA("Sound") then
        local ok,value=pcall(function()return obj.SoundId end)
        local id=ok and idOf(value)
        if id and id=="16770456156" and IdMap[id] then
            pcall(function()obj.SoundId=IdMap[id]end)
        end

    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        local ok,value=pcall(function()return obj.Texture end)
        local id=ok and idOf(value)
        if id and IdMap[id] and not state.queued[obj] then
            state.queued[obj]=true
            queue[#queue+1]={obj,"Texture",IdMap[id]}
        end

    elseif obj:IsA("MeshPart") then
        local ok,value=pcall(function()return obj.TextureID end)
        local id=ok and idOf(value)
        if id and IdMap[id] and not state.queued[obj] then
            state.queued[obj]=true
            queue[#queue+1]={obj,"TextureID",IdMap[id]}
        end

    elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
        local ok,value=pcall(function()return obj.Image end)
        local id=ok and idOf(value)
        if id and IdMap[id] and not state.queued[obj] then
            state.queued[obj]=true
            queue[#queue+1]={obj,"Image",IdMap[id]}
        end
    end
end

task.spawn(function()
    local all=game:GetDescendants()
    for i,obj in ipairs(all) do
        if not state.running then return end
        inspect(obj)
        if i%250==0 then task.wait() end
    end
end)

table.insert(state.connections,game.DescendantAdded:Connect(function(obj)
    task.defer(function()
        if state.running and obj.Parent then inspect(obj) end
    end)
end))

task.spawn(function()
    while state.running do
        local count=0

        while head<=#queue and count<8 do
            local item=queue[head]
            head=head+1
            count=count+1

            local obj,prop,replacement=item[1],item[2],item[3]
            if obj and obj.Parent then
                pcall(function()obj[prop]=replacement end)
            end
        end

        if head>1000 then
            local newQueue={}
            for i=head,#queue do
                newQueue[#newQueue+1]=queue[i]
            end
            queue=newQueue
            head=1
        end

        task.wait(0.10)
    end
end)

state.cleanup=function()
    state.running=false
    disconnectAll()
end

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title="DETERMINATION + PSM SKY",
        Text="Visual pack + Jump SFX + Fresh Sky loaded",
        Duration=6
    })
end)

print("[DETERMINATION + PSM] Loaded successfully")
