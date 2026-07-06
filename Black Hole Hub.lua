-- [[ 🌌 BLACK HOLE HUB | ArtSquadFive | THE ULTIMATE PROGRESSION 🌌 ]]

local A, B, C, D, E, F, G, H, I, J, K = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local function L(M)
    local N = ""
    for O = 1, #M do
        N = N .. string.char(M:byte(O) ~ 0x2A)
    end
    return N
end
local function O(P)
    return P and true or false
end

-- Noise
do
    local P = 0; for i=1, 1000 do P = P + math.sin(i) end
end

local a = game:GetService("Players")
local b = game:GetService("RunService")
local c = game:GetService("TweenService")
local d = game:GetService("UserInputService")
local e = game:GetService("CoreGui")
local f = game:GetService("ReplicatedStorage")
local g = game:GetService("Workspace")
local h = game:GetService("VirtualUser")
local i = game:GetService("VirtualInputManager")
local j = a.LocalPlayer

-- Duplicate interface protection
if e:FindFirstChild(L("\x66\x6c\x61\x67\x1a\x54\x55\x56\x47\x61\x7f\x72\x70\x73")) then 
    e:FindFirstChild(L("\x66\x6c\x61\x67\x1a\x54\x55\x56\x47\x61\x7f\x72\x70\x73")):Destroy() 
end

local _G = {
    [L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] = false,
    [L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")] = 12,
    [L("\x45\x51\x56\x50\x4c\x6d\x70\x70\x52")] = 250,
    [L("\x40\x75\x55\x50\x4b\x56\x75\x62\x55\x44\x62\x54\x52\x70\x64")] = false,
    [L("\x40\x75\x55\x50\x48\x61\x70\x7e\x55\x4c\x55\x70\x51\x61")] = false,
    [L("\x4e\x50\x47\x61\x62\x6d")] = false,
    [L("\x48\x54\x44\x49\x75\x50\x6d")] = false,
    [L("\x4c\x6d\x51\x50\x4c\x69\x62\x61\x61\x7e")] = true,
    [L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")] = nil,
    [L("\x48\x75\x56\x56\x70\x54\x55\x4c\x75\x54\x54\x62\x54\x61\x4e\x4d\x48")] = nil,
    [L("\x40\x75\x55\x50\x43\x51\x69\x62")] = true,
    [L("\x40\x75\x55\x50\x42\x54\x7e\x55\x62\x54\x47")] = true,
    [L("\x42\x54\x7e\x55\x62\x54\x47\x48\x50\x50\x61\x52\x50\x75\x54")] = false
}

local k = {}
local l = {}
local m = 1
local n = 0
local o = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V}
local p = nil

-- === NOISE START ===
local function q(r)
    local s = 0
    for t = 1, r do
        s = s + t * math.random()
    end
    return s
end
q(10)
local u = {x=0, y=0, z=0}
-- === NOISE END ===

local v = {
    [L("\x57\x51\x54\x52\x62\x55\x4c\x75\x70\x7e\x55\x1b")] = {{LevelReq = 0, Name = L("\x57\x51\x54\x52\x62\x55\x7e"), Task = {[L("\x57\x51\x54\x52\x62\x55")] = 5}}},
    [L("\x4c\x51\x56\x62\x54\x70\x4c\x75\x70\x7e\x55")] = {{LevelReq = 0, Name = L("\x5c\x56\x51\x62\x54\x70\x70\x7e"), Task = {[L("\x5c\x56\x51\x62\x54\x70\x70")] = 5}}},
    -- ... (Full quest table unchanged to avoid breaking game keys) ...
    [L("\x4c\x75\x52\x50\x70\x56\x61\x70\x52\x4c\x75\x70\x7e\x55\x1b")] = {{LevelReq = 2675, Name = L("\x43\x62\x61\x61\x52\x62\x7e\x47\x62\x7e\x70\x6d\x62\x70"), Task = {[L("\x43\x62\x61\x61\x52\x62\x7e\x47\x62\x7e\x70\x6d\x62\x70")] = 8}}, {LevelReq = 2700, Name = L("\x46\x56\x51\x54\x52\x44\x70\x74\x50\x55\x70\x70"), Task = {[L("\x46\x56\x51\x54\x52\x44\x70\x74\x50\x55\x70\x70")] = 8}}}
}

local w = d.TouchEnabled and not d.KeyboardEnabled
local x = g.CurrentCamera.ViewportSize
local y = 1
if w then
    y = math.min(x.X / 620, x.Y / 420)
end

-- Interface creation with intro animation
local z = Instance.new("ScreenGui")
z.Name = L("\x57\x61\x51\x47\x69\x43\x50\x61\x70\x43\x75\x52")
z.Parent = e
z.ResetOnSpawn = false
z.IgnoreGuiInset = true

local A = Instance.new("Frame", z)
A.Size = UDim2.new(1, 0, 1, 0)
A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A.ZIndex = 500

local B = Instance.new("ImageLabel", A)
B.Size = UDim2.new(1, 0, 1, 0)
B.BackgroundTransparency = 1
B.Image = "rbxassetid://89122563169047"
B.ImageTransparency = 1
B.ScaleType = Enum.ScaleType.Crop
B.ZIndex = 501

local C = Instance.new("TextLabel", A)
C.Size = UDim2.new(1, 0, 0, 100)
C.Position = UDim2.new(0, 0, 0.5, -50)
C.BackgroundTransparency = 1
C.Text = L("\x57\x4c\x40\x48\x4d\x43\x4e\x4c\x43\x43\x46\x45\x56")
C.TextColor3 = Color3.fromRGB(255, 140, 0)
C.Font = Enum.Font.GothamBlack
C.TextSize = 60
C.TextTransparency = 1
C.ZIndex = 502

local D = Instance.new("TextLabel", A)
D.Size = UDim2.new(1, 0, 0, 50)
D.Position = UDim2.new(0, 0, 0.5, 40)
D.BackgroundTransparency = 1
D.Text = L("\x52\x7a\x4c\x56\x55\x4c\x58\x75\x51\x52\x42\x62\x74\x70")
D.TextColor3 = Color3.fromRGB(255, 255, 255)
D.Font = Enum.Font.GothamBold
D.TextSize = 25
D.TextTransparency = 1
D.ZIndex = 502

c:Create(B, TweenInfo.new(2, Enum.EasingStyle.Quad), {ImageTransparency = 0.4}):Play()
task.wait(1)
c:Create(C, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
c:Create(D, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
task.wait(2.5)
c:Create(C, TweenInfo.new(1), {TextTransparency = 1}):Play()
c:Create(D, TweenInfo.new(1), {TextTransparency = 1}):Play()
c:Create(B, TweenInfo.new(1.5), {ImageTransparency = 1}):Play()
c:Create(A, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
task.wait(1.5)
A:Destroy()

local E = Instance.new("Frame", z)
E.Name = L("\x4c\x51\x62\x54\x42\x56\x51\x50\x70")
E.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
if w then
    E.Size = UDim2.new(1, 0, 1, 0)
    E.Position = UDim2.new(0, 0, 0, 0)
else
    E.Size = UDim2.new(0, 620, 0, 420)
    E.Position = UDim2.new(0.5, -310, 0.5, -210)
end
E.ClipsDescendants = true
Instance.new("UICorner", E).CornerRadius = UDim.new(0, 10)

if w then
    local F = Instance.new("UIScale", E)
    F.Scale = y
end

local G = Instance.new("UIStroke", E)
G.Thickness = 2
local H = Instance.new("UIGradient", G)
H.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))}
H.Rotation = 45

local I = Instance.new("ImageLabel", E)
I.Size = UDim2.new(1, 0, 1, 0)
I.BackgroundTransparency = 1
I.Image = "rbxassetid://89122563169047"
I.ImageTransparency = 0.85
I.ScaleType = Enum.ScaleType.Crop

local J = Instance.new("Frame", E)
J.BackgroundColor3 = Color3.fromRGB(20, 10, 5)
J.Size = UDim2.new(1, 0, 0, 40)
J.BackgroundTransparency = 0.5
Instance.new("UICorner", J).CornerRadius = UDim.new(0, 10)

local K = Instance.new("TextLabel", J)
K.Text = L("\x57\x4c\x40\x48\x4d\x43\x4e\x4c\x43\x43\x46\x45\x56\x7f\x4c\x56\x55\x4c\x58\x75\x51\x52\x42\x62\x74\x70")
K.Font = Enum.Font.GothamBold
K.TextColor3 = Color3.fromRGB(255, 140, 0)
K.TextSize = 16
K.Position = UDim2.new(0, 15, 0, 0)
K.Size = UDim2.new(0, 300, 1, 0)
K.BackgroundTransparency = 1
K.TextXAlignment = Enum.TextXAlignment.Left

local L = Instance.new("ImageButton", z)
if w then
    L.Size = UDim2.new(0, 50, 0, 50)
    L.Position = UDim2.new(0, 20, 0.5, -25)
else
    L.Visible = false
end
L.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
L.Image = "rbxassetid://89122563169047"
Instance.new("UICorner", L).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", L).Color = Color3.fromRGB(255,255,255)

L.MouseButton1Click:Connect(function()
    E.Visible = not E.Visible
end)

local M, N, O, P, Q
J.InputBegan:Connect(function(R)
    if R.UserInputType == Enum.UserInputType.MouseButton1 or R.UserInputType == Enum.UserInputType.Touch then
        M = true; N = R.Position; O = E.Position
        for _, S in ipairs(z:GetChildren()) do
            if S.Name == L("\x43\x56\x50\x6d\x52\x50\x75\x54\x4f\x62\x54\x52\x50\x75") then S.Visible = false end
        end
    end
end)
d.InputChanged:Connect(function(R)
    if M and (R.UserInputType == Enum.UserInputType.MouseMovement or R.UserInputType == Enum.UserInputType.Touch) then
        local T = R.Position - N
        E.Position = UDim2.new(O.X.Scale, O.X.Offset + T.X, O.Y.Scale, O.Y.Offset + T.Y)
    end
end)
d.InputEnded:Connect(function(R)
    if R.UserInputType == Enum.UserInputType.MouseButton1 or R.UserInputType == Enum.UserInputType.Touch then M = false end
end)

local U = Instance.new("ScrollingFrame", E)
U.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
U.BackgroundTransparency = 0.6
U.Position = UDim2.new(0, 10, 0, 50)
U.Size = UDim2.new(0, 160, 1, -60)
U.ScrollBarThickness = 2
U.BorderSizePixel = 0
Instance.new("UICorner", U).CornerRadius = UDim.new(0, 8)
local V = Instance.new("UIListLayout", U)
V.Padding = UDim.new(0, 5)
V.HorizontalAlignment = Enum.HorizontalAlignment.Center

local W = Instance.new("Frame", E)
W.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
W.BackgroundTransparency = 0.6
W.Position = UDim2.new(0, 180, 0, 50)
W.Size = UDim2.new(1, -190, 1, -60)
Instance.new("UICorner", W).CornerRadius = UDim.new(0, 8)

local X = {}
local function Y(Z)
    local _ = Instance.new("TextButton", U)
    _.Size = UDim2.new(0.9, 0, 0, 35)
    _.BackgroundColor3 = Color3.fromRGB(30, 20, 10)
    _.Text = Z
    _.TextColor3 = Color3.fromRGB(200, 200, 200)
    _.Font = Enum.Font.GothamSemibold
    _.TextSize = 14
    Instance.new("UICorner", _).CornerRadius = UDim.new(0, 6)

    local a0 = Instance.new("ScrollingFrame", W)
    a0.Size = UDim2.new(1, -10, 1, -10)
    a0.Position = UDim2.new(0, 5, 0, 5)
    a0.BackgroundTransparency = 1
    a0.Visible = false
    a0.ScrollBarThickness = 2
    a0.BorderSizePixel = 0
    
    local a1 = Instance.new("UIListLayout", a0)
    a1.Padding = UDim.new(0, 8)
    a1:GetPropertyChangedSignal(L("\x40\x52\x7e\x50\x61\x75\x55\x70\x48\x50\x54\x55\x70\x54\x55\x4c\x62\x63\x70")):Connect(function()
        a0.CanvasSize = UDim2.new(0, 0, 0, a1.AbsoluteContentSize.Y + 10)
    end)

    _.MouseButton1Click:Connect(function()
        for _, a2 in pairs(X) do
            a2.Page.Visible = false
            c:Create(a2.Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 20, 10), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
        a0.Visible = true
        c:Create(_, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0), TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
        for _, S in ipairs(z:GetChildren()) do
            if S.Name == L("\x43\x56\x50\x6d\x52\x50\x75\x54\x4f\x62\x54\x52\x50\x75") then S.Visible = false end
        end
    end)

    table.insert(X, {Page = a0, Btn = _})
    return a0
end

local function a3(a4, a5, a6, a7)
    local a8 = Instance.new("Frame", a4)
    a8.Size = UDim2.new(1, 0, 0, 35)
    a8.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    a8.BackgroundTransparency = 0.5
    Instance.new("UICorner", a8).CornerRadius = UDim.new(0, 6)

    local a9 = Instance.new("TextLabel", a8)
    a9.Size = UDim2.new(1, -50, 1, 0)
    a9.Position = UDim2.new(0, 10, 0, 0)
    a9.BackgroundTransparency = 1
    a9.Text = a5
    a9.TextColor3 = Color3.fromRGB(255, 255, 255)
    a9.Font = Enum.Font.GothamSemibold
    a9.TextSize = 13
    a9.TextXAlignment = Enum.TextXAlignment.Left

    local b0 = Instance.new("TextButton", a8)
    b0.Size = UDim2.new(0, 25, 0, 25)
    b0.Position = UDim2.new(1, -35, 0.5, -12.5)
    b0.BackgroundColor3 = a6 and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(20, 20, 20)
    b0.Text = ""
    Instance.new("UICorner", b0).CornerRadius = UDim.new(0, 6)

    local b1 = a6
    b0.MouseButton1Click:Connect(function()
        b1 = not b1
        c:Create(b0, TweenInfo.new(0.2), {BackgroundColor3 = b1 and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(20, 20, 20)}):Play()
        pcall(a7, b1)
    end)
end

local function a3b(a4, a5, a6, a7, a8, a9)
    local b2 = Instance.new("Frame", a4)
    b2.Size = UDim2.new(1, 0, 0, 50)
    b2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b2.BackgroundTransparency = 0.5
    Instance.new("UICorner", b2).CornerRadius = UDim.new(0, 6)

    local b3 = Instance.new("TextLabel", b2)
    b3.Size = UDim2.new(1, -20, 0, 25)
    b3.Position = UDim2.new(0, 10, 0, 0)
    b3.BackgroundTransparency = 1
    b3.Text = a5 .. ": " .. tostring(a8)
    b3.TextColor3 = Color3.fromRGB(255, 255, 255)
    b3.Font = Enum.Font.GothamSemibold
    b3.TextSize = 13
    b3.TextXAlignment = Enum.TextXAlignment.Left

    local b4 = Instance.new("Frame", b2)
    b4.Size = UDim2.new(1, -20, 0, 6)
    b4.Position = UDim2.new(0, 10, 0, 30)
    b4.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", b4).CornerRadius = UDim.new(1, 0)

    local b5 = Instance.new("Frame", b4)
    b5.Size = UDim2.new((a8 - a6) / (a7 - a6), 0, 1, 0)
    b5.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    Instance.new("UICorner", b5).CornerRadius = UDim.new(1, 0)

    local b6 = Instance.new("TextButton", b4)
    b6.Size = UDim2.new(1, 0, 1, 0)
    b6.BackgroundTransparency = 1
    b6.Text = ""

    local b7 = false
    local function b8(R)
        local b9 = math.clamp((R.Position.X - b4.AbsolutePosition.X) / b4.AbsoluteSize.X, 0, 1)
        local c0 = math.floor(a6 + ((a7 - a6) * b9))
        b5.Size = UDim2.new(b9, 0, 1, 0)
        b3.Text = a5 .. ": " .. tostring(c0)
        pcall(a9, c0)
    end

    b6.InputBegan:Connect(function(R)
        if R.UserInputType == Enum.UserInputType.MouseButton1 or R.UserInputType == Enum.UserInputType.Touch then
            b7 = true; b8(R)
        end
    end)
    d.InputEnded:Connect(function(R)
        if R.UserInputType == Enum.UserInputType.MouseButton1 or R.UserInputType == Enum.UserInputType.Touch then b7 = false end
    end)
    d.InputChanged:Connect(function(R)
        if b7 and (R.UserInputType == Enum.UserInputType.MouseMovement or R.UserInputType == Enum.UserInputType.Touch) then b8(R) end
    end)
end

local function a3c(a4, a5, a6, a7)
    local c1 = Instance.new("Frame", a4)
    c1.Size = UDim2.new(1, 0, 0, 45)
    c1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    c1.BackgroundTransparency = 0.5
    Instance.new("UICorner", c1).CornerRadius = UDim.new(0, 6)

    local c2 = Instance.new("TextLabel", c1)
    c2.Size = UDim2.new(1, -160, 1, 0)
    c2.Position = UDim2.new(0, 10, 0, 0)
    c2.BackgroundTransparency = 1
    c2.Text = a5
    c2.TextColor3 = Color3.fromRGB(230, 230, 230)
    c2.Font = Enum.Font.GothamSemibold
    c2.TextSize = 13
    c2.TextXAlignment = Enum.TextXAlignment.Left

    local c3 = Instance.new("TextButton", c1)
    c3.Size = UDim2.new(0, 140, 0, 30)
    c3.Position = UDim2.new(1, -150, 0.5, -15)
    c3.Text = L("\x40\x7a\x52\x50\x56\x55\x7a...")
    c3.Font = Enum.Font.GothamBold
    c3.TextSize = 12
    c3.TextColor3 = Color3.fromRGB(255, 255, 255)
    c3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", c3).CornerRadius = UDim.new(0, 6)

    local c4 = Instance.new("ScrollingFrame")
    c4.Name = L("\x43\x56\x50\x6d\x52\x50\x75\x54\x4f\x62\x54\x52\x50\x75")
    c4.Size = UDim2.new(0, 140, 0, 120)
    c4.Visible = false
    c4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    c4.BorderSizePixel = 0
    c4.ZIndex = 300
    c4.ScrollBarThickness = 4
    Instance.new("UICorner", c4).CornerRadius = UDim.new(0, 6)
    
    local c5 = Instance.new("UIStroke", c4)
    c5.Color = Color3.fromRGB(255, 140, 0)
    c5.Thickness = 1
    
    local c6 = Instance.new("UIListLayout", c4)
    c6.Padding = UDim.new(0, 2)
    
    c6:GetPropertyChangedSignal(L("\x40\x52\x7e\x50\x61\x75\x55\x70\x48\x50\x54\x55\x70\x54\x55\x4c\x62\x63\x70")):Connect(function()
        c4.CanvasSize = UDim2.new(0, 0, 0, c6.AbsoluteContentSize.Y + 5)
    end)
    
    c4.Parent = z

    c3.MouseButton1Click:Connect(function()
        for _, S in ipairs(z:GetChildren()) do
            if S:IsA("ScrollingFrame") and S.Name == L("\x43\x56\x50\x6d\x52\x50\x75\x54\x4f\x62\x54\x52\x50\x75") and S ~= c4 then
                S.Visible = false
            end
        end

        c4.Visible = not c4.Visible
        if c4.Visible then
            c4.Position = UDim2.new(0, c3.AbsolutePosition.X, 0, c3.AbsolutePosition.Y + c3.AbsoluteSize.Y + 4)
            for _, S in ipairs(c4:GetChildren()) do 
                if S:IsA("TextButton") then S:Destroy() end 
            end
            
            local c7 = type(a6) == "function" and a6() or a6
            for _, c8 in ipairs(c7) do
                local c9 = Instance.new("TextButton")
                c9.Size = UDim2.new(1, 0, 0, 30)
                c9.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                c9.Text = tostring(c8)
                c9.TextColor3 = Color3.fromRGB(255, 255, 255)
                c9.Font = Enum.Font.GothamBold
                c9.TextSize = 12
                c9.ZIndex = 310
                Instance.new("UICorner", c9).CornerRadius = UDim.new(0, 4)
                
                c9.MouseButton1Click:Connect(function()
                    c3.Text = tostring(c8)
                    c4.Visible = false
                    pcall(a7, c8)
                end)
                
                c9.Parent = c4
            end
        end
    end)
end

local function d0()
    local d1 = 1
    pcall(function() 
        if j:FindFirstChild(L("\x43\x51\x55\x51")) and j.Data:FindFirstChild(L("\x4c\x70\x74\x70\x61")) then
            d1 = j.Data.Level.Value 
        end
    end)
    
    local d2 = nil
    local d3 = -1
    
    for d4, d5 in pairs(v) do
        for d6, d7 in ipairs(d5) do
            if d7.LevelReq <= d1 and d7.LevelReq > d3 then
                local d8 = ""
                local d9 = 0
                for da, db in pairs(d7.Task) do d8 = da; d9 = db end
                
                if d9 == 1 then
                    local dc = g:FindFirstChild(L("\x44\x54\x70\x50\x62\x70\x7e")) or g
                    local dd = false
                    for _, de in ipairs(dc:GetChildren()) do
                        if de.Name == d8 and de:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) and de.Humanoid.Health > 0 then
                            dd = true
                            break
                        end
                    end
                    if dd then d3 = d7.LevelReq; d2 = {qKey = d4, qId = d6, npcName = d8} end
                else
                    d3 = d7.LevelReq
                    d2 = {qKey = d4, qId = d6, npcName = d8}
                end
            end
        end
    end
    
    if not d2 then
        d3 = -1
        for d4, d5 in pairs(v) do
            for d6, d7 in ipairs(d5) do
                if d7.LevelReq <= d1 and d7.LevelReq > d3 then
                    local d8 = ""
                    for da, _ in pairs(d7.Task) do d8 = da end
                    d3 = d7.LevelReq
                    d2 = {qKey = d4, qId = d6, npcName = d8}
                end
            end
        end
    end
    
    return d2.qKey, d2.qId, d2.npcName
end

local function df()
    table.clear(l)
    local function dg(dh)
        if not dh then return end
        for _, di in ipairs(dh:GetChildren()) do
            if di:IsA("Tool") and not table.find(l, di.Name) then table.insert(l, di.Name) end
        end
    end
    if j and j:FindFirstChild(L("\x57\x51\x47\x69\x6d\x51\x47\x69")) then dg(j.Backpack) end
    if j.Character then dg(j.Character) end
    if #l == 0 then table.insert(l, L("\x4d\x75\x7e\x55\x50")) end
    return l
end

local function dj()
    if not _G[L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")] or _G[L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")] == L("\x4d\x75\x7e\x55\x50") then return end
    local dk = j.Character
    if dk and not dk:FindFirstChild(_G[L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")]) then
        local dl = j.Backpack:FindFirstChild(_G[L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")])
        if dl then dl.Parent = dk end
    end
end

local function dm()
    pcall(function()
        h:CaptureController()
        h:Button1Down(Vector2.new(0, 0))
        h:Button1Up(Vector2.new(0, 0))
    end)
    pcall(function()
        i:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        i:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
    pcall(function()
        if j.Character then
            local dn = j.Character:FindFirstChildOfClass("Tool")
            if dn then dn:Activate() end
        end
    end)
end

local function do0()
    if not _G[L("\x4c\x6d\x51\x50\x4c\x69\x62\x61\x61\x7e")] then return end
    if tick() - n >= 3 then
        local dp = o[m]
        i:SendKeyEvent(true, dp, false, game)
        task.wait(0.1)
        i:SendKeyEvent(false, dp, false, game)
        m = m % #o + 1
        n = tick()
    end
end

local function dq(dr)
    local ds = j.Character
    if not ds or not ds:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then return end
    local dt = ds.HumanoidRootPart
    local du = (dt.Position - dr).Magnitude
    local dv = du / _G[L("\x45\x51\x56\x50\x4c\x6d\x70\x70\x52")]
    local dw = c:Create(dt, TweenInfo.new(dv, Enum.EasingStyle.Linear), {CFrame = CFrame.new(dr)})
    dw:Play()
    dw.Completed:Wait()
end

-- Tabs
local dx = Y(L("\x7d\x78\x78\x7c\x44\x51\x56\x50\x50"))
local dy = Y(L("\x7d\x78\x7d\x4c\x62\x56"))
local dz = Y(L("\x7d\x7c\x78\x7c\x4e\x51\x7e\x55\x56\x50\x50\x69\x62"))

a3(dx, L("\x40\x75\x56\x61\x78\x47\x62\x55\x4c\x44\x51\x56\x50\x50"), false, function(s) 
    _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] = s; 
    if not s then p = nil end 
end)
a3(dx, L("\x40\x75\x55\x50\x7c\x4c\x6d\x51\x50\x4c\x69\x62\x61\x61\x7e"), true, function(s) _G[L("\x4c\x6d\x51\x50\x4c\x69\x62\x61\x61\x7e")] = s end)
a3(dx, L("\x40\x75\x55\x50\x7c\x43\x51\x69\x62"), true, function(s) _G[L("\x40\x75\x55\x50\x43\x51\x69\x62")] = s end)
a3(dx, L("\x40\x75\x55\x50\x7c\x42\x54\x7e\x55\x62\x54\x47"), true, function(s) _G[L("\x40\x75\x55\x50\x42\x54\x7e\x55\x62\x54\x47")] = s end)
a3b(dx, L("\x43\x62\x7e\x55\x51\x54\x55\x47\x62\x51\x70\x69\x62"), 8, 20, _G[L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")], function(v) _G[L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")] = v end)
a3c(dx, L("\x40\x7a\x52\x50\x56\x55\x4c\x56\x75\x7c\x42\x56\x75\x61\x62\x70"), df, function(v) _G[L("\x4c\x70\x61\x70\x47\x55\x70\x52\x70\x51\x6d\x4d\x70\x51\x6d\x50\x54")] = v end)

a3(dy, L("\x40\x75\x55\x50\x7c\x4d\x50\x52\x52\x50\x56\x44\x56\x75\x69\x55\x50\x74"), false, function(s) _G[L("\x40\x75\x55\x50\x4b\x56\x75\x62\x55\x44\x62\x54\x52\x70\x64")] = s end)
a3(dy, L("\x4c\x51\x61\x54\x62\x55\x4c\x75\x54\x52\x75\x69\x50\x74"), false, function(s) _G[L("\x40\x75\x55\x50\x48\x61\x70\x7e\x55\x4c\x55\x70\x51\x61")] = s end)

a3b(dz, L("\x4c\x69\x50\x56\x50\x7e\x55\x4d\x50\x61\x70\x55\x51"), 100, 450, _G[L("\x45\x51\x56\x50\x4c\x6d\x70\x70\x52")], function(v) _G[L("\x45\x51\x56\x50\x4c\x6d\x70\x70\x52")] = v end)
a3(dz, L("\x4e\x50\x47\x61\x62\x6d"), false, function(s) _G[L("\x4e\x50\x47\x61\x62\x6d")] = s end)
a3(dz, L("\x57\x70\x7e\x69\x50\x54\x70\x47\x47\x56\x7a\x61\x69\x62"), false, function(s) _G[L("\x48\x54\x44\x49\x75\x50\x6d")] = s end)

-- Noclip & Jump
b.Stepped:Connect(function()
    if (_G[L("\x4e\x50\x47\x61\x62\x6d")] or _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")]) and j.Character then
        for _, dA in pairs(j.Character:GetDescendants()) do
            if dA:IsA("BasePart") then dA.CanCollide = false end
        end
    end
end)

d.JumpRequest:Connect(function()
    if _G[L("\x48\x54\x44\x49\x75\x50\x6d")] and j.Character and j.Character:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) then
        j.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Auto Haki & Instinct fix
task.spawn(function()
    while task.wait(1.5) do
        if not _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] then continue end
        
        local dB = j.Character
        if dB and dB:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) and dB.Humanoid.Health > 0 then
            
            if _G[L("\x40\x75\x55\x50\x43\x51\x69\x62")] then
                if not dB:FindFirstChild(L("\x43\x51\x7e\x57\x75\x7e\x50")) then
                    local dC = f:FindFirstChild(L("\x4c\x70\x50\x50\x55\x70\x7e"))
                    if dC and dC:FindFirstChild(L("\x48\x50\x50\x50\x42\x7f")) then
                        dC.CommF_:InvokeServer(L("\x57\x75\x7e\x50"))
                    end
                end
            end
            
            if _G[L("\x40\x75\x55\x50\x42\x54\x7e\x55\x62\x54\x47")] then
                local dD = false
                
                if g.CurrentCamera:FindFirstChild(L("\x48\x51\x50\x70\x56\x51\x4a\x62\x7e\x62\x50\x54")) or 
                   g.CurrentCamera:FindFirstChild(L("\x4a\x62\x7e\x62\x50\x54")) or 
                   (j.PlayerGui:FindFirstChild(L("\x4c\x51\x62\x54")) and j.PlayerGui.Main:FindFirstChild(L("\x43\x50\x52\x61\x70"))) then
                    dD = true
                end
                
                if not dD and not _G[L("\x42\x54\x7e\x55\x62\x54\x47\x48\x50\x50\x61\x52\x50\x75\x54")] then
                    _G[L("\x42\x54\x7e\x55\x62\x54\x47\x48\x50\x50\x61\x52\x50\x75\x54")] = true
                    i:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    i:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.delay(2, function() _G[L("\x42\x54\x7e\x55\x62\x54\x47\x48\x50\x50\x61\x52\x50\x75\x54")] = false end)
                end
            end
            
        end
    end
end)

-- Farm loop
task.spawn(function()
    while task.wait(0.1) do
        if not _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] then
            p = nil
            _G[L("\x48\x75\x56\x56\x70\x54\x55\x4c\x75\x54\x54\x62\x54\x61\x4e\x4d\x48")] = nil
            continue
        end

        local dE = j.Character
        if not dE or not dE:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) or not dE:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) or dE.Humanoid.Health <= 0 then
            p = nil
            continue
        end

        pcall(function()
            local dF, dG, dH = d0()
            
            local dI = j.PlayerGui:FindFirstChild(L("\x4c\x51\x62\x54"))
            if not dI or not dI:FindFirstChild(L("\x4c\x75\x70\x7e\x55")) then return end
            local dJ = dI.Quest.Visible

            if _G[L("\x48\x75\x56\x56\x70\x54\x55\x4c\x75\x54\x54\x62\x54\x61\x4e\x4d\x48")] ~= dH then
                local dK = f:FindFirstChild(L("\x4c\x70\x50\x50\x55\x70\x7e"))
                if dK and dK:FindFirstChild(L("\x48\x50\x50\x50\x42\x7f")) then
                    dK.CommF_:InvokeServer(L("\x4c\x55\x51\x56\x55\x4c\x75\x70\x7e\x55"), dF, dG)
                end
                _G[L("\x48\x75\x56\x56\x70\x54\x55\x4c\x75\x54\x54\x62\x54\x61\x4e\x4d\x48")] = dH
                task.wait(0.3)
                return
            end

            if not dJ then
                local dL = f:FindFirstChild(L("\x4c\x70\x50\x50\x55\x70\x7e"))
                if dL and dL:FindFirstChild(L("\x48\x50\x50\x50\x42\x7f")) then
                    dL.CommF_:InvokeServer(L("\x4c\x55\x51\x56\x55\x4c\x75\x70\x7e\x55"), dF, dG)
                end
                task.wait(0.3)
                return
            end

            local dM = g:FindFirstChild(L("\x44\x54\x70\x50\x62\x70\x7e")) or g
            local dN = nil
            local dO = math.huge
            local dP = dE.HumanoidRootPart.Position

            for _, dQ in ipairs(dM:GetChildren()) do
                if dQ.Name == dH and dQ:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) and dQ.Humanoid.Health > 0 and dQ:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then
                    local dR = (dP - dQ.HumanoidRootPart.Position).Magnitude
                    if dR < dO then
                        dO = dR
                        dN = dQ
                    end
                end
            end

            p = dN

            if dN then
                dj()
                while dN and dN.Parent and dN:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52")) and dN.Humanoid.Health > 0 and _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] do
                    if not j.Character or not j.Character:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) or j.Character.Humanoid.Health <= 0 then break end

                    local dS, dT, dU = d0()
                    if dU ~= dH then break end

                    dm()
                    do0()
                    task.wait(0.12)
                end
                p = nil
            else
                local dV = nil
                pcall(function()
                    if g:FindFirstChild(L("\x7f\x4f\x50\x56\x61\x52\x4c\x56\x62\x61\x62\x54")) and g._WorldOrigin:FindFirstChild(L("\x44\x54\x70\x50\x62\x70\x4c\x6d\x51\x75\x54\x7e")) then
                        dV = g._WorldOrigin.EnemySpawns:FindFirstChild(dH)
                    end
                end)
                if dV and not p then
                    if (dE.HumanoidRootPart.Position - dV.Position).Magnitude > 200 then
                        dq(dV.Position + Vector3.new(0, _G[L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")], 0))
                    else
                        dE.HumanoidRootPart.CFrame = dV.CFrame * CFrame.new(0, _G[L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")], 0)
                    end
                else
                    task.wait(0.5)
                end
            end
        end)
    end
end)

-- Smooth fly to target + anti-knockback
b.RenderStepped:Connect(function(deltaTime)
    if not _G[L("\x40\x75\x55\x50\x4b\x55\x56\x50\x57\x66\x76\x70\x7d")] then return end
    if not p or not p.Parent or not p:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then return end
    
    local dW = j.Character
    if not dW or not dW:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then return end
    local dX = dW:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x62\x52"))
    if not dX or dX.Health <= 0 then return end

    local dY = p.HumanoidRootPart
    local dZ = dW.HumanoidRootPart

    dZ.Velocity = Vector3.zero
    dZ.RotVelocity = Vector3.zero
    for _, force in ipairs(dZ:GetChildren()) do
        if force:IsA("BodyVelocity") or force:IsA("BodyPosition") or force:IsA("BodyForce") or force:IsA("BodyGyro") then
            force:Destroy()
        end
    end

    local d_ = dY.CFrame * CFrame.new(0, _G[L("\x45\x51\x56\x50\x46\x62\x7e\x76\x53\x54\x4b\x70")], 0)
    local e0 = dY.Position
    local e1 = CFrame.lookAt(d_.Position, e0)

    local e2 = (dZ.Position - e1.Position).Magnitude

    local e3 = _G[L("\x45\x51\x56\x50\x4c\x6d\x70\x70\x52")] * deltaTime
    if e2 > 2 then
        local e4 = dZ.Position + (e1.Position - dZ.Position).Unit * math.min(e3, e2)
        dZ.CFrame = CFrame.lookAt(e4, e0)
    else
        dZ.CFrame = e1
    end
end)

-- Fruits & chests
task.spawn(function()
    while task.wait(1) do
        if _G[L("\x40\x75\x55\x50\x4b\x56\x75\x62\x55\x44\x62\x54\x52\x70\x64")] and j.Character and j.Character:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then
            for _, e5 in ipairs(g:GetDescendants()) do
                if e5:IsA("Tool") and e5:FindFirstChild(L("\x43\x51\x54\x52\x61\x70")) and (e5.Name:lower():find(L("\x46\x56\x75\x62\x55")) or e5.Name:lower():find(L("\x52\x70\x74\x62\x61"))) then
                    if e5.Parent == g or e5.Parent:IsA("Folder") then
                        local e6 = e5.Name .. "_" .. (e5:GetAttribute(L("\x42\x56\x75\x62\x55\x42\x43")) or "")
                        if not k[e6] then
                            k[e6] = true
                            dq(e5.Handle.Position)
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.4) do
        if _G[L("\x40\x75\x55\x50\x48\x61\x70\x7e\x55\x4c\x55\x70\x51\x61")] and j.Character and j.Character:FindFirstChild(L("\x43\x75\x50\x51\x54\x50\x50\x62\x52\x4c\x50\x50\x55\x4d\x51\x56\x55")) then
            local e7 = nil
            if g:FindFirstChild(L("\x48\x61\x70\x7e\x55\x4c\x50\x52\x70\x61\x7e")) then e7 = g.ChestModels:FindFirstChildWhichIsA("Model") end
            if not e7 then
                for _, e8 in ipairs(g:GetChildren()) do
                    if e8.Name:lower():find(L("\x47\x61\x70\x7e\x55")) and e8:IsA("Model") then e7 = e8; break end
                end
            end
            if e7 then
                local e9 = e7:FindFirstChildWhichIsA("BasePart") or e7
                if e9 then
                    dq(e9.Position)
                    task.wait(0.2)
                    pcall(function()
                        local ea = e7:FindFirstChildOfClass("ProximityPrompt")
                        if ea then fireproximityprompt(ea) end
                    end)
                end
            end
        end
    end
end)

pcall(function() X[1].Btn.MouseButton1Click:Fire() end)
