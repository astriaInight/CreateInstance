# CreateInstance
Luau function to create instances in a "tree" format.

# Example
```lua
local pgui = game:GetService("Players").LocalPlayer.PlayerGui

local tree = create("ScreenGui", {}, {
	create("TextLabel", {
		Text = "yes",
		AutomaticSize = Enum.AutomaticSize.XY
	})
})

tree.Parent = pgui
```
