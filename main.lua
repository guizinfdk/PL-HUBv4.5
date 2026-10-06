--// PL HUB DESATUALIZADO - Painel Cyberpunk Arrastável
--// Coloque em StarterPlayerScripts (LocalScript) ou execute via executor

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Remove painel antigo se existir
local oldPanel = playerGui:FindFirstChild("PLHubPanel")
if oldPanel then oldPanel:Destroy() end

--// ============ GUI PRINCIPAL ============
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PLHubPanel"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

--// ============ FRAME DO PAINEL ============
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 140)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -70)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = false -- Vamos usar drag customizado
mainFrame.Parent = screenGui

--// Cantos arredondados
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = mainFrame

--// Borda neon (UIStroke)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 0, 200)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = mainFrame

--// Gradiente de fundo
local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 0, 15)),
})
bgGradient.Rotation = 45
bgGradient.Parent = mainFrame

--// ============ BARRA SUPERIOR (DRAG AREA) ============
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 32)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(255, 0, 200)
topBar.BackgroundTransparency = 0.7
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 6)
topCorner.Parent = topBar

--// Corrige cantos inferiores da topBar
local fixBottom = Instance.new("Frame")
fixBottom.Size = UDim2.new(1, 0, 0.5, 0)
fixBottom.Position = UDim2.new(0, 0, 0.5, 0)
fixBottom.BackgroundColor3 = Color3.fromRGB(20, 0, 35)
fixBottom.BackgroundTransparency = 0.7
fixBottom.BorderSizePixel = 0
fixBottom.ZIndex = 0
fixBottom.Parent = topBar

--// Linha neon inferior da topBar
local neonLine = Instance.new("Frame")
neonLine.Size = UDim2.new(1, 0, 0, 1)
neonLine.Position = UDim2.new(0, 0, 1, -1)
neonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
neonLine.BorderSizePixel = 0
neonLine.ZIndex = 2
neonLine.Parent = topBar

--// ============ TÍTULO ============
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "PL HUB DESATUALIZADO"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.fromRGB(255, 0, 200)
title.Font = Enum.Font.Code
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3
title.Parent = topBar

--// ============ BOTÃO DE FECHAR ============
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 60)
closeBtn.BackgroundTransparency = 0.2
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 16
closeBtn.TextScaled = false
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 4
closeBtn.AutoButtonColor = false
closeBtn.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeBtn

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(255, 0, 60)
closeStroke.Thickness = 1.5
closeStroke.Parent = closeBtn

--// ============ CONTEÚDO CENTRAL ============
local content = Instance.new("TextLabel")
content.Name = "Content"
content.Size = UDim2.new(1, -30, 1, -50)
content.Position = UDim2.new(0, 15, 0, 40)
content.BackgroundTransparency = 1
content.Text = "⚠  ESTE HUB NÃO ESTÁ MAIS ATIVO\n\nAGUARDE UMA NOVA VERSÃO\nOU CONTACTE O DESENVOLVEDOR."
content.TextColor3 = Color3.fromRGB(230, 230, 255)
content.Font = Enum.Font.Code
content.TextSize = 13
content.TextWrapped = true
content.TextYAlignment = Enum.TextYAlignment.Center
content.TextXAlignment = Enum.TextXAlignment.Center
content.ZIndex = 2
content.Parent = mainFrame

--// ============ EFEITO DE SCANLINE (opcional) ============
local scanline = Instance.new("Frame")
scanline.Name = "Scanline"
scanline.Size = UDim2.new(1, 0, 0, 2)
scanline.Position = UDim2.new(0, 0, 0, 0)
scanline.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scanline.BackgroundTransparency = 0.7
scanline.BorderSizePixel = 0
scanline.ZIndex = 10
scanline.Parent = mainFrame

-- Animação da scanline
task.spawn(function()
    while scanline.Parent do
        scanline.Position = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(scanline, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {
            Position = UDim2.new(0, 0, 1, 0)
        })
        tween:Play()
        tween.Completed:Wait()
        task.wait(0.3)
    end
end)

--// ============ PULSO NEON NA BORDA ============
task.spawn(function()
    while mainFrame.Parent do
        local tween1 = TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
            Color = Color3.fromRGB(0, 255, 255)
        })
        tween1:Play()
        tween1.Completed:Wait()
        local tween2 = TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
            Color = Color3.fromRGB(255, 0, 200)
        })
        tween2:Play()
        tween2.Completed:Wait()
    end
end)

--// ============ DRAG CUSTOMIZADO ============
local dragging = false
local dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement 
    or input.UserInputType == Enum.UserInputType.Touch) then
        updateDrag(input)
    end
end)

--// ============ HOVER DO BOTÃO DE FECHAR ============
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 26, 0, 26),
        Position = UDim2.new(1, -31, 0.5, -13)
    }):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {
        BackgroundTransparency = 0.2,
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(1, -30, 0.5, -12)
    }):Play()
end)

--// ============ FECHAR PAINEL ============
closeBtn.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + 160,
                             mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + 70),
        BackgroundTransparency = 1
    })
    closeTween:Play()
    closeTween.Completed:Wait()
    screenGui:Destroy()
end)

--// ============ ANIMAÇÃO DE ENTRADA ============
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 140),
    Position = UDim2.new(0.5, -160, 0.5, -70)
}):Play()

print("[PL HUB] Painel carregado com sucesso.")
