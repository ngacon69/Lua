-- Mô phỏng ModuleScript PetModule
local Pet = {}
Pet.__index = Pet

function Pet.new(name, petType)
	local self = setmetatable({}, Pet)
	self.Name = name
	self.Type = petType
	self.Position = Vector3.new(0, 0, 0)
	return self
end

function Pet:Speak()
	print(self.Name .. " says: Meow! I am a " .. self.Type)
end

function Pet:MoveTo(newPos)
	print(self.Name .. " is moving to " .. tostring(newPos))
	self.Position = newPos
end

-- Dùng Module
local myPet = Pet.new("Bé Mèo", "Cat")
myPet:Speak()
myPet:MoveTo(Vector3.new(10, 0, 20))
wait(1)
myPet:Speak()
