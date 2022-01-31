# UIFramework
Luau function to create GUIs in a "tree" format.
Inspired by Roact.

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
