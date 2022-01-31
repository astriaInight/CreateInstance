local creator = {}

--// Random vars
local white = Color3.fromRGB(255, 255, 255)
local black = Color3.fromRGB(0, 0, 0)

--// Module values
creator.rgb = Color3.fromRGB
creator.ud2 = UDim2.new

--// Funcs
local function objByName(objects, objName)
	for _, obj in pairs(objects:GetDescendants()) do
		if obj.Name == objName then
			return obj
		end
	end
	return error("Can't find object with name '"..objName.."'")
end

--// Property handling
local customProperties = {
	Round = function(self, roundness)
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, roundness)
		corner.Parent = self
	end,
	Background = function(self, color)
		self.BackgroundColor3 = color
	end,
	Gradient = function(self, gradient)
		local grad = Instance.new("UIGradient")
		grad.Color = gradient.Color or ColorSequence.new(white)
		grad.Transparency = gradient.Transparency or NumberSequence.new(0)
		grad.Parent = self
	end,
}

function creator.create(className, props, children, parent)
	local thing = Instance.new(className)

	for pname, pvalue in pairs(props) do
		--// Property handling
		if customProperties[pname] then
			customProperties[pname](thing, pvalue)
		else
			thing[pname] = pvalue
		end
	end

	if parent then
		thing.Parent = parent
	end

	if children then
		for _, child in pairs(children) do
			child.Parent = thing
		end
	end

	return thing
end

function creator.tree(objects)
	local tree = {}
	
	function tree.getByName(objName)
		return objByName(objects, objName)
	end
	
	function tree.mount(treeParent)
		objects.Parent = treeParent
	end
	
	return tree
end

--// Alignment & sizing functions
function creator.center(obj)
	obj.AnchorPoint = Vector2.new(0.5,0.5)
	obj.Position = UDim2.new(0.5,0,0.5,0)
	return obj
end

function creator.fill(obj)
	obj.Size = UDim2.new(1,0,1,0)
	return obj
end

function creator.rows(amount, obj)
	local layout = Instance.new("UIListLayout")
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	
end

--// Styling functions
function creator.nobk(obj)
	obj.BackgroundTransparency = 1
	return obj
end

return creator
