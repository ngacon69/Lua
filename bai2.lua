-- Gắn đoạn này vào một LocalScript bên trong ScreenGui

-- Tạo GUI qua script (tự động sinh ra Frame, Button, Label, TextBox)
local players = game:GetService("Players")
local player = players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "MyGui"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0.4, 0, 0.4, 0)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Name = "MainFrame"

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0.2, 0)
button.Position = UDim2.new(0.1, 0, 0.1, 0)
button.Text = "Đổi màu + thông báo"
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button.TextScaled = true

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(0.8, 0, 0.2, 0)
label.Position = UDim2.new(0.1, 0, 0.4, 0)
label.Text = "Chào mừng đến với game!"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextScaled = true

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(0.8, 0, 0.2, 0)
textbox.Position = UDim2.new(0.1, 0, 0.7, 0)
textbox.PlaceholderText = "Nhập tên tại đây"
textbox.Text = ""
textbox.TextScaled = true
textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbox.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Sự kiện nhấn nút
button.MouseButton1Click:Connect(function()
	frame.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
	label.Text = "Bạn vừa nhấn nút!"
end)

-- Sự kiện nhập tên vào TextBox
textbox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local name = textbox.Text
		if name ~= "" then
			label.Text = "Hello, " .. name .. "!"
		else
			label.Text = "Vui lòng nhập tên!"
		end
	end
end)
