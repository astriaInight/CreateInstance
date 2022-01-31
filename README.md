# UIFramework
Luau function to create GUIs in a "tree" format.
Inspired by Roact.

# Example
```lua
--// Imports
local creator = require(script.Create)
local create = creator.create
local tree = creator.tree
local center = creator.center
local nobk = creator.nobk
local rgb = creator.rgb
local ud2 = creator.ud2

--// Vars
local pgui = game:GetService("Players").LocalPlayer.PlayerGui

--// GUI
local gui = tree(
	create("ScreenGui", {}, {
		center(
			create("Frame", {
				Size = ud2(0, 500,0, 300),
				Background = rgb(45, 45, 45),
				Round = 6,
			}, {
				create("Frame", {
					Background = rgb(56, 56, 56),
					Size = ud2(1, 0,0, 28),
					Round = 6
				}, {
					nobk(
						create("TextLabel", {
							Name = "EditMe",
							Text = "Hello there",
							Size = ud2(1,0,1,0),
							TextColor3 = rgb(255,255,255)
						})
					)
				})
			})
		)
	})
)

gui.mount(pgui)

local editMe = gui.getByName("EditMe")

while wait(.5) do
	editMe.Text = tostring(math.random(1, 1000))
end
```
