local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
--------------------------------------------------------------------------------------------------------------------------------------------
local Window = Fluent:CreateWindow({
    --ai skid thì nhớ đổi tên =)
    --táo hub , aniee hub :>
    Title = "Came Hub",
    SubTitle = "Version 2",
    TabWidth = 190,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End -- Used when theres no MinimizeKeybind
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main Farm", Icon = "home" }),
}
local Options = Fluent.Options
do
--------------------------------------------------------------------------------------------------------------------------------------------
function AntiBan()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
     end
    end
    AntiBan()
-------------------------------------------------------------------------------------------------------------------------------------------
------// MURDER MYSTERY 2
-------// ESP
local ToggleEsp = Tabs.Main:AddToggle("ToggleEsp", {Title = "Auto ESP", Default = false })
ToggleEsp:OnChanged(function(Value)
    _G.AutoESP = Value
end)
Options.ToggleEsp:SetValue(false)
	workspace.ChildAdded:Connect(function(ch)
		if ch.Name == "Normal" and playerESP then
			fu.notification("Map has loaded, waiting for roles...")
			repeat
				task.wait(1)
			until findMurderer()
			local listplayers = game.Players:GetChildren()
			for _, player in ipairs(listplayers) do
				if  player.Character ~= nil then
					local character = player.Character
					if not character:FindFirstChild("PlayerESP") then
						local a = Instance.new("Highlight", script.Parent)
						a.Name = "PlayerESP"
						a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						a.Adornee = character
						a.FillColor = Color3.fromRGB(255, 255, 255)
						task.spawn(function()
							if player == findMurderer() then
								a.FillColor = Color3.fromRGB(255,0,0)
							elseif player == findSheriff() then
								a.FillColor = Color3.fromRGB(0, 150, 255)
							else
								a.FillColor = Color3.fromRGB(0,255,0)
							end
							if a then
								if not player then return end
								a.Adornee = player.Character or player.CharactedAdded:Wait()
							end
						end)
					end
				end
			end
			fu.notification("Player ESP reloaded.")
		end
	end)
	
	workspace.ChildRemoved:Connect(function(ch)
		if ch.Name == "Normal" and playerESP then
			fu.notification("Game ended, removing Player ESPs.")
			for _, v in ipairs(script.Parent:GetChildren()) do if v.Name == "PlayerESP" then v:Destroy() end end
		end
	end)
	
			Players = function()
				if script.Parent:FindFirstChild("PlayerESP") then
					playerESP = false
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="PlayerESP" then i:Destroy() end end
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="DGBGUIClone" then i:Destroy() end end	
				else
					playerESP = true
					local listplayers = game.Players:GetChildren()
					for _, player in ipairs(listplayers) do
						if  player.Character ~= nil then
							local character = player.Character
							if not character:FindFirstChild("PlayerESP") then
								local a = Instance.new("Highlight", script.Parent)
								a.Name = "PlayerESP"
								a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								a.Adornee = character
								a.FillColor = Color3.fromRGB(255, 255, 255)
								task.spawn(function()
									if player == findMurderer() then
										a.FillColor = Color3.fromRGB(255,0,0)
									elseif player == findSheriff() then
										a.FillColor = Color3.fromRGB(0, 150, 255)
									else
										a.FillColor = Color3.fromRGB(0,255,0)
									end
									if a then
										if not player then return end
										a.Adornee = player.Character or player.CharactedAdded:Wait()
									end
								end)
							end
						end
					end
				end
				
							Players = function()
				if script.Parent:FindFirstChild("PlayerESP") then
					playerESP = false
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="PlayerESP" then i:Destroy() end end
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="DGBGUIClone" then i:Destroy() end end	
				else
					playerESP = true
					local listplayers = game.Players:GetChildren()
					for _, player in ipairs(listplayers) do
						if  player.Character ~= nil then
							local character = player.Character
							if not character:FindFirstChild("PlayerESP") then
								local a = Instance.new("Highlight", script.Parent)
								a.Name = "PlayerESP"
								a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								a.Adornee = character
								a.FillColor = Color3.fromRGB(255, 255, 255)
								task.spawn(function()
									if player == findMurderer() then
										a.FillColor = Color3.fromRGB(255,0,0)
									elseif player == findSheriff() then
										a.FillColor = Color3.fromRGB(0, 150, 255)
									else
										a.FillColor = Color3.fromRGB(0,255,0)
									end
									if a then
										if not player then return end
										a.Adornee = player.Character or player.CharactedAdded:Wait()
									end
								end)
							end
						end
					end
				end
			end,
	
---------//Gun drop
  local ToggleGundrop = Tabs.Main:AddToggle("ToggleGundrop", {Title = "Auto Gun Drop", Default = false })
ToggleGundrop:OnChanged(function(Value)
    _G.AutoGundrop = Value
end)
Options.ToggleGundrop:SetValue(false)		
	workspace.ChildAdded:Connect(function(ch)
		if script.Parent:FindFirstChild("GunESP") and ch.Name == "GunDrop" then
			script.Parent:FindFirstChild("GunESP").Adornee = ch
			script.Parent:FindFirstChild("GunESP").Enabled = true
			local bguiclone = script.Parent.DroppedGunBGUI:Clone()
			bguiclone.Parent = script.Parent
			bguiclone.Adornee = workspace:FindFirstChild("GunDrop")
			bguiclone.Enabled = true
			bguiclone.Name = "DGBGUIClone"
			fu.notification("Gun has been dropped! Find a yellow highlight.")
		end
	end)
	
	workspace.ChildRemoved:Connect(function(ch)
		if script.Parent:FindFirstChild("GunESP") and ch.Name == "GunDrop" then
			script.Parent:FindFirstChild("GunESP").Enabled = false
			if script.Parent:FindFirstChild("DBGUIClone") then
				script.Parent:FindFirstChild("DBGUIClone"):Destroy()
			end
			fu.notification("Someone has took the dropped gun.")
		end
	end)		
	
				Dropped_Gun = function()
				if script.Parent:FindFirstChild("GunESP") then
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="GunESP" then i:Destroy() end end
					for _, i in ipairs(script.Parent:GetChildren()) do if i.Name=="DGBGUIClone" then i:Destroy() end end
				else
					local gunesp = Instance.new("Highlight", script.Parent)
					gunesp.OutlineTransparency = 1
					gunesp.FillColor = Color3.fromRGB(255, 255, 0)
					gunesp.Name = "GunESP"
					gunesp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					gunesp.Enabled = false
					if workspace:FindFirstChild("GunDrop") then
						gunesp.Adornee = workspace:FindFirstChild("GunDrop")
						gunesp.Enabled = true
						local bguiclone = script.Parent.DroppedGunBGUI:Clone()
						bguiclone.Parent = script.Parent
						bguiclone.Adornee = workspace:FindFirstChild("GunDrop")
						bguiclone.Enabled = true
						bguiclone.Name = "DGBGUIClone"
						fu.notification("Gun has been dropped! Find a yellow highlight.")
					end
	
				end
			end,
	
-------//Nhặt gun
	local ToggleTelegun = Tabs.Main:AddToggle("ToggleTelegun", {Title = "Auto Telegun", Default = false })
ToggleBone:OnChanged(function(Value)
    _G.AutoTelegun = Value
end)
Options.ToggleTelegun:SetValue(false)
	if not workspace:FindFirstChild("GunDrop") then fu.notification("No dropped gun to be teleported to.") return end
			fu.notification("Attempting a pathfind to gun..")
			
			local pathToGun = phs:CreatePath({
				AgentRadius = 3,
				AgentHeight = game.Players.LocalPlayer.Character:GetExtentsSize().Y,
				AgentCanJump = true
			})
			local completed, err = pcall(function()
				pathToGun:ComputeAsync(game.Players.LocalPlayer.Character.PrimaryPart.Position, Vector3.new(workspace:FindFirstChild("GunDrop"):GetPivot().X, workspace:FindFirstChild("GunDrop"):GetPivot().Y, workspace:FindFirstChild("GunDrop"):GetPivot().Z))
			end)
			
			if completed and pathToGun.Status == Enum.PathStatus.Success then
				fu.notification("Found a path. Moving.")
				for _, waypoint in pathToGun:GetWaypoints() do
					task.wait(0.1)
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
						CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 3, 0))	
					}):Play()
				end
			else
				fu.notification("Couldn't find a proper path to gun. Try moving a little closer to the gun.")
			end
		end,}
	}
	
	_G.Modules[3] = module
	
end


-------//shott muder
    Tabs.Main:AddButton({
        Title = "Shot muder",
        Description = "Heatshot muder",
        Callback = function()
            SHotmuder()
        end
    })

    function Shottmuder()
			--Sheriff_Aimbot = function()
			--	if sheriffAimbot then
			--		sheriffAimbot = false
			--	else
			--		sheriffAimbot = true
			--		fu.notification("This will correct your shot to shoot murderer directly.")
			--	end
			--end,
		}}
	}
	
	module[3] = {
		Type = "Text",
		Args = {"Tools"}
	}
	
	module[4] = {
		Type = "Button",
		Args = {"Shoot murderer", function(Self)
			if findSheriff() ~= game.Players.LocalPlayer then fu.notification("You're not sheriff/hero.") return end
			if not findMurderer() then
				fu.notification("No murderer to shoot.")
				return
			end
			
			if not game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
				local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Gun") then
					game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Gun"))
				else
					fu.notification("You don't have the gun..?")
					return
				end
			end
			local args = {
				[1] = 1,
				[2] = findMurderer().Character:FindFirstChild("HumanoidRootPart").Position + findMurderer().Character:FindFirstChild("Humanoid").MoveDirection * shootOffset,
				[3] = "AH"
			}
	
			game:GetService("Players").LocalPlayer.Character.Gun.KnifeServer.ShootGun:InvokeServer(unpack(args))
		end,}
	}
	
	module[5] = {
		Type = "Input",
		Args = {"Shoot position offset", "Set", function(Self, text)
			if not tonumber(text) then fu.notification("Not a valid number.") return end
			
			if tonumber(text) > 10 then
				fu.notification("An offset with a multiplier of 10 might not at all shoot the murderer!")
			end
			if tonumber(text) < 0 then
				fu.notification("An offset with a negative multiplier will make a shot BEHIND the murderer's walk direction.")
			end
			shootOffset = tonumber(text)
			fu.notification("Offset has been set.")
		end,}
	}
	
	module[6] = {
		Type = "Text",
		Args = {"The automatic murderer's shots can miss when the murderer moves. Shoot offset adjusts for the murderer's movement. Recommended is 3."}
	}
	
	module[7] = {
		Type = "ButtonGrid",
		Toggleable = true,
		Args = {1, {
					Auto_Shoot_murderer = function()
				autoShooting = not autoShooting
				if findSheriff() == game.Players.LocalPlayer and autoShooting then
					fu.notification("Auto-shooting started.")
					repeat
						task.wait(0.1)
						local murderer = findMurderer()
						if not murderer then fu.notification("No murderer.") continue end
						local murdererPosition = murderer.Character.HumanoidRootPart.Position
						local characterRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
						local rayDirection = murdererPosition - characterRootPart.Position
	
						local raycastParams = RaycastParams.new()
						raycastParams.FilterType = Enum.RaycastFilterType.Exclude
						raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
	
						local hit = workspace:Raycast(characterRootPart.Position, rayDirection, raycastParams)
						if not hit or hit.Instance.Parent == murderer.Character then -- Check if nothing collides or if it collides with the murderer
							fu.notification("Auto-shooting!")
							if not game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
								local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Gun") then
									game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Gun"))
								else
									fu.notification("You don't have the gun..?")
									return
								end
							end
							local args = {
								[1] = 1,
								[2] = findMurderer().Character:FindFirstChild("HumanoidRootPart").Position + findMurderer().Character:FindFirstChild("Humanoid").MoveDirection * shootOffset,
								[3] = "AH"
							}
	
							game:GetService("Players").LocalPlayer.Character.Gun.KnifeServer.ShootGun:InvokeServer(unpack(args))
						end
					until findSheriff() ~= game.Players.LocalPlayer or not autoShooting
				end
			end,
		}}
	}
	
	module[8] = {Type="Text", Args={""}}
	
	module[9] = {
		Type = "Text",
		Args = {"The tools below can be <font color='#FF0000'>detected,</font> both game-wise and player-wise. Use at your own risk.", "center"}
	}
	
		task.spawn(function()
		while task.wait(1) do
			if findSheriff() == game.Players.LocalPlayer and autoShooting then
				fu.notification("Auto-shooting started.")
				repeat
					task.wait(0.1)
					local murderer = findMurderer()
					if not murderer then fu.notification("No murderer.") continue end
					local murdererPosition = murderer.Character.HumanoidRootPart.Position
					local characterRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
					local rayDirection = murdererPosition - characterRootPart.Position
	
					local raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
	
					local hit = workspace:Raycast(characterRootPart.Position, rayDirection, raycastParams)
					if not hit or hit.Instance.Parent == murderer.Character then -- Check if nothing collides or if it collides with the murderer
						fu.notification("Auto-shooting!")
						if not game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
							local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Gun") then
								game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Gun"))
							else
								fu.notification("You don't have the gun..?")
								return
							end
						end
						local args = {
							[1] = 1,
							[2] = findMurderer().Character:FindFirstChild("HumanoidRootPart").Position + findMurderer().Character:FindFirstChild("Humanoid").MoveDirection * shootOffset,
							[3] = "AH"
						}
	
						game:GetService("Players").LocalPlayer.Character.Gun.KnifeServer.ShootGun:InvokeServer(unpack(args))
					end
				until findSheriff() ~= game.Players.LocalPlayer or not autoShooting
			end
		end
	end)
	
	
	
	
	
--------------------------------------------------------------------------------------------------------------------------------------------
---Close UI
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=16601446273"
ImageButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.End,false,game)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
--Remove Effect
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
--------------------------------------------------------------------------------------------------------------------------------------------
-- Hehe
--------------------------------------------------------------------------------------------------------------------------------------------