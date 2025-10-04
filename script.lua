-- FroggiHub Style Fly GUI
local FroggiHubFly = {}

-- Анимация загрузки в стиле FroggiHub
local function LoadingAnimation()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FroggiHubFlyLoading"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game.CoreGui

    -- Фон с размытием
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.7
    background.BorderSizePixel = 0
    background.Parent = screenGui

    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 10
    blurEffect.Parent = screenGui

    -- Основной контейнер
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 300, 0, 150)
    container.Position = UDim2.new(0.5, -150, 0.5, -75)
    container.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    container.BackgroundTransparency = 0.2
    container.BorderSizePixel = 0
    container.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0, 0.4, 0.8)
    stroke.Thickness = 2
    stroke.Parent = container

    -- Анимированный заголовок
    local titleText = "FroggiHub"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Position = UDim2.new(0, 0, 0.3, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = ""
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextStrokeTransparency = 0.5
    titleLabel.TextStrokeColor3 = Color3.new(0, 0.3, 0.6)
    titleLabel.Parent = container

    -- Подзаголовок
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 20)
    subtitle.Position = UDim2.new(0, 0, 0.6, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Fly all Places"
    subtitle.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    subtitle.TextSize = 12
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextTransparency = 1
    subtitle.Parent = container

    -- Анимация появления букв
    spawn(function()
        for i = 1, #titleText do
            titleLabel.Text = string.sub(titleText, 1, i)
            wait(0.08)
        end
        
        -- Появление подзаголовка
        for i = 0, 1, 0.1 do
            subtitle.TextTransparency = 1 - i
            wait(0.02)
        end
        
        wait(0.5)
        
        -- Исчезновение
        for i = 0, 1, 0.05 do
            container.BackgroundTransparency = 0.2 + i * 0.8
            titleLabel.TextTransparency = i
            subtitle.TextTransparency = i
            stroke.Transparency = i
            wait(0.02)
        end
        
        screenGui:Destroy()
    end)

    return screenGui
end

-- Запуск анимации
spawn(LoadingAnimation)
wait(1.5)

-- Основной GUI в стиле FroggiHub
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "FroggiHubFly"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

-- Стиль FroggiHub
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.1, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.BackgroundTransparency = 0.1

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = Frame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(60, 60, 60)
FrameStroke.Thickness = 2
FrameStroke.Parent = Frame

-- Функция для создания стилизованных кнопок
local function CreateStyledButton(name, position, size, color)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.BackgroundColor3 = color
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = size
    button.Font = Enum.Font.Gotham
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 12
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(80, 80, 80)
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    
    return button
end

-- Функция для создания стилизованных лейблов
local function CreateStyledLabel(name, position, size, color)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = Frame
    label.BackgroundColor3 = color
    label.BorderSizePixel = 0
    label.Position = position
    label.Size = size
    label.Font = Enum.Font.Gotham
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 11
    label.TextScaled = true
    
    local labelCorner = Instance.new("UICorner")
    labelCorner.CornerRadius = UDim.new(0, 4)
    labelCorner.Parent = label
    
    return label
end

-- Создание элементов в стиле FroggiHub
up = CreateStyledButton("UP", UDim2.new(0.05, 0, 0.25, 0), UDim2.new(0.4, 0, 0.2, 0), Color3.fromRGB(0, 100, 200))
down = CreateStyledButton("DOWN", UDim2.new(0.05, 0, 0.5, 0), UDim2.new(0.4, 0, 0.2, 0), Color3.fromRGB(200, 100, 0))
onof = CreateStyledButton("FLY", UDim2.new(0.55, 0, 0.75, 0), UDim2.new(0.4, 0, 0.2, 0), Color3.fromRGB(0, 150, 0))

TextLabel = CreateStyledLabel("Fly GUI V1", UDim2.new(0.05, 0, 0.05, 0), UDim2.new(0.9, 0, 0.15, 0), Color3.fromRGB(40, 40, 40))
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 14

plus = CreateStyledButton("+", UDim2.new(0.55, 0, 0.25, 0), UDim2.new(0.18, 0, 0.2, 0), Color3.fromRGB(60, 60, 180))
speed = CreateStyledLabel("1", UDim2.new(0.75, 0, 0.25, 0), UDim2.new(0.2, 0, 0.2, 0), Color3.fromRGB(80, 80, 80))
mine = CreateStyledButton("-", UDim2.new(0.55, 0, 0.5, 0), UDim2.new(0.18, 0, 0.2, 0), Color3.fromRGB(180, 60, 60))

-- Кнопки управления окном
closebutton = CreateStyledButton("X", UDim2.new(0.85, 0, 0.05, 0), UDim2.new(0.1, 0, 0.15, 0), Color3.fromRGB(200, 50, 50))
mini = CreateStyledButton("_", UDim2.new(0.73, 0, 0.05, 0), UDim2.new(0.1, 0, 0.15, 0), Color3.fromRGB(100, 100, 100))
mini2 = CreateStyledButton("+", UDim2.new(0.73, 0, 0.05, 0), UDim2.new(0.1, 0, 0.15, 0), Color3.fromRGB(100, 100, 100))
mini2.Visible = false

-- Переменные
speeds = 1
local speaker = game:GetService("Players").LocalPlayer
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
nowe = false

-- Уведомление в стиле FroggiHub
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "FroggiHub - Fly GUI V1",
    Text = "Fly all Places | By FroggiTeam",
    Duration = 5
})

-- Функциональность (остаётся без изменений)
Frame.Active = true
Frame.Draggable = true

onof.MouseButton1Down:connect(function()
    if nowe == true then
        nowe = false
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
        nowe = true
        for i = 1, speeds do
            spawn(function()
                local hb = game:GetService("RunService").Heartbeat    
                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        local Char = game.Players.LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end

    -- R6 и R15 логика (остаётся без изменений)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService("RunService").RenderStepped:Wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    else
        -- R15 логика (остаётся без изменений)
        local plr = game.Players.LocalPlayer
        local UpperTorso = plr.Character.UpperTorso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

-- Остальная функциональность (без изменений)
local tis
up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
        while tis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
        end
    end)
end)

up.MouseLeave:connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis
down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
        while dis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
        end
    end)
end)

down.MouseLeave:connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false
end)

plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if nowe == true then
        tpwalking = false
        for i = 1, speeds do
            spawn(function()
                local hb = game:GetService("RunService").Heartbeat    
                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end)

mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = 'Min: 1'
        wait(1)
        speed.Text = speeds
    else
        speeds = speeds - 1
        speed.Text = speeds
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local hb = game:GetService("RunService").Heartbeat    
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end
end)

closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- ИСПРАВЛЕННАЯ ФУНКЦИЯ СВОРАЧИВАНИЯ
mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    TextLabel.Visible = false
    mini2.Visible = true
    
    -- Полностью скрываем фрейм при сворачивании
    Frame.Size = UDim2.new(0, 60, 0, 30)
    Frame.Position = UDim2.new(Frame.Position.X.Scale, Frame.Position.X.Offset, Frame.Position.Y.Scale, Frame.Position.Y.Offset)
end)

mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    TextLabel.Visible = true
    mini2.Visible = false
    
    -- Восстанавливаем размер фрейма
    Frame.Size = UDim2.new(0, 200, 0, 120)
    Frame.Position = UDim2.new(Frame.Position.X.Scale, Frame.Position.X.Offset, Frame.Position.Y.Scale, Frame.Position.Y.Offset)
end)

print("FroggiHub - Fly GUI V1 loaded successfully!")
