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

function TPDepths()
	rootPart.CFrame = CFrame.new(962.612793, -710.921082, 1291.8678, -1, 0, 0, 0, 1, 0, 0, 0, -1)
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

OrionLib:Init()
