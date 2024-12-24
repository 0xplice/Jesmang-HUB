local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Jesmang HUB", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "Jesmang"})

--Locals
local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

--Rods
local ROTD = "Rod Of The Depths"
local TR = "Trident Rod"
local KR = "Kings Rod"

--Values
_G.autoReel = true
_G.AutoReelP = true
_G.autoCast = true
_G.autoEquip = true
_G.selectRod = "Rod Of The Depths"

--Teleport
function TPDepths()
	rootPart.CFrame = CFrame.new(962.612793, -710.921082, 1291.8678, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end

function TPAltar()
	rootPart.CFrame = CFrame.new(1298.83813, -807.237671, -307.547272, 0.0331695676, 0, 0.99944973, 0, 1, 0, -0.99944973, 0, 0.0331695676)
end

function TPMoosewood()
	rootPart.CFrame = CFrame.new(495.27597, 157.501801, 237.399933, 0.825280786, -0, -0.564722538, 0, 1, -0, 0.564722538, 0, 0.825280786)
end

function TPDeep()
	rootPart.CFrame = CFrame.new(-1660.67505, -217.181732, -2844.40723, 0.454964399, 0.000282441149, 0.890509605, -1.20638724e-05, 0.99999994, -0.000311004551, -0.890509605, 0.000130753004, 0.45496434)
end

function TPForsaken()
	rootPart.CFrame = CFrame.new(-2530.19751, 132.015152, 1558.64465, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end

function TPAncient()
	rootPart.CFrame = CFrame.new(6070.99561, 198.508392, 304.207947, 0.125102103, -0.000243675517, -0.992143869, 1.53022629e-05, 0.99999994, -0.000243675517, 0.992143869, 1.53022629e-05, 0.125102103)
end


local FarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeleTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


FarmTab:AddDropdown({
	Name = "Select Rod",
	Default = "",
	Options = {ROTD, TR, KR},
	Callback = function(Value)
		_G.selectRod = Value
	end    
})

--Functions
function autoEquip()
    while _G.autoEquip == true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.selectRod)
        }

        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.events.equip:FireServer(unpack(args))

        wait(.000000000000001)
     end
    end

function autoReel()
    while _G.autoReel == true do
        game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100,false)
        wait(.000000000000001)
     end
    end

function autoReelP()
    while _G.autoReelP == true do
        game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100,true)
        wait(.000000000000001)
     end
    end

function autoCast()
    while _G.autoCast == true do
        local args = {
    		[1] = 100,
    		[2] = 1
		}

		game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.selectRod).events.cast:FireServer(unpack(args))

        wait(.000000000000001)
     end
    end

function sell()
	workspace.world.npcs:FindFirstChild("Milo Merchant").merchant.sellall:InvokeServer()
end


--Toggles
FarmTab:AddToggle({
	Name = "Auto Equip",
	Default = false,
	Callback = function(Value)
		_G.autoEquip = Value
        autoEquip()
	end    
})
    
FarmTab:AddToggle({
	Name = "Auto Cast",
	Default = false,
	Callback = function(Value)
		_G.autoCast = Value
        autoCast()
	end    
})


FarmTab:AddToggle({
	Name = "Auto Reel",
	Default = false,
	Callback = function(Value)
		_G.autoReel = Value
        autoReel()
	end    
})

FarmTab:AddToggle({
	Name = "Auto Reel (Perfect Catch)",
	Default = false,
	Callback = function(Value)
		_G.autoReelP = Value
        autoReelP()
	end    
})

TeleTab:AddButton({
	Name = "Teleport to The Depths",
	Callback = function()
      		TPDepths()
  	end    
})

TeleTab:AddButton({
	Name = "Teleport to Keepers Altar",
	Callback = function()
      		TPAltar()
  	end    
})

TeleTab:AddButton({
	Name = "Teleport to Moosewood",
	Callback = function()
      		TPMoosewood()
  	end    
})

TeleTab:AddButton({
	Name = "Teleport to Forsaken Shores",
	Callback = function()
      		TPForsaken()
  	end    
})

TeleTab:AddButton({
	Name = "Teleport to Desolate Deep",
	Callback = function()
      		TPDeep()
  	end    
})

TeleTab:AddButton({
	Name = "Teleport to Ancient Isle",
	Callback = function()
      		TPAncient()
  	end    
})

MiscTab:AddButton({
	Name = "Auto Sell All",
	Callback = function()
      		sell()
  	end    
})

OrionLib:Init()
