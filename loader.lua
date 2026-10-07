--[[
    PL-HUB - Loader (COM Key System)
    Ordem: Tela de Carregamento → Verificação de Key → Painel Principal
]]

local BASE = "https://raw.githubusercontent.com/guizinfdk/PL-HUBv4.5/refs/heads/main/"

-- 1. TELA DE CARREGAMENTO
local ok1, err1 = pcall(function()
    loadstring(game:HttpGet(BASE .. "carregamento.lua"))()
end)
if not ok1 then
    warn("[PL-HUB] Erro na tela de carregamento: " .. tostring(err1))
end

task.wait(2) -- ajuste se sua tela demorar mais

-- 2. VERIFICAÇÃO DE KEY
_G.PL_HUB_KEY_OK = false

local ok2, err2 = pcall(function()
    loadstring(game:HttpGet(BASE .. "keySysten.lua"))()
end)
if not ok2 then
    warn("[PL-HUB] Erro na verificação de key: " .. tostring(err2))
end

-- 3. Espera o usuário acertar a key (máx 5 min)
local t = 0
while not _G.PL_HUB_KEY_OK and t < 300 do
    task.wait(0.1)
    t += 0.1
end

if not _G.PL_HUB_KEY_OK then
    warn("[PL-HUB] Key não confirmada. Painel não será carregado.")
    return
end

-- 4. PAINEL PRINCIPAL
local ok3, err3 = pcall(function()
    loadstring(game:HttpGet(BASE .. "main.lua"))()
end)
if not ok3 then
    warn("[PL-HUB] Erro no painel principal: " .. tostring(err3))
end
