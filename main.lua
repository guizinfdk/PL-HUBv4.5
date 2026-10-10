--// PL HUB - Painel Cyberpunk Arrastável com Copiar Link
--// Coloque em StarterPlayerScripts (LocalScript) ou execute via executor

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Configuração
local DISCORD_LINK = "https://discord.gg/UFGMy5Byk"

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
mainFrame.Size = UDim2.new(0, 340, 0, 220)
mainFrame.Position = UDim2.new(0.5, -170, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 0, 200)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = mainFrame

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 0, 15)),
})
bgGradient.Rotation = 45
bgGradient.Parent = mainFrame

--// ============ BARRA SUPERIOR (DRAG) ============
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

local fixBottom = Instance.new("Frame")
fixBottom.Size = UDim2.new(1, 0, 0.5, 0)
fixBottom.Position = UDim2.new(0, 0, 0.5, 0)
fixBottom.BackgroundColor3 = Color3.fromRGB(20, 0, 35)
fixBottom.BackgroundTransparency = 0.7
fixBottom.BorderSizePixel = 0
fixBottom.ZIndex = 0
fixBottom.Parent = topBar

local neonLine = Instance.new("Frame")
neonLine.Size = UDim2.new(1, 0, 0, 1)
neonLine.Position = UDim2.new(0, 0, 1, -1)
neonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
neonLine.BorderSizePixel = 0
neonLine.ZIndex = 2
neonLine.Parent = topBar

--// ============ TÍTULO ============
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "PL HUB • SISTEMA"
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

--// ============ CONTEÚDO (TEXTO PRINCIPAL) ============
local content = Instance.new("TextLabel")
content.Name = "Content"
content.Size = UDim2.new(1, -30, 0, 110)
content.Position = UDim2.new(0, 15, 0, 42)
content.BackgroundTransparency = 1
content.Text = "ESSA VERSÃO NÃO EXISTE MAIS,\nCOMPRE A VERSÃO PLUS OU ENTRE\nNO SERVE PARA A VERSÃO FREE ILIMITADA"
content.TextColor3 = Color3.fromRGB(230, 230, 255)
content.Font = Enum.Font.Code
content.TextSize = 13
content.TextWrapped = true
content.TextYAlignment = Enum.TextYAlignment.Center
content.TextXAlignment = Enum.TextXAlignment.Center
content.RichText = true
content.ZIndex = 2
content.Parent = mainFrame

--// ============ BOTÃO "COPIAR LINK DO SERVE" ============
local copyBtn = Instance.new("TextButton")
copyBtn.Name = "CopyBtn"
copyBtn.Size = UDim2.new(1, -40, 0, 38)
copyBtn.Position = UDim2.new(0, 20, 1, -55)
copyBtn.BackgroundColor3 = Color3.fromRGB(15, 10, 30)
copyBtn.BackgroundTransparency = 0.1
copyBtn.Text = "📋  COPIAR LINK DO SERVE"
copyBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
copyBtn.Font = Enum.Font.Code
copyBtn.TextSize = 14
copyBtn.BorderSizePixel = 0
copyBtn.AutoButtonColor = false
copyBtn.ZIndex = 3
copyBtn.Parent = mainFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 5)
copyCorner.Parent = copyBtn

local copyStroke = Instance.new("UIStroke")
copyStroke.Color = Color3.fromRGB(0, 255, 255)
copyStroke.Thickness = 1.5
copyStroke.Parent = copyBtn

local copyGradient = Instance.new("UIGradient")
copyGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 200)),
})
copyGradient.Rotation = 45
copyGradient.Parent = copyStroke

--// ============ EFEITO SCANLINE ============
local scanline = Instance.new("Frame")
scanline.Name = "Scanline"
scanline.Size = UDim2.new(1, 0, 0, 2)
scanline.Position = UDim2.new(0, 0, 0, 0)
scanline.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scanline.BackgroundTransparency = 0.7
scanline.BorderSizePixel = 0
scanline.ZIndex = 10
scanline.Parent = mainFrame

task.spawn(function()
    while scanline.Parent do
        scanline.Position = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(scanline, TweenInfo.new(3, Enum.EasingStyle.Linear), {
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
        TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
            Color = Color3.fromRGB(0, 255, 255)
        }):Play()
        task.wait(1.2)
        TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
            Color = Color3.fromRGB(255, 0, 200)
        }):Play()
        task.wait(1.2)
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

--// ============ HOVER E CLIQUE DO BOTÃO FECHAR ============
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

closeBtn.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + 170,
                             mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + 110),
        BackgroundTransparency = 1
    })
    closeTween:Play()
    closeTween.Completed:Wait()
    screenGui:Destroy()
end)

--// ============ FUNÇÃO COPIAR PARA ÁREA DE TRANSFERÊNCIA ============
local function copyToClipboard(text)
    -- Tenta setclipboard (executors)
    if setclipboard then
        pcall(setclipboard, text)
        return true
    end
    -- Fallback via toclipboard
    if toclipboard then
        pcall(toclipboard, text)
        return true
    end
    -- Fallback Windows (se clipboard for acessível)
    if Clipboard and Clipboard.set then
        pcall(function() Clipboard.set(text) end)
        return true
    end
    return false
end

--// ============ HOVER E CLIQUE DO BOTÃO COPIAR ============
local originalText = "📋  COPIAR LINK DO SERVE"

copyBtn.MouseEnter:Connect(function()
    TweenService:Create(copyBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(30, 15, 50),
        BackgroundTransparency = 0
    }):Play()
    TweenService:Create(copyStroke, TweenInfo.new(0.15), {
        Thickness = 2.5
    }):Play()
end)

copyBtn.MouseLeave:Connect(function()
    TweenService:Create(copyBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(15, 10, 30),
        BackgroundTransparency = 0.1
    }):Play()
    TweenService:Create(copyStroke, TweenInfo.new(0.15), {
        Thickness = 1.5
    }):Play()
end)

copyBtn.MouseButton1Click:Connect(function()
    local success = copyToClipboard(DISCORD_LINK)
    
    if success then
        copyBtn.Text = "✔  LINK COPIADO!"
        copyBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
        TweenService:Create(copyStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(0, 255, 100)
        }):Play()
    else
        copyBtn.Text = "✖  FALHA AO COPIAR"
        copyBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
        TweenService:Create(copyStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(255, 60, 60)
        }):Play()
    end
    
    task.wait(1.8)
    
    -- Volta ao estado original
    copyBtn.Text = originalText
    copyBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
    TweenService:Create(copyStroke, TweenInfo.new(0.3), {
        Color = Color3.fromRGB(0, 255, 255)
    }):Play()
end)

--// ============ ANIMAÇÃO DE ENTRADA ============
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 340, 0, 220),
    Position = UDim2.new(0.5, -170, 0.5, -110)
}):Play()

print("[PL HUB] Painel carregado. Link: " .. DISCORD_LINK)
