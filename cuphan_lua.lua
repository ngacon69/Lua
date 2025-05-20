-- Biến và kiểu dữ liệu
local numberVar = 10
local stringVar = "Hello Roblox"
local boolVar = true
local nilVar = nil
local tableVar = {1, 2, 3}

-- Toán tử
local a, b = 5, 2
print(a + b, a - b, a * b, a / b, a % b)
print(a == b, a ~= b, a > b, a < b)
print(true and false, true or false, not true)
print("Hello" .. " World")
print(#tableVar)

-- Điều kiện
if a > b then
    print("a lớn hơn b")
elseif a == b then
    print("a bằng b")
else
    print("a nhỏ hơn b")
end

-- Vòng lặp
for i = 1, 5 do
    print("For i:", i)
end

while a < 20 do
    a = a + 1
end

repeat
    b = b + 1
until b > 5

for k, v in pairs(tableVar) do
    print(k, v)
end

-- Hàm và closure
function add(x, y)
    return x + y
end

local function greet(name)
    print("Hi " .. name)
end

local function outer()
    local x = "outer"
    return function() print(x) end
end

-- Table nâng cao + metatable
local person = {name = "Quan", age = 12}
print(person.name)

local mt = {
    __index = function(t, key) return "default" end
}
setmetatable(person, mt)
print(person.undefinedKey)

-- Coroutine
local co = coroutine.create(function()
    print("Hello from coroutine")
end)
coroutine.resume(co)

-- Type annotation (Luau)
local score: number = 100
local function multiply(a: number, b: number): number
    return a * b
end

type PlayerData = {
    Name: string,
    Score: number
}

-- Instance & API Roblox
local part = Instance.new("Part")
part.Name = "MyPart"
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.Parent = workspace

-- Get Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Sự kiện
part.Touched:Connect(function(hit)
    print("Chạm vào:", hit.Name)
end)

-- Remote Events (Client-Server)
-- Client: RemoteEvent:FireServer(data)
-- Server:
-- RemoteEvent.OnServerEvent:Connect(function(player, data)
--     print(player.Name, data)
-- end)

-- Wait và Delay
wait(1)
task.wait(0.5)
task.delay(2, function()
    print("Sau 2 giây")
end)

-- Script & ModuleScript
-- ModuleScript:
-- local M = {}
-- function M.hello() print("Xin chào") end
-- return M

-- Script:
-- local M = require(game.ServerScriptService.MyModule)
-- M.hello()

-- UserInput & ContextAction
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        print("Space nhấn")
    end
end)

-- Tween
local info = TweenInfo.new(2, Enum.EasingStyle.Quad)
local tween = TweenService:Create(part, info, {Position = Vector3.new(0, 50, 0)})
tween:Play()

-- CollectionService
local CollectionService = game:GetService("CollectionService")
CollectionService:AddTag(part, "Important")

-- Kick, Chat, Damage
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        print(player.Name .. ": " .. msg)
    end)
    -- player:Kick("Goodbye") -- kick nếu cần
end)

-- Humanoid
local hum = workspace.NPC:FindFirstChild("Humanoid")
if hum then
    hum:TakeDamage(20)
end

-- Raycast
local origin = Vector3.new(0, 10, 0)
local direction = Vector3.new(0, -10, 0)
local rayResult = workspace:Raycast(origin, direction)
if rayResult then
    print("Đã va vào:", rayResult.Instance.Name)
end

-- DataStore
local DSS = game:GetService("DataStoreService")
local store = DSS:GetDataStore("MyStore")
-- pcall(function()
--     store:SetAsync("key", value)
--     local data = store:GetAsync("key")
-- end)

-- Các hàm nâng cao
function map(tbl, func)
    local result = {}
    for i, v in ipairs(tbl) do
        result[i] = func(v)
    end
    return result
end

-- Enum sử dụng
local state = Enum.HumanoidStateType.Running
print(state.Name)

-- Tạo nhân vật (đối với plugin/dev script)
-- local character = Players.LocalPlayer.Character
