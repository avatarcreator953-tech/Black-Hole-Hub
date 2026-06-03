-- [[ 🌌 BLACK HOLE HUB | ArtSquadFive | PROGRESSION UPDATE 🌌 ]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("BlackHoleHub") then CoreGui.BlackHoleHub:Destroy() end

local _G = {
    AutoFarmLevel = false,
    FarmDistance = 12,          -- дистанция от 8 до 20, по умолчанию 12
    FarmSpeed = 250,
    AutoFruitFinder = false,
    AutoChestSteal = false,
    Noclip = false,
    InfJump = false,
    SpamSkills = true,
    SelectedWeapon = nil,
    CurrentRunningNPC = nil
}

local WeaponsList = {}
local collectedFruits = {}
local currentSkillIndex = 1
local lastSkillTime = 0
local skillKeys = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V}
local currentTarget = nil

------------------------------------------------------------------------
-- ПОЛНАЯ ТАБЛИЦА КВЕСТОВ ИЗ ИГРОВЫХ ФАЙЛОВ
------------------------------------------------------------------------
local MainQuestTable = {
    BanditQuest1 = { { LevelReq = 0, Name = "Bandits", Task = { ["Bandit"] = 5 } } },
    MarineQuest = { { LevelReq = 0, Name = "Trainees", Task = { ["Trainee"] = 5 } } },
    JungleQuest = { { LevelReq = 10, Name = "Monkeys", Task = { ["Monkey"] = 6 } }, { LevelReq = 15, Name = "Gorillas", Task = { ["Gorilla"] = 8 } }, { LevelReq = 20, Name = "Gorilla King", Task = { ["The Gorilla King"] = 1 } } },
    BuggyQuest1 = { { LevelReq = 30, Name = "Pirates", Task = { ["Pirate"] = 8 } }, { LevelReq = 40, Name = "Brute", Task = { ["Brute"] = 8 } }, { LevelReq = 55, Name = "Chef", Task = { ["Chef"] = 1 } } },
    DesertQuest = { { LevelReq = 60, Name = "Desert Bandit", Task = { ["Desert Bandit"] = 8 } }, { LevelReq = 75, Name = "Desert Officer", Task = { ["Desert Officer"] = 6 } } },
    SnowQuest = { { LevelReq = 90, Name = "Snow Bandit", Task = { ["Snow Bandit"] = 7 } }, { LevelReq = 100, Name = "Snowman", Task = { ["Snowman"] = 8 } }, { LevelReq = 105, Name = "Yeti", Task = { ["Yeti"] = 1 } } },
    MarineQuest2 = { { LevelReq = 120, Name = "Chief Petty Officer", Task = { ["Chief Petty Officer"] = 8 } }, { LevelReq = 130, Name = "Vice Admiral", Task = { ["Vice Admiral"] = 1 } } },
    SkyQuest = { { LevelReq = 150, Name = "Sky Bandit", Task = { ["Sky Bandit"] = 7 } }, { LevelReq = 175, Name = "Dark Master", Task = { ["Dark Master"] = 8 } } },
    PrisonerQuest = { { LevelReq = 190, Name = "Prisoner", Task = { ["Prisoner"] = 8 } }, { LevelReq = 210, Name = "Dangerous Prisoner", Task = { ["Dangerous Prisoner"] = 8 } } },
    ImpelQuest = { { LevelReq = 220, Name = "Warden", Task = { ["Warden"] = 1 } }, { LevelReq = 230, Name = "Chief Warden", Task = { ["Chief Warden"] = 1 } }, { LevelReq = 240, Name = "Swan", Task = { ["Swan"] = 1 } } },
    ColosseumQuest = { { LevelReq = 250, Name = "Toga Warrior", Task = { ["Toga Warrior"] = 7 } }, { LevelReq = 275, Name = "Gladiator", Task = { ["Gladiator"] = 8 } } },
    MagmaQuest = { { LevelReq = 300, Name = "Mil. Soldier", Task = { ["Military Soldier"] = 7 } }, { LevelReq = 325, Name = "Mil. Spy", Task = { ["Military Spy"] = 8 } }, { LevelReq = 350, Name = "Magma Admiral", Task = { ["Magma Admiral"] = 1 } } },
    FishmanQuest = { { LevelReq = 375, Name = "Fishman Warrior", Task = { ["Fishman Warrior"] = 8 } }, { LevelReq = 400, Name = "Fishman Commando", Task = { ["Fishman Commando"] = 7 } }, { LevelReq = 425, Name = "Fishman Lord", Task = { ["Fishman Lord"] = 1 } } },
    SkyExp1Quest = { { LevelReq = 450, Name = "God's Guard", Task = { ["God's Guard"] = 7 } }, { LevelReq = 475, Name = "Shanda", Task = { ["Shanda"] = 9 } }, { LevelReq = 500, Name = "Wysper", Task = { ["Wysper"] = 1 } } },
    SkyExp2Quest = { { LevelReq = 525, Name = "Royal Squad", Task = { ["Royal Squad"] = 8 } }, { LevelReq = 550, Name = "Royal Soldier", Task = { ["Royal Soldier"] = 8 } }, { LevelReq = 575, Name = "Thunder God", Task = { ["Thunder God"] = 1 } } },
    FountainQuest = { { LevelReq = 625, Name = "Galley Pirate", Task = { ["Galley Pirate"] = 8 } }, { LevelReq = 650, Name = "Galley Captain", Task = { ["Galley Captain"] = 9 } }, { LevelReq = 675, Name = "Cyborg", Task = { ["Cyborg"] = 1 } } },
    Area1Quest = { { LevelReq = 700, Name = "Raider", Task = { ["Raider"] = 8 } }, { LevelReq = 725, Name = "Mercenary", Task = { ["Mercenary"] = 8 } }, { LevelReq = 750, Name = "Diamond", Task = { ["Diamond"] = 1 } } },
    Area2Quest = { { LevelReq = 775, Name = "Swan Pirate", Task = { ["Swan Pirate"] = 8 } }, { LevelReq = 800, Name = "Factory Staff", Task = { ["Factory Staff"] = 8 } }, { LevelReq = 850, Name = "Jeremy", Task = { ["Jeremy"] = 1 } } },
    MarineQuest3 = { { LevelReq = 875, Name = "Marine Lieutenant", Task = { ["Marine Lieutenant"] = 8 } }, { LevelReq = 900, Name = "Marine Captain", Task = { ["Marine Captain"] = 9 } }, { LevelReq = 925, Name = "Orbitus", Task = { ["Orbitus"] = 1 } } },
    ZombieQuest = { { LevelReq = 950, Name = "Zombie", Task = { ["Zombie"] = 8 } }, { LevelReq = 975, Name = "Vampire", Task = { ["Vampire"] = 8 } } },
    SnowMountainQuest = { { LevelReq = 1000, Name = "Snow Trooper", Task = { ["Snow Trooper"] = 8 } }, { LevelReq = 1050, Name = "Winter Warrior", Task = { ["Winter Warrior"] = 9 } } },
    IceSideQuest = { { LevelReq = 1100, Name = "Lab Subordinate", Task = { ["Lab Subordinate"] = 8 } }, { LevelReq = 1125, Name = "Horned Warrior", Task = { ["Horned Warrior"] = 9 } }, { LevelReq = 1150, Name = "Smoke Admiral", Task = { ["Smoke Admiral"] = 1 } } },
    FireSideQuest = { { LevelReq = 1175, Name = "Magma Ninja", Task = { ["Magma Ninja"] = 8 } }, { LevelReq = 1200, Name = "Lava Pirate", Task = { ["Lava Pirate"] = 8 } } },
    ShipQuest1 = { { LevelReq = 1250, Name = "Ship Deckhand", Task = { ["Ship Deckhand"] = 8 } }, { LevelReq = 1275, Name = "Ship Engineer", Task = { ["Ship Engineer"] = 8 } } },
    ShipQuest2 = { { LevelReq = 1300, Name = "Ship Steward", Task = { ["Ship Steward"] = 8 } }, { LevelReq = 1325, Name = "Ship Officer", Task = { ["Ship Officer"] = 8 } } },
    FrostQuest = { { LevelReq = 1350, Name = "Arctic Warrior", Task = { ["Arctic Warrior"] = 8 } }, { LevelReq = 1375, Name = "Snow Lurker", Task = { ["Snow Lurker"] = 8 } }, { LevelReq = 1400, Name = "Ice Admiral", Task = { ["Awakened Ice Admiral"] = 1 } } },
    ForgottenQuest = { { LevelReq = 1425, Name = "Sea Soldier", Task = { ["Sea Soldier"] = 8 } }, { LevelReq = 1450, Name = "Water Fighter", Task = { ["Water Fighter"] = 8 } }, { LevelReq = 1475, Name = "Tide Keeper", Task = { ["Tide Keeper"] = 1 } } },
    PiratePortQuest = { { LevelReq = 1500, Name = "Pirate Millionaire", Task = { ["Pirate Millionaire"] = 8 } }, { LevelReq = 1525, Name = "Pistol Billionaire", Task = { ["Pistol Billionaire"] = 8 } }, { LevelReq = 1550, Name = "Stone", Task = { ["Stone"] = 1 } } },
    DragonCrewQuest = { { LevelReq = 1575, Name = "Dragon Crew Warrior", Task = { ["Dragon Crew Warrior"] = 8 } }, { LevelReq = 1600, Name = "Dragon Crew Archer", Task = { ["Dragon Crew Archer"] = 8 } } },
    VenomCrewQuest = { { LevelReq = 1625, Name = "Hydra Enforcer", Task = { ["Hydra Enforcer"] = 8 } }, { LevelReq = 1650, Name = "Venomous Assailant", Task = { ["Venomous Assailant"] = 8 } }, { LevelReq = 1675, Name = "Hydra Leader", Task = { ["Hydra Leader"] = 1 } } },
    MarineTreeIsland = { { LevelReq = 1700, Name = "Marine Commodore", Task = { ["Marine Commodore"] = 8 } }, { LevelReq = 1725, Name = "Marine Rear Admiral", Task = { ["Marine Rear Admiral"] = 8 } }, { LevelReq = 1750, Name = "Kilo Admiral", Task = { ["Kilo Admiral"] = 1 } } },
    DeepForestIsland3 = { { LevelReq = 1775, Name = "Fishman Raider", Task = { ["Fishman Raider"] = 8 } }, { LevelReq = 1800, Name = "Fishman Captain", Task = { ["Fishman Captain"] = 8 } } },
    DeepForestIsland = { { LevelReq = 1825, Name = "Forest Pirate", Task = { ["Forest Pirate"] = 8 } }, { LevelReq = 1850, Name = "Mythological Pirate", Task = { ["Mythological Pirate"] = 8 } }, { LevelReq = 1875, Name = "Captain Elephant", Task = { ["Captain Elephant"] = 1 } } },
    DeepForestIsland2 = { { LevelReq = 1900, Name = "Jungle Pirate", Task = { ["Jungle Pirate"] = 8 } }, { LevelReq = 1925, Name = "Musketeer Pirate", Task = { ["Musketeer Pirate"] = 8 } }, { LevelReq = 1950, Name = "Beautiful Pirate", Task = { ["Beautiful Pirate"] = 1 } } },
    HauntedQuest1 = { { LevelReq = 1975, Name = "Reborn Skeleton", Task = { ["Reborn Skeleton"] = 8 } }, { LevelReq = 2000, Name = "Living Zombie", Task = { ["Living Zombie"] = 8 } } },
    HauntedQuest2 = { { LevelReq = 2025, Name = "Demonic Soul", Task = { ["Demonic Soul"] = 8 } }, { LevelReq = 2050, Name = "Posessed Mummy", Task = { ["Posessed Mummy"] = 8 } } },
    NutsIslandQuest = { { LevelReq = 2075, Name = "Peanut Scout", Task = { ["Peanut Scout"] = 8 } }, { LevelReq = 2100, Name = "Peanut President", Task = { ["Peanut President"] = 8 } } },
    IceCreamIslandQuest = { { LevelReq = 2125, Name = "Ice Cream Chef", Task = { ["Ice Cream Chef"] = 8 } }, { LevelReq = 2150, Name = "Ice Cream Commander", Task = { ["Ice Cream Commander"] = 8 } }, { LevelReq = 2175, Name = "Cake Queen", Task = { ["Cake Queen"] = 1 } } },
    CakeQuest1 = { { LevelReq = 2200, Name = "Cookie Crafter", Task = { ["Cookie Crafter"] = 8 } }, { LevelReq = 2225, Name = "Cake Guard", Task = { ["Cake Guard"] = 8 } } },
    CakeQuest2 = { { LevelReq = 2250, Name = "Baking Staff", Task = { ["Baking Staff"] = 8 } }, { LevelReq = 2275, Name = "Head Baker", Task = { ["Head Baker"] = 8 } } },
    ChocQuest1 = { { LevelReq = 2300, Name = "Cocoa Warrior", Task = { ["Cocoa Warrior"] = 8 } }, { LevelReq = 2325, Name = "Chocolate Bar Battler", Task = { ["Chocolate Bar Battler"] = 8 } } },
    ChocQuest2 = { { LevelReq = 2350, Name = "Sweet Thief", Task = { ["Sweet Thief"] = 8 } }, { LevelReq = 2375, Name = "Candy Rebel", Task = { ["Candy Rebel"] = 8 } } },
    CandyQuest1 = { { LevelReq = 2400, Name = "Candy Pirate", Task = { ["Candy Pirate"] = 8 } }, { LevelReq = 2425, Name = "Snow Demon", Task = { ["Snow Demon"] = 8 } } },
    TikiQuest1 = { { LevelReq = 2450, Name = "Isle Outlaw", Task = { ["Isle Outlaw"] = 8 } }, { LevelReq = 2475, Name = "Island Boy", Task = { ["Island Boy"] = 8 } } },
    TikiQuest2 = { { LevelReq = 2500, Name = "Sun-kissed Warrior", Task = { ["Sun-kissed Warrior"] = 8 } }, { LevelReq = 2525, Name = "Isle Champion", Task = { ["Isle Champion"] = 8 } } },
    TikiQuest3 = { { LevelReq = 2550, Name = "Serpent Hunter", Task = { ["Serpent Hunter"] = 8 } }, { LevelReq = 2575, Name = "Skull Slayer", Task = { ["Skull Slayer"] = 8 } } },
    SubmergedQuest1 = { { LevelReq = 2600, Name = "Reef Bandit", Task = { ["Reef Bandit"] = 8 } }, { LevelReq = 2625, Name = "Coral Pirate", Task = { ["Coral Pirate"] = 8 } } },
    SubmergedQuest2 = { { LevelReq = 2650, Name = "Sea Chanter", Task = { ["Sea Chanter"] = 8 } }, { LevelReq = 2675, Name = "Ocean Prophet", Task = { ["Ocean Prophet"] = 8 } } },
    SubmergedQuest3 = { { LevelReq = 2675, Name = "High Disciple", Task = { ["High Disciple"] = 8 } }, { LevelReq = 2700, Name = "Grand Devotee", Task = { ["Grand Devotee"] = 8 } } }
}

------------------------------------------------------------------------
-- ОПРЕДЕЛЕНИЕ УСТРОЙСТВА (ПК / ТЕЛЕФОН)
------------------------------------------------------------------------
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local viewport = Workspace.CurrentCamera.ViewportSize
local scale = 1
if isMobile then
    scale = math.min(viewport.X / 620, viewport.Y / 420)
end

------------------------------------------------------------------------
-- СОЗДАНИЕ ИНТЕРФЕЙСА
------------------------------------------------------------------------
local BlackHoleHub = Instance.new("ScreenGui")
BlackHoleHub.Name = "BlackHoleHub"
BlackHoleHub.Parent = CoreGui
BlackHoleHub.ResetOnSpawn = false
BlackHoleHub.IgnoreGuiInset = true

-- ИНТРО
local IntroFrame = Instance.new("Frame", BlackHoleHub)
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IntroFrame.ZIndex = 500

local IntroImage = Instance.new("ImageLabel", IntroFrame)
IntroImage.Size = UDim2.new(1, 0, 1, 0)
IntroImage.BackgroundTransparency = 1
IntroImage.Image = "rbxassetid://89122563169047"
IntroImage.ImageTransparency = 1
IntroImage.ScaleType = Enum.ScaleType.Crop
IntroImage.ZIndex = 501

local IntroText = Instance.new("TextLabel", IntroFrame)
IntroText.Size = UDim2.new(1, 0, 0, 100)
IntroText.Position = UDim2.new(0, 0, 0.5, -50)
IntroText.BackgroundTransparency = 1
IntroText.Text = "BLACK HOLE HUB"
IntroText.TextColor3 = Color3.fromRGB(255, 140, 0)
IntroText.Font = Enum.Font.GothamBlack
IntroText.TextSize = 60
IntroText.TextTransparency = 1
IntroText.ZIndex = 502

local SubText = Instance.new("TextLabel", IntroFrame)
SubText.Size = UDim2.new(1, 0, 0, 50)
SubText.Position = UDim2.new(0, 0, 0.5, 40)
SubText.BackgroundTransparency = 1
SubText.Text = "by ArtSquadFive"
SubText.TextColor3 = Color3.fromRGB(255, 255, 255)
SubText.Font = Enum.Font.GothamBold
SubText.TextSize = 25
SubText.TextTransparency = 1
SubText.ZIndex = 502

TweenService:Create(IntroImage, TweenInfo.new(2, Enum.EasingStyle.Quad), {ImageTransparency = 0.4}):Play()
task.wait(1)
TweenService:Create(IntroText, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
TweenService:Create(SubText, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
task.wait(2.5)
TweenService:Create(IntroText, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(SubText, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(IntroImage, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
TweenService:Create(IntroFrame, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
task.wait(1.5)
IntroFrame:Destroy()

-- ОСНОВНОЙ ФРЕЙМ
local Main = Instance.new("Frame", BlackHoleHub)
Main.Name = "MainFrame"
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
if isMobile then
    Main.Size = UDim2.new(1, 0, 1, 0)
    Main.Position = UDim2.new(0, 0, 0, 0)
else
    Main.Size = UDim2.new(0, 620, 0, 420)
    Main.Position = UDim2.new(0.5, -310, 0.5, -210)
end
Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

if isMobile then
    local UIScale = Instance.new("UIScale", Main)
    UIScale.Scale = scale
end

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 2
local StrokeGradient = Instance.new("UIGradient", MainStroke)
StrokeGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))}
StrokeGradient.Rotation = 45

local BgImage = Instance.new("ImageLabel", Main)
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.BackgroundTransparency = 1
BgImage.Image = "rbxassetid://89122563169047"
BgImage.ImageTransparency = 0.85
BgImage.ScaleType = Enum.ScaleType.Crop

local TopBar = Instance.new("Frame", Main)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 10, 5)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 0.5
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Text = "BLACK HOLE HUB | ArtSquadFive"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
TitleLabel.TextSize = 16
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка показать/скрыть (только на телефонах)
local MobileToggleBtn = Instance.new("ImageButton", BlackHoleHub)
if isMobile then
    MobileToggleBtn.Size = UDim2.new(0, 50, 0, 50)
    MobileToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
else
    MobileToggleBtn.Visible = false
end
MobileToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
MobileToggleBtn.Image = "rbxassetid://89122563169047"
Instance.new("UICorner", MobileToggleBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", MobileToggleBtn).Color = Color3.fromRGB(255,255,255)

MobileToggleBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

local dragToggle, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true; dragStart = input.Position; startPos = Main.Position
        for _, child in ipairs(BlackHoleHub:GetChildren()) do
            if child.Name == "DropdownWindow" then child.Visible = false end
        end
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragToggle = false end
end)

local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.BackgroundTransparency = 0.6
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 160, 1, -60)
Sidebar.ScrollBarThickness = 2
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)
local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Container = Instance.new("Frame", Main)
Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Container.BackgroundTransparency = 0.6
Container.Position = UDim2.new(0, 180, 0, 50)
Container.Size = UDim2.new(1, -190, 1, -60)
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 8)

local Tabs = {}
local function CreateTab(name)
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Size = UDim2.new(0.9, 0, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(30, 20, 10)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 14
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Page = Instance.new("ScrollingFrame", Container)
    Page.Size = UDim2.new(1, -10, 1, -10)
    Page.Position = UDim2.new(0, 5, 0, 5)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.BorderSizePixel = 0
    
    local layout = Instance.new("UIListLayout", Page)
    layout.Padding = UDim.new(0, 8)
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Page.Visible = false
            TweenService:Create(tab.Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 20, 10), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
        Page.Visible = true
        TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0), TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
        for _, child in ipairs(BlackHoleHub:GetChildren()) do
            if child.Name == "DropdownWindow" then child.Visible = false end
        end
    end)

    table.insert(Tabs, {Page = Page, Btn = TabBtn})
    return Page
end

------------------------------------------------------------------------
-- КОНСТРУКТОРЫ ЭЛЕМЕНТОВ
------------------------------------------------------------------------
local function CreateToggle(parent, text, default, callback)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(1, 0, 0, 35)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.5
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Check = Instance.new("TextButton", Frame)
    Check.Size = UDim2.new(0, 25, 0, 25)
    Check.Position = UDim2.new(1, -35, 0.5, -12.5)
    Check.BackgroundColor3 = default and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(20, 20, 20)
    Check.Text = ""
    Instance.new("UICorner", Check).CornerRadius = UDim.new(0, 6)

    local state = default
    Check.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(Check, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(20, 20, 20)}):Play()
        pcall(callback, state)
    end)
end

local function CreateSlider(parent, text, min, max, default, callback)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.5
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. tostring(default)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Bg = Instance.new("Frame", Frame)
    Bg.Size = UDim2.new(1, -20, 0, 6)
    Bg.Position = UDim2.new(0, 10, 0, 30)
    Bg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", Bg).CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame", Bg)
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

    local Btn = Instance.new("TextButton", Bg)
    Btn.Size = UDim2.new(1, 0, 1, 0)
    Btn.BackgroundTransparency = 1
    Btn.Text = ""

    local dragging = false
    local function update(input)
        local pos = math.clamp((input.Position.X - Bg.AbsolutePosition.X) / Bg.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + ((max - min) * pos))
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        Label.Text = text .. ": " .. tostring(val)
        pcall(callback, val)
    end

    Btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; update(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end
    end)
end

local function CreateDropdown(parent, text, list_func, callback)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(1, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.5
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -160, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(230, 230, 230)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local DropBtn = Instance.new("TextButton", Frame)
    DropBtn.Size = UDim2.new(0, 140, 0, 30)
    DropBtn.Position = UDim2.new(1, -150, 0.5, -15)
    DropBtn.Text = "Выбрать..."
    DropBtn.Font = Enum.Font.GothamBold
    DropBtn.TextSize = 12
    DropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", DropBtn).CornerRadius = UDim.new(0, 6)

    local DropList = Instance.new("ScrollingFrame")
    DropList.Name = "DropdownWindow"
    DropList.Size = UDim2.new(0, 140, 0, 120)
    DropList.Visible = false
    DropList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    DropList.BorderSizePixel = 0
    DropList.ZIndex = 300
    DropList.ScrollBarThickness = 4
    Instance.new("UICorner", DropList).CornerRadius = UDim.new(0, 6)
    
    local stroke = Instance.new("UIStroke", DropList)
    stroke.Color = Color3.fromRGB(255, 140, 0)
    stroke.Thickness = 1
    
    local listLayout = Instance.new("UIListLayout", DropList)
    listLayout.Padding = UDim.new(0, 2)
    
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        DropList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 5)
    end)
    
    DropList.Parent = BlackHoleHub

    DropBtn.MouseButton1Click:Connect(function()
        for _, child in ipairs(BlackHoleHub:GetChildren()) do
            if child:IsA("ScrollingFrame") and child.Name == "DropdownWindow" and child ~= DropList then
                child.Visible = false
            end
        end

        DropList.Visible = not DropList.Visible
        if DropList.Visible then
            DropList.Position = UDim2.new(0, DropBtn.AbsolutePosition.X, 0, DropBtn.AbsolutePosition.Y + DropBtn.AbsoluteSize.Y + 4)
            for _, child in ipairs(DropList:GetChildren()) do 
                if child:IsA("TextButton") then child:Destroy() end 
            end
            
            local current_list = type(list_func) == "function" and list_func() or list_func
            for _, v in ipairs(current_list) do
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 30)
                btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                btn.Text = tostring(v)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 12
                btn.ZIndex = 310
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
                
                btn.MouseButton1Click:Connect(function()
                    DropBtn.Text = tostring(v)
                    DropList.Visible = false
                    pcall(callback, v)
                end)
                
                btn.Parent = DropList
            end
        end
    end)
end

------------------------------------------------------------------------
-- УМНАЯ ДИНАМИЧЕСКАЯ СИСТЕМА ОПРЕДЕЛЕНИЯ КВЕСТА
------------------------------------------------------------------------
local function GetQuestData()
    local lvl = 1
    pcall(function() 
        if LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") then
            lvl = LocalPlayer.Data.Level.Value 
        end
    end)
    
    local bestMatch = nil
    local highestLvl = -1
    
    for qKey, qData in pairs(MainQuestTable) do
        for index, info in ipairs(qData) do
            if info.LevelReq <= lvl and info.LevelReq > highestLvl then
                local tName = ""
                local tCount = 0
                for k, v in pairs(info.Task) do tName = k; tCount = v end
                
                if tCount == 1 then
                    local enemies = Workspace:FindFirstChild("Enemies") or Workspace
                    local bossAlive = false
                    for _, enemy in ipairs(enemies:GetChildren()) do
                        if enemy.Name == tName and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            bossAlive = true
                            break
                        end
                    end
                    
                    if bossAlive then
                        highestLvl = info.LevelReq
                        bestMatch = {qKey = qKey, qId = index, npcName = tName}
                    end
                else
                    highestLvl = info.LevelReq
                    bestMatch = {qKey = qKey, qId = index, npcName = tName}
                end
            end
        end
    end
    
    if not bestMatch then
        highestLvl = -1
        for qKey, qData in pairs(MainQuestTable) do
            for index, info in ipairs(qData) do
                if info.LevelReq <= lvl and info.LevelReq > highestLvl then
                    local tName = ""
                    for k, _ in pairs(info.Task) do tName = k end
                    highestLvl = info.LevelReq
                    bestMatch = {qKey = qKey, qId = index, npcName = tName}
                end
            end
        end
    end
    
    return bestMatch.qKey, bestMatch.qId, bestMatch.npcName
end

local function GetWeapons()
    table.clear(WeaponsList)
    local function scan(folder)
        if not folder then return end
        for _, item in ipairs(folder:GetChildren()) do
            if item:IsA("Tool") and not table.find(WeaponsList, item.Name) then 
                table.insert(WeaponsList, item.Name) 
            end
        end
    end
    if LocalPlayer and LocalPlayer:FindFirstChild("Backpack") then scan(LocalPlayer.Backpack) end
    if LocalPlayer.Character then scan(LocalPlayer.Character) end
    if #WeaponsList == 0 then table.insert(WeaponsList, "Пусто") end
    return WeaponsList
end

local function EquipWeapon()
    if not _G.SelectedWeapon or _G.SelectedWeapon == "Пусто" then return end
    local char = LocalPlayer.Character
    if char and not char:FindFirstChild(_G.SelectedWeapon) then
        local tool = LocalPlayer.Backpack:FindFirstChild(_G.SelectedWeapon)
        if tool then tool.Parent = char end
    end
end

local function ClickAttack()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))
    end)
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
    pcall(function()
        if LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end)
end

local function SpamSkills()
    if not _G.SpamSkills then return end
    if tick() - lastSkillTime >= 3 then
        local key = skillKeys[currentSkillIndex]
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        task.wait(0.1)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
        currentSkillIndex = currentSkillIndex % #skillKeys + 1
        lastSkillTime = tick()
    end
end

-- Плавный полёт к точке (для подбора фруктов/сундуков)
local function FlyTo(targetPos)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    local dist = (root.Position - targetPos).Magnitude
    local dur = dist / _G.FarmSpeed
    local tween = TweenService:Create(root, TweenInfo.new(dur, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
    tween:Play()
    tween.Completed:Wait()
end

------------------------------------------------------------------------
-- СБОРКА СТРАНИЦ ИНТЕРФЕЙСА
------------------------------------------------------------------------
local FarmTab = CreateTab("⚔️ Фарм")
local WorldTab = CreateTab("🌍 Мир")
local SettingsTab = CreateTab("⚙️ Настройки")

CreateToggle(FarmTab, "Включить Автофарм", false, function(s) _G.AutoFarmLevel = s; if not s then currentTarget = nil end end)
CreateToggle(FarmTab, "Авто-Спам Скиллов", true, function(s) _G.SpamSkills = s end)
CreateSlider(FarmTab, "Дистанция атаки", 8, 20, _G.FarmDistance, function(v) _G.FarmDistance = v end)
CreateDropdown(FarmTab, "Выбери Оружие", GetWeapons, function(v) _G.SelectedWeapon = v end)

CreateToggle(WorldTab, "Авто-Подбор Фруктов", false, function(s) _G.AutoFruitFinder = s end)
CreateToggle(WorldTab, "Магнит Сундуков", false, function(s) _G.AutoChestSteal = s end)

CreateSlider(SettingsTab, "Скорость Полета", 100, 450, _G.FarmSpeed, function(v) _G.FarmSpeed = v end)
CreateToggle(SettingsTab, "Noclip (Сквозь Стены)", false, function(s) _G.Noclip = s end)
CreateToggle(SettingsTab, "Бесконечные Прыжки", false, function(s) _G.InfJump = s end)

------------------------------------------------------------------------
-- ИГРОВЫЕ ПОТОКИ
------------------------------------------------------------------------
RunService.Stepped:Connect(function()
    if (_G.Noclip or _G.AutoFarmLevel) and LocalPlayer.Character then
        for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ГЛАВНЫЙ ЦИКЛ ФАРМА
task.spawn(function()
    while task.wait(0.1) do
        if not _G.AutoFarmLevel or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            currentTarget = nil
            _G.CurrentRunningNPC = nil
            continue
        end

        pcall(function()
            local qKey, qId, npcName = GetQuestData()
            local hasQuest = false
            pcall(function()
                if LocalPlayer.PlayerGui:FindFirstChild("Main") and LocalPlayer.PlayerGui.Main:FindFirstChild("Quest") then
                    hasQuest = LocalPlayer.PlayerGui.Main.Quest.Visible
                end
            end)

            if _G.CurrentRunningNPC ~= npcName then
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes and remotes:FindFirstChild("CommF_") then
                    remotes.CommF_:InvokeServer("StartQuest", qKey, qId)
                end
                _G.CurrentRunningNPC = npcName
                task.wait(0.3)
                return
            end

            if not hasQuest then
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes and remotes:FindFirstChild("CommF_") then
                    remotes.CommF_:InvokeServer("StartQuest", qKey, qId)
                end
                task.wait(0.3)
                return
            end

            local enemies = Workspace:FindFirstChild("Enemies") or Workspace
            local nearest = nil
            local minDist = math.huge

            for _, child in ipairs(enemies:GetChildren()) do
                if child.Name == npcName and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearest = child
                    end
                end
            end

            currentTarget = nearest

            if nearest then
                EquipWeapon()
                while nearest and nearest.Parent and nearest:FindFirstChild("Humanoid") and nearest.Humanoid.Health > 0 and _G.AutoFarmLevel do
                    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end

                    local checkKey, checkId, checkNpc = GetQuestData()
                    if checkNpc ~= npcName then break end

                    ClickAttack()
                    SpamSkills()
                    task.wait(0.12)
                end
                currentTarget = nil
            else
                local enemySpawn = nil
                pcall(function()
                    if Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("EnemySpawns") then
                        enemySpawn = Workspace._WorldOrigin.EnemySpawns:FindFirstChild(npcName)
                    end
                end)
                if enemySpawn then
                    FlyTo(enemySpawn.Position + Vector3.new(0, 10, 0))
                else
                    task.wait(0.5)
                end
            end
        end)
    end
end)

-- ПОСТОЯННОЕ ПРИКЛЕИВАНИЕ К СПИНЕ ЦЕЛИ (КЛЕЙ)
RunService.RenderStepped:Connect(function()
    if not _G.AutoFarmLevel then return end
    if not currentTarget or not currentTarget.Parent or not currentTarget:FindFirstChild("HumanoidRootPart") then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local mobRoot = currentTarget.HumanoidRootPart
    local myRoot = char.HumanoidRootPart

    -- позиция строго за спиной врага, смотрим ему в спину
    local behindCF = mobRoot.CFrame * CFrame.new(0, 0, _G.FarmDistance)
    local lookAt = mobRoot.Position -- смотрим на врага (ему в спину)
    local targetCF = CFrame.lookAt(behindCF.Position, lookAt)

    -- мгновенная фиксация, как клей
    myRoot.CFrame = targetCF
end)

-- ОСТАЛЬНЫЕ ПОТОКИ (ФРУКТЫ, СУНДУКИ)
task.spawn(function()
    while task.wait(1) do
        if _G.AutoFruitFinder and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("Tool") and obj:FindFirstChild("Handle") and (obj.Name:lower():find("fruit") or obj.Name:lower():find("devil")) then
                    if obj.Parent == Workspace or obj.Parent:IsA("Folder") then
                        local fruitId = obj.Name .. "_" .. (obj:GetAttribute("FruitID") or "")
                        if not collectedFruits[fruitId] then
                            collectedFruits[fruitId] = true
                            FlyTo(obj.Handle.Position)
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.4) do
        if _G.AutoChestSteal and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local chest = nil
            if Workspace:FindFirstChild("ChestModels") then chest = Workspace.ChestModels:FindFirstChildWhichIsA("Model") end
            if not chest then
                for _, el in ipairs(Workspace:GetChildren()) do
                    if el.Name:lower():find("chest") and el:IsA("Model") then chest = el; break end
                end
            end
            if chest then
                local p = chest:FindFirstChildWhichIsA("BasePart") or chest
                if p then
                    FlyTo(p.Position)
                    task.wait(0.2)
                    pcall(function()
                        local prompt = chest:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then fireproximityprompt(prompt) end
                    end)
                end
            end
        end
    end
end)

pcall(function() Tabs[1].Btn.MouseButton1Click:Fire() end)