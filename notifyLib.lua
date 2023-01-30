local util = {}
local objects = {}

rgb = Color3.fromRGB

local tweenService = game:GetService("TweenService")

local function randomletters(len)
	local returnedstr = ""
	for i = 1, len do
		returnedstr = returnedstr .. string.char(math.random(65,90)).. "-" .. string.char(math.random(5, 8))
	end
	return returnedstr
end

function util.new(class, properties)
	local obj = Instance.new(class)
	if properties.Parent then
		obj.Parent = properties.Parent
	end

	for i,v in next, properties do
		obj[i] = v
	end

	table.insert(objects, obj)
	return obj
end

local notifications = {}

function notifications.new(x, y, z) -- its gonna be name, text, time on screen
	local name = x.name
	local desc = x.text
	local timeonsc = x.timeOnScreen
	assert(typeof(name, desc) == "string", "title isn't a string")
	assert(typeof(timeonsc) == "number", "time on screen isn't a number")
	
	local gui = Instance.new("ScreenGui", game.CoreGui)
	
	gui.Name = randomletters(10)
	
	gui.ResetOnSpawn = false
	
	local mainframe = util.new("Frame", {
		BackgroundTransparency = 0,
		BackgroundColor3 = rgb(26, 27, 32),
		BorderSizePixel = 0,
		Name = "Frame",
		Parent = gui,
		AnchorPoint = Vector2.new(1,1),
		Position = UDim2.new(1.5, 0, 0.999, 0),
		Size = UDim2.new(0, 222, 0, 52),
		Visible = true,
		ZIndex = 1
	})
	util.new("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = mainframe
	})
	local title = util.new("TextLabel", {
		BackgroundTransparency = 1,
		Name = "title",
		Parent = mainframe,
		Position = UDim2.new(0.032, 0, 0, 0),
		Size = UDim2.new(0, 74, 0, 15),
		Visible = true,
		ZIndex = 1,
		Font = Enum.Font.GothamBlack,
		Text = tostring(name),
		TextColor3 = rgb(255, 255, 255),
		TextTransparency = 0,
		TextSize = 12,
		RichText = true,
		TextWrapped = false,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local container = util.new("Frame", {
		BackgroundTransparency = 0,
		BackgroundColor3 = rgb(26, 27, 32),
		BorderSizePixel = 1,
		Name = "Frame",
		Parent = mainframe,
		Position = UDim2.new(0.032, 0, 0.298, 0),
		Size = UDim2.new(0.93, 0, 0.63, 0),
		Visible = true,
		ZIndex = 1
	})
	util.new("UICorner", {
		CornerRadius = UDim.new(0, 2),
		Parent = container
	})
	util.new("UIStroke", {
		Color = rgb(61, 62, 64),
		Thickness = 1,
		Transparency = 0,
		Enabled = true,
		Parent = container
	})
	
	local descfr = util.new("TextLabel", {
		BackgroundTransparency = 1,
		Name = "title",
		Parent = container,
		Position = UDim2.new(0, 0, 0.183, 0),
		Size = UDim2.new(1.032, 0, 0.817, 0),
		Visible = true,
		ZIndex = 1,
		Font = Enum.Font.GothamBlack,
		Text = tostring(desc),
		TextTransparency = 0,
		TextColor3 = rgb(255, 255, 255),
		TextSize = 12,
		TextWrapped = true
	})
	task.wait(3)
	mainframe:TweenPosition(UDim2.new(1, 0, 0.999, 0), "In", "Quad", 1)
	task.wait(timeonsc)
	mainframe:TweenPosition(UDim2.new(1.5, 0, 0.999, 0), "In", "Quad", 1)
end
return notifications
