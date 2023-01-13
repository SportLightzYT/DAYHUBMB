if not game:IsLoaded() then 
    repeat game.Loaded:Wait()
    until game:IsLoaded() 
end
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	repeat wait()
		if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
			if _G.Team == "Pirate" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			elseif _G.Team == "Marine" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			else
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			end
		end
	until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end
local gt = getrawmetatable(game) --antikick
local old = gt.__namecall
setreadonly(gt, false)
gt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
if method == "Kick" or method == "kick" then
    print(...)
wait(9e9)
return
end
return old(self,...)
end)
local VirtualUser = game:GetService('VirtualUser')
  spawn(function()---------- anti afk
      game:GetService("Players").LocalPlayer.Idled:connect(function()
          pcall(function()
              VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
              task.wait()
              VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
          end)
      end)
end)
  function TP(P1)
	if not _G.Stop_Tween then
		local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		Speed = 350
		if Distance < 250 then
			Speed = 5000
		elseif Distance < 500 then
			Speed = 650
		elseif Distance < 1000 then
			Speed = 350
		elseif Distance >= 1000 then
			Speed = 350
		end
		Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1})
		if _G.Stop_Tween or Auto_Raid then
			Tween:Cancel()
		elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			Tween:Play()
		end
	end
end

function TP3(P1)
local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 500 then
Speed = 500
elseif Distance < 500 then
Speed = 500
elseif Distance < 1000 then
Speed = 500
elseif Distance >= 1000 then
Speed = 500
end
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
{CFrame = P1}
):Play()
if _G.Stop_Tween then
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
	{CFrame = P1}
):Cancel()
end
end

function TP2(P1)
local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 1000 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 1000 then
Speed = 350
elseif Distance >= 1000 then
Speed = 350
end
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
{CFrame = P1}
):Play()
if _G.Stop_Tween then
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
	{CFrame = P1}
):Cancel()
end
_G.Clip = true
wait(Distance/Speed)
_G.Clip = false
end
function StopTween(target)
	if not target then
		_G.StopTween = true
		wait()
		TP2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		wait()
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
		end
		_G.StopTween = false
		_G.Clip = false
	end
end
function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
spawn(function()
    while true do wait()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
          
                if Kick.Name == 'ErrorPrompt' and Kick:FindFirstChild('MessageArea') and Kick.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    wait(50)
                end
        end)
    end
end)
task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if _G.Clip or _G.NextIsland or _G.Auto_Farm_Bone or _G.Auto_Soul_Reaper then
				if syn then
					setfflag("HumanoidParallelRemoveNoPhysics", "False")
					setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
						game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
					end
				else
					if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
							if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
								game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
							end
							local BodyVelocity = Instance.new("BodyVelocity")
							BodyVelocity.Name = "BodyVelocity1"
							BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
							BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
							BodyVelocity.Velocity = Vector3.new(0, 0, 0)
						end
					end
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false    
						end
					end
				end
			else
				if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
				end
			end
		end)
	end)
end)
Old_World = false
New_World = false
Three_World = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    Old_World = true
elseif placeId == 4442272183 then
    New_World = true
elseif placeId == 7449423635 then
    Three_World = true
end
    
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

_G.Color = Color3.fromRGB(255,0,0)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

repeat wait() until game:GetService("Players")

if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
    
wait(1)

do
    local ui = game.CoreGui:FindFirstChild("SOMEXGUI")
    if ui then
        ui:Destroy()
    end
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local library = {}

function library:AddWindow(text,keybind)
    local bind = keybind or Enum.KeyCode.RightControl
    local ff = false
    local currenttab = ""

    local DoctorShiba = Instance.new("ScreenGui")
    DoctorShiba.Name = "SOMEXGUI"
    DoctorShiba.Parent = game.CoreGui
    DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = DoctorShiba
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
    Main.BackgroundTransparency = 0.100
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
    Main.Size = UDim2.new(0, 600, 0, 350)

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(0, 600, 0, 20)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
    Page.BackgroundTransparency = 0.100
    Page.BorderSizePixel = 0
    Page.Size = UDim2.new(0, 125, 0, 350)

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Page
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
    NameHub.Size = UDim2.new(0, 110, 0, 20)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = text
    NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
    NameHub.TextSize = 11.000
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    local User = Instance.new("Frame")
    User.Name = "User"
    User.Parent = Page
    User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    User.BackgroundTransparency = 1.000
    User.Position = UDim2.new(0, 0, 0.8, 30)
    User.Size = UDim2.new(0, 125, 0, 40)

    local UserText = Instance.new("TextLabel")
    UserText.Name = "UserText"
    UserText.Parent = User
    UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserText.BackgroundTransparency = 1.000
    UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
    UserText.Size = UDim2.new(0, 80, 0, 20)
    UserText.Font = Enum.Font.Gotham
    UserText.Text = tostring(game.Players.LocalPlayer.Name) 
    spawn(function()
        while wait() do
            pcall(function()
                wait(0.1) 
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(255, 0, 0)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(255, 155, 0)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(255, 255, 0)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(0, 255, 0)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(0, 255, 255)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(0, 155, 255)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(255, 0, 255)}
                ):Play() 
                wait(.5)            
                game:GetService('TweenService'):Create(
                    UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                    {TextColor3 = Color3.fromRGB(255, 0, 155)}
                ):Play() 
                wait(.5)
            end)
        end
    end)
    UserText.TextScaled = true
    UserText.TextSize = 11.000
    UserText.TextWrapped = true
    UserText.TextXAlignment = Enum.TextXAlignment.Left

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = UserText
    UITextSizeConstraint.MaxTextSize = 11

    local UserImage = Instance.new("ImageLabel")
    UserImage.Name = "UserImage"
    UserImage.Parent = User
    UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    UserImage.Position = UDim2.new(0, 10, 0, 9)
    UserImage.Size = UDim2.new(0, 25, 0, 25)
    UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"

    local UserImageCorner = Instance.new("UICorner")
    UserImageCorner.CornerRadius = UDim.new(0, 100)
    UserImageCorner.Name = "UserImageCorner"
    UserImageCorner.Parent = UserImage

    local ScrollPage = Instance.new("ScrollingFrame")
    ScrollPage.Name = "ScrollPage"
    ScrollPage.Parent = Page
    ScrollPage.Active = true
    ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollPage.BackgroundTransparency = 1.000
    ScrollPage.BorderSizePixel = 0
    ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
    ScrollPage.Size = UDim2.new(0, 125, 0, 290)
    ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollPage.ScrollBarThickness = 0
    local PageList = Instance.new("UIListLayout")
    PageList.Name = "PageList"
    PageList.Parent = ScrollPage
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Padding = UDim.new(0, 7)

    local PagePadding = Instance.new("UIPadding")
    PagePadding.Name = "PagePadding"
    PagePadding.Parent = ScrollPage
    PagePadding.PaddingTop = UDim.new(0, 5)
    PagePadding.PaddingLeft = UDim.new(0, 28)

    local TabFolder = Instance.new("Folder")
    TabFolder.Name = "TabFolder"
    TabFolder.Parent = Main

    MakeDraggable(Top,Main)

    local uihide = false

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == bind then
            if uihide == false then
                uihide = true
                Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
            else
                uihide = false
                Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
            end
        end
    end)

    local uitab = {}

    function uitab:AddTab(text,image)
        local Image = image or 6023426915

        local PageButton = Instance.new("TextButton")
        PageButton.Name = "PageButton"
        PageButton.Parent = ScrollPage
        PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageButton.BackgroundTransparency = 1.000
        PageButton.BorderSizePixel = 0
        PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
        PageButton.Size = UDim2.new(0, 97, 0, 20)
        PageButton.AutoButtonColor = false
        PageButton.Font = Enum.Font.GothamSemibold
        PageButton.Text = text
        PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        PageButton.TextSize = 11.000
        PageButton.TextXAlignment = Enum.TextXAlignment.Left
        
        local PageImage = Instance.new("ImageLabel")
        PageImage.Name = "PageImage"
        PageImage.Parent = PageButton
        PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageImage.BackgroundTransparency = 1.000
        PageImage.Position = UDim2.new(0, -20, 0, 3)
        PageImage.Size = UDim2.new(0, 15, 0, 15)
        PageImage.Image = "rbxassetid://"..tostring(Image)

        local MainTab = Instance.new("Frame")
        MainTab.Name = "MainTab"
        MainTab.Parent = TabFolder
        MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        MainTab.BorderSizePixel = 0
        MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
        MainTab.Size = UDim2.new(0, 475, 0, 350)
        MainTab.Visible = false

        local ScrollTab = Instance.new("ScrollingFrame")
        ScrollTab.Name = "ScrollTab"
        ScrollTab.Parent = MainTab
        ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollTab.BackgroundTransparency = 1.000
        ScrollTab.BorderSizePixel = 0
        ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
        ScrollTab.Size = UDim2.new(0, 475, 0, 330)
        ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollTab.ScrollBarThickness = 3

        local TabList = Instance.new("UIListLayout")
        TabList.Name = "TabList"
        TabList.Parent = ScrollTab
        TabList.SortOrder = Enum.SortOrder.LayoutOrder
        TabList.Padding = UDim.new(0, 5)

        local TabPadding = Instance.new("UIPadding")
        TabPadding.Name = "TabPadding"
        TabPadding.Parent = ScrollTab
        TabPadding.PaddingLeft = UDim.new(0, 10)
        TabPadding.PaddingTop = UDim.new(0, 10)

        PageButton.MouseButton1Click:Connect(function()
            currenttab = MainTab.Name
            for i,v in next, TabFolder:GetChildren() do 
                if v.Name == "MainTab" then
                    v.Visible = false
                end
            end
            MainTab.Visible = true

            for i,v in next, ScrollPage:GetChildren() do 
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
            end
        end)

        if ff == false then
            TweenService:Create(
                PageButton,
                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,0,0)}
            ):Play()
            for i,v in next, TabFolder:GetChildren() do 
                if v.Name == "MainTab" then
                    v.Visible = false
                end
                MainTab.Visible = true
            end
            ff = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
            end)
        end)
        
        local main = {}
        
        function main:AddButton(text,callback)
            local Button = Instance.new("TextButton")

            Button.Name = "Button"
            Button.Parent = ScrollTab
            Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Button.BackgroundTransparency = 0.1
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 455, 0, 30)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 11.000
            Button.TextWrapped = true
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Parent = Button
            
            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                    {TextSize = 11}
                ):Play()
            end)
        end
        
        function main:AddToggle(text,config,callback)
            local ToggleImage = Instance.new("Frame")
            
            local Toggle = Instance.new("TextButton")
            Toggle.Name = "Toggle"
            Toggle.Parent = ScrollTab
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Toggle.BackgroundTransparency = 0.1
            Toggle.BorderSizePixel = 0
            Toggle.AutoButtonColor = false
            Toggle.Size = UDim2.new(0, 455, 0, 30)
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Parent = Toggle

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = Toggle
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 11.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = Toggle
            ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
            ToggleImage.Position = UDim2.new(0, 425, 0, 5)
            ToggleImage.BorderSizePixel = 0
            ToggleImage.Size = UDim2.new(0, 20, 0, 20)
            local ToggleImageCorner = Instance.new("UICorner")
            ToggleImageCorner.Name = "ToggleImageCorner"
            ToggleImageCorner.CornerRadius = UDim.new(0, 5)
            ToggleImageCorner.Parent = ToggleImage

            local ToggleImage2 = Instance.new("Frame")
            ToggleImage2.Name = "ToggleImage2"
            ToggleImage2.Parent = ToggleImage
            ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
            ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
            ToggleImage2.Visible = false

            local ToggleImage2Corner = Instance.new("UICorner")
            ToggleImage2Corner.Name = "ToggleImageCorner"
            ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
            ToggleImage2Corner.Parent = ToggleImage2
            
            Toggle.MouseEnter:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
            end)

            Toggle.MouseLeave:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            if config == nil then config = false end
            local toggled = config or false
            Toggle.MouseButton1Click:Connect(function()
                if toggled == false then
                    toggled = true
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                else
                    toggled = false
                    ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                    wait(0.1)
                    ToggleImage2.Visible = false
                end
                callback(toggled)
            end)
            
            if config == true then
                ToggleImage2.Visible = true
                ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                toggled = true
                callback(toggled)
            end
        end

        function main:AddTextbox(text,holder,disappear,callback)
            local Textboxx = Instance.new("Frame")
            local TextboxxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local Textbox = Instance.new("TextBox")
            local TextboxCorner = Instance.new("UICorner")

            Textboxx.Name = "Textboxx"
            Textboxx.Parent = ScrollTab
            Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Textboxx.Size = UDim2.new(0, 455, 0, 30)

            TextboxxCorner.CornerRadius = UDim.new(0, 5)
            TextboxxCorner.Name = "TextboxxCorner"
            TextboxxCorner.Parent = Textboxx

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textboxx
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextboxTitle.TextSize = 11.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            Textbox.Name = "Textbox"
            Textbox.Parent = Textboxx
            Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Textbox.Position = UDim2.new(0, 310, 0, 5)
            Textbox.Size = UDim2.new(0, 140, 0, 20)
            Textbox.Font = Enum.Font.Gotham
            Textbox.Text = holder
            Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
            Textbox.TextSize = 11.000

            Textbox.FocusLost:Connect(function()
                if #Textbox.Text > 0 then
                    callback(Textbox.Text)
                end
                if disappear then
                    Textbox.Text = ""
                else
                    Textbox.Text = holder
                end
            end)

            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Parent = Textbox
        end

        function main:AddDropdown(text,table,callback)
            local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropButton = Instance.new("TextButton")
            local Droptitle = Instance.new("TextLabel")
            local DropScroll = Instance.new("ScrollingFrame")
            local DropdownList = Instance.new("UIListLayout")
            local DropdownPadding = Instance.new("UIPadding")
            local DropImage = Instance.new("ImageLabel")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = ScrollTab
            Dropdown.Active = true
            Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(0, 455, 0, 30)
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Dropdown
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.BackgroundTransparency = 1.000
            DropButton.Size = UDim2.new(0, 455, 0, 30)
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropButton.TextSize = 14.000
            
            Droptitle.Name = "Droptitle"
            Droptitle.Parent = Dropdown
            Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Droptitle.BackgroundTransparency = 1.000
            Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
            Droptitle.Size = UDim2.new(0, 410, 0, 30)
            Droptitle.Font = Enum.Font.Gotham
            Droptitle.Text = text.." : "
            Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            Droptitle.TextSize = 11.000
            Droptitle.TextXAlignment = Enum.TextXAlignment.Left

            DropImage.Name = "DropImage"
            DropImage.Parent = Dropdown
            DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropImage.BackgroundTransparency = 1.000
            DropImage.Position = UDim2.new(0, 425, 0, 5)
            DropImage.Rotation = 0
            DropImage.Size = UDim2.new(0, 20, 0, 20)
            DropImage.Image = "rbxassetid://5012539403"
            
            DropScroll.Name = "DropScroll"
            DropScroll.Parent = Droptitle
            DropScroll.Active = true
            DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropScroll.BackgroundTransparency = 1.000
            DropScroll.BorderSizePixel = 0
            DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
            DropScroll.Size = UDim2.new(0, 455, 0, 70)
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
            DropScroll.ScrollBarThickness = 2
            
            DropdownList.Name = "DropdownList"
            DropdownList.Parent = DropScroll
            DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownList.Padding = UDim.new(0, 5)
            
            DropdownPadding.Name = "DropdownPadding"
            DropdownPadding.Parent = DropScroll
            DropdownPadding.PaddingTop = UDim.new(0, 5)

            local isdropping = false

            for i,v in next,table do
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 455, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(v)

                DropButton2.MouseEnter:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                DropButton2.MouseLeave:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(v)
                    callback(v)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end

            DropButton.MouseButton1Click:Connect(function()
                if isdropping == false then
                    isdropping = true
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 100)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = -180}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                else
                    isdropping = false
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end
            end)
            DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)

            local drop = {}

            function drop:Clear()
                Droptitle.Text = tostring(text).." :"
                TweenService:Create(
                    Dropdown,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 455, 0, 30)} 
                ):Play()
                isdropping = false
                for i, v in next, DropScroll:GetChildren() do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end
            function drop:Add(t)
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 455, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(t)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(t)
                    callback(t)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end
            return drop
        end

        function main:AddSlider(text,min,max,set,callback)
            set = (math.clamp(set,min,max))
            if set > max then set = max end

            local Slider = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local SliderButton = Instance.new("TextButton")
            local Bar1 = Instance.new("Frame")
            local Bar = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local CircleBar = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local UICorner_4 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = ScrollTab
            Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Slider.Size = UDim2.new(0, 455, 0, 40)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Slider

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
            SliderTitle.Size = UDim2.new(0, 290, 0, 20)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderTitle.TextSize = 11.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 40, 0, 20)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
            SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderValue.TextSize = 11.000

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = Slider
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.BackgroundTransparency = 1.000
            SliderButton.Position = UDim2.new(0, 10, 0, 25)
            SliderButton.Size = UDim2.new(0, 435, 0, 5)
            SliderButton.AutoButtonColor = false
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            Bar1.Name = "Bar1"
            Bar1.Parent = SliderButton
            Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Bar1.Size = UDim2.new(0, 435, 0, 5)

            Bar.Name = "Bar"
            Bar.Parent = Bar1
            Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
            Bar.Size = UDim2.new(set/max, 0, 0, 5)

            UICorner_2.CornerRadius = UDim.new(0, 100)
            UICorner_2.Parent = Bar

            CircleBar.Name = "CircleBar"
            CircleBar.Parent = Bar
            CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CircleBar.Position = UDim2.new(1, -2, 0, -2)
            CircleBar.AnchorPoint = Vector2.new(0, 0.1)
            CircleBar.Size = UDim2.new(0, 10, 0, 10)

            UICorner_3.CornerRadius = UDim.new(0, 100)
            UICorner_3.Parent = CircleBar

            UICorner_4.CornerRadius = UDim.new(0, 100)
            UICorner_4.Parent = Bar1
            
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")

            if Value == nil then
                Value = set
                pcall(function()
                    callback(Value)
                end)
            end
            
            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                pcall(function()
                    callback(Value)
                end)
                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                moveconnection = mouse.Move:Connect(function()
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                    SliderValue.Text = Value
                end
            end)
        end
        function main:AddSeperator(text)
            local Seperator = Instance.new("Frame")
            local Sep1 = Instance.new("Frame")
            local SepLabel = Instance.new("TextLabel")
            local Sep2 = Instance.new("Frame")

            Seperator.Name = "Seperator"
            Seperator.Parent = ScrollTab
            Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator.BackgroundTransparency = 1.000
            Seperator.ClipsDescendants = true
            Seperator.Size = UDim2.new(0, 455, 0, 20)

            Sep1.Name = "Sep1"
            Sep1.Parent = Seperator
            Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
            Sep1.BorderSizePixel = 0
            Sep1.Position = UDim2.new(0, 0, 0, 10)
            Sep1.Size = UDim2.new(0, 150, 0, 1)

            SepLabel.Name = "SepLabel"
            SepLabel.Parent = Seperator
            SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SepLabel.BackgroundTransparency = 1.000
            SepLabel.Position = UDim2.new(0, 95, 0, 0)
            SepLabel.Size = UDim2.new(0, 255, 0, 20)
            SepLabel.Font = Enum.Font.Gotham
            SepLabel.Text = text
            SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
            SepLabel.TextSize = 11.000

            Sep2.Name = "Sep2"
            Sep2.Parent = Seperator
            Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
            Sep2.BorderSizePixel = 0
            Sep2.Position = UDim2.new(0, 305, 0, 10)
            Sep2.Size = UDim2.new(0, 150, 0, 1)
        end
        function main:AddLine()
            local Line = Instance.new("Frame")
            local Linee = Instance.new("Frame")

            Line.Name = "Line"
            Line.Parent = ScrollTab
            Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Line.BackgroundTransparency = 1.000
            Line.ClipsDescendants = true
            Line.Size = UDim2.new(0, 455, 0, 20)

            Linee.Name = "Linee"
            Linee.Parent = Line
            Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
            Linee.BorderSizePixel = 0
            Linee.Position = UDim2.new(0, 0, 0, 10)
            Linee.Size = UDim2.new(0, 455, 0, 1)
        end
        function main:AddLabel(text)
            local Label = Instance.new("TextLabel")
            local PaddingLabel = Instance.new("UIPadding")
            local labell = {}
    
            Label.Name = "Label"
            Label.Parent = ScrollTab
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 455, 0, 20)
            Label.Font = Enum.Font.Gotham
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 11.000
            Label.Text = text
            Label.TextXAlignment = Enum.TextXAlignment.Left

            PaddingLabel.PaddingLeft = UDim.new(0,10)
            PaddingLabel.Parent = Label
            PaddingLabel.Name = "PaddingLabel"
    
            function labell:Set(newtext)
                Label.Text = newtext
            end

            return labell
        end
        
        return main
    end
    return uitab
end




local SOMEXHUB = library:AddWindow("Day Hub | Blox Fruit",Enum.KeyCode.RightControl)
local Main = SOMEXHUB:AddTab("Main1","6026568198")
Main:AddSeperator("Main1")
Time = Main:AddLabel("Server Time")
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
end
spawn(function()
    while task.wait() do
        pcall(function()
            UpdateTime()
        end)
    end
end)
Main:AddToggle("Auto Farm Bone",false,function(vu)
    _G.Auto_Farm_Bone = vu
    _G.FastAttack = vu
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Bone and StartMagnetBoneMon and (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonBone
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50,50,50)
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
				end
			end
		end)
	end)
end)
task.spawn(function()
	while task.wait() do
		if _G.Auto_Farm_Bone and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait()
									EquipWeapon(WeaponName)
									StartMagnetBoneMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonBone = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Bone == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
					StartMagnetBoneMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Reborn Skeleton [Lv. 1975]" then
							TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Living Zombie [Lv. 2000]" then
							TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Demonic Soul [Lv. 2025]" then
							TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Posessed Mummy [Lv. 2050]" then
						   TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-9466.72949, 171.162918, 6132.01514))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Soul Reaper",false,function(vu)
    _G.Auto_Soul_Reaper = vu
    _G.FastAttack = vu
end)
task.spawn(function()
	while task.wait() do
		if _G.Auto_Soul_Reaper then
			pcall(function()
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then                    
					TP2(CFrame.new(-8932.8203125, 146.82229614257812, 6062.56884765625))
				elseif game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
					if game.Workspace.Enemies:FindFirstChild ("Soul Reaper [Lv. 2100] [Raid Boss]") then    
						for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]"  then
								if _G.Auto_Soul_Reaper and v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat task.wait()
										EquipWeapon(WeaponName)
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until not _G.Auto_Soul_Reaper or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						end
					end
				else
					if _G.Auto_Soul_Reaper_Hop then
						Hop()
					else
						local args = {
							[1] = "Bones",
							[2] = "Buy",
							[3] = 1,
							[4] = 1
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Random Surprise",false,function(vu)
    Farm_Random_S = vu
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if Farm_Random_S then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check")
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
			end
		end)
	end
end)

Weapon = {
	"Melee",
	"Sword",
	"Devil Fruit"
}
task.spawn(function()
	while wait() do
		pcall(function()
			if SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			elseif SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			elseif SelectWeapon == "Devil Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			else
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			end
	end)
end
end)
local SelectWeapon = Main:AddDropdown("Select Weapon",Weapon,function(value)
    SelectWeapon = value
end)
Main:AddToggle("Auto Haki",true,function(vu)
    _G.Auto_Haki = vu
end)
task.spawn(function()
    while task.wait() do
		pcall(function()
			if _G.Auto_Haki then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				else
					wait()
				end
			end
		end)
    end
end)
Main:AddToggle("Bring Mob",true,function(vu)
    StartMagnet = vu
end)
task.spawn(function()
	while true do wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if StartMagnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
function GetCurrentBlade()
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then
        return
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
    return ret
end
function AttackNoCD()
    local AC = CbFw2.activeController
    for i = 1, 1 do
        local bladehit =
            require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(
                function()
                    for k, v in pairs(AC.animator.anims.basic) do
                        v:Play()
                    end
                end
            )
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                    "weaponChange",
                    tostring(GetCurrentBlade())
                )
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
            end
        end
    end
end
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
task.spawn(
    function()
        while task.wait(.1) do
            pcall(
                function()
                    if _G.FastAttack then
                        if _G.FastAttack then
                            AttackNoCD()
                        end
                    end
                end
            )
        end
    end
)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if _G.FastAttack then
                    if typeof(y) == "table" then
                        pcall(
                            function()
                                CameraShaker:Stop()
                                y.activeController.timeToNextAttack = -10
                                y.activeController.timeToNextAttack = 0
                                y.activeController.hitboxMagnitude = 100
                                y.activeController.active = false
                                y.activeController.timeToNextBlock = 0
                                y.activeController.focusStart = 0
                                y.activeController.increment = 0
                                y.activeController.blocking = false
                                y.activeController.attacking = false
                                y.activeController.humanoid.AutoRotate = true
                            end
                        )
                    end
                end
            end
        )
    end
)
spawn(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if _G.FastAttack == true then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    game.Players.LocalPlayer.Character.Busy.Value = false
                end
            end
        )
    end
)
local Raids = SOMEXHUB:AddTab("Raids","7251993295")
Raids:AddSeperator("[ Raids ]")
Dungeon = {
    "Flame",
    "Ice",
	"Quake",
	"Light",
	"Dark",
	"String",
	"Rumble",
	"Magma",
	"Human: Buddha",
	"Sand",
	"Bird: Phoenix",
	"Dough"
}
Raids:AddDropdown("Select Dungeon",Dungeon,function(value)
    _G.SelectDungeon = value
end)
Raids:AddToggle("Kill Aura",false,function(vu)
    _G.KillAura = vu
end)
task.spawn(function()
    while task.wait() do
        if _G.KillAura then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait()
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not _G.KillAura  or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)
Raids:AddToggle("Next Island",false,function(vu)
    _G.NextIsland = vu
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.NextIsland then
				if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 5" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 4" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 3" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2100 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,10,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island ") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island " and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				else
					wait()
				end
			else
				wait()
			end
		end)
	end
end)
Raids:AddToggle("Auto Awakener",false,function(vu)
    _G.Auto_Awakener = vu
end)
task.spawn(function()
    while task.wait() do
        if _G.Auto_Awakener then
            pcall(function()
                local args = {
                    [1] = "Awakener",
                    [2] = "Check"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                    [1] = "Awakener",
                    [2] = "Awaken"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
Raids:AddToggle("Auto Start Dungeon",false,function(vu)
    _G.Auto_Start_Dungeon = vu
end)
task.spawn(function()
	while task.wait(.1) do
		if _G.Auto_Start_Dungeon then
			pcall(function()
				if New_World then
					if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then 
							fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
						end
					end
				elseif Three_World then
					if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
							fireclickdetector(game.Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
						end
					end
				end
			end)
		end
	end
end)
Raids:AddToggle("Auto Buy Chips Select",false,function(vu)
_G.AutoBuyChipsSelect = vu
end)
task.spawn(function()
    while task.wait() do
        if _G.AutoBuyChipsSelect then
            pcall(function()
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = _G.SelectDungeon
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
Raids:AddButton("Buy Chip Select",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectDungeon)
end)
Raids:AddButton("Start Raid",function()
    if New_World then
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif Three_World then
        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
end)
Raids:AddSeperator("[ Shop ]")
Raids:AddButton("Buy Superhuman",function()
    local args = {
        [1] = "BuySuperhuman"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Raids:AddButton("Buy Death Step",function()
    local args = {
        [1] = "BuyDeathStep"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Raids:AddButton("Buy Shakman Karate",function()
    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BuySharkmanKarate"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Raids:AddButton("Buy Electric Claw",function()
    local args = {
        [1] = "BuyElectricClaw"
        }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Raids:AddButton("Buy Dragon Talon",function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end)
Raids:AddButton("Buy God Human",function()
            local args = {
            [1] = "BuyGodhuman"
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
