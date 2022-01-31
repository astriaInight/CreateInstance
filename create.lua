local function create(className, props, children, parent)
	local thing = Instance.new(className)
	
	for pname, pvalue in pairs(props) do
		thing[pname] = pvalue
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
