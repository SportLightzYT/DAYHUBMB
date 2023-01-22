do
    local gui = game:GetService("CoreGui"):FindFirstChild("HovxrzGui")
    if gui then
        gui:Destroy()
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

function library:CreateWindow(text,maincolor,text2,logo)
    logo = logo or 0
    maincolor = maincolor or Color3.fromRGB(63,233,233)
    local isselected = false

    local HovxrzGui = Instance.new("ScreenGui")
    HovxrzGui.Name = "HovxrzGui"
    HovxrzGui.Parent = game:GetService("CoreGui")
    HovxrzGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = HovxrzGui
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
    Main.Position = UDim2.new(0.5, 0,0.499, 0)
    -- Main.Size = UDim2.new(0, 375, 0, 460)
    Main.AnchorPoint = Vector2.new(0.5,0.5)

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.BorderSizePixel = 0
    -- Top.Size = UDim2.new(0, 375, 0, 20)
    Top.ClipsDescendants = true
    
    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 25, 0, 0)
    NameHub.Size = UDim2.new(0, 50, 0, 20)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 15.000
    
    local Hub = Instance.new("TextLabel")
    Hub.Name = "Hub"
    Hub.Parent = Top
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0, 75, 0, 0)
    Hub.Size = UDim2.new(0, 60, 0, 20)
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "HUB"
    Hub.TextColor3 = maincolor
    Hub.TextSize = 15.000
    Hub.TextXAlignment = Enum.TextXAlignment.Left
    
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = Top
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0, 5, 0, 0)
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Image = "rbxassetid://"..tostring(logo)

    local Barrier = Instance.new("Frame")
    Barrier.Name = "Barrier"
    Barrier.Parent = Top
    Barrier.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    Barrier.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Barrier.BorderSizePixel = 0
    Barrier.Position = UDim2.new(0, 115, 0, 3)
    Barrier.Size = UDim2.new(0, 2, 0, 14)

    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Top
    Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description.BackgroundTransparency = 1.000
    Description.Position = UDim2.new(0, 125, 0, 0)
    Description.Size = UDim2.new(0, 250, 0, 20)
    Description.Font = Enum.Font.GothamSemibold
    Description.Text = text2
    Description.TextColor3 = Color3.fromRGB(225, 225, 225)
    Description.TextSize = 15.000
    Description.TextXAlignment = Enum.TextXAlignment.Left

    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.BorderSizePixel = 0
    Tab.Position = UDim2.new(0, 5, 0, 25)
    Tab.Size = UDim2.new(0, 365, 0, 25)

    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 365, 0, 25)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = ScrollTab
    TabListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.BorderSizePixel = 0
    Page.Position = UDim2.new(0.0133333337, 0, 0.130434781, 0)
    Page.Size = UDim2.new(0, 365, 0, 395)

    local pagesFolder = Instance.new("Folder")
    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = Page

    MakeDraggable(Top,Main)
    
    Main.BackgroundTransparency = 1
    Tab.Visible = false
    Page.Visible = false
    Main.Size = UDim2.new(0,375,0,0)
    Top.Size = UDim2.new(0,0,0,20)
    TweenService:Create(
        Top,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 20)}
    ):Play()
    repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
    Main.BackgroundTransparency = 0
    TweenService:Create(
        Main,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 460)}
    ):Play()
    repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
    Tab.Visible = true
    Page.Visible = true

    local uihide = false
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")

    ScreenGui.Parent = game.CoreGui

    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.BorderSizePixel = 0
    ImageButton.Image = "rbxassetid://12211497574" -- LOGO
    ImageButton.MouseButton1Down:connect(function()
        if uihide == false then
            uihide = true
            Tab.Visible = false
            Page.Visible = false
            TweenService:Create(
                Main,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0,375,0,0)}
            ):Play()
            repeat wait() until Main.Size == UDim2.new(0,375,0,0)
            Main.BackgroundTransparency = 1
            TweenService:Create(
                Top,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0,0,0,20)}
            ):Play()
        else
            uihide = false
            TweenService:Create(
                Top,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 375, 0, 20)}
            ):Play()
            repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
            Main.BackgroundTransparency = 0
            TweenService:Create(
                Main,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 375, 0, 460)}
            ):Play()
            repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
            Tab.Visible = true
            Page.Visible = true
        end
    end)

    local uitab = {}
    function uitab:AddTab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 80, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = text
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 14.000
        TabButton.TextTransparency = 0.5

        local MainPage = Instance.new("Frame")
        MainPage.Name = "MainPage"
        MainPage.Parent = pagesFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Size = UDim2.new(0, 365, 0, 395)
        MainPage.Visible = false

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = "MainFramePage"
        MainFramePage.Parent = MainPage
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 365, 0, 395)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.Name = "PageListLayout"
        PageListLayout.Padding = UDim.new(0, 15)
        PageListLayout.Parent = MainFramePage
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = MainFramePage
        PagePadding.PaddingLeft = UDim.new(0,15)
        PagePadding.PaddingTop = UDim.new(0,15)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
        end)

        if isselected == false then
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            isselected = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            ScrollTab.CanvasSize = UDim2.new(0, TabListLayout.AbsoluteContentSize.X + 10, 0, 0)
            MainFramePage.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 30)
        end)

        local main = {}
        function main:AddButton(text,callback)
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = MainFramePage
            ButtonFrame.BackgroundColor3 = maincolor
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Size = UDim2.new(0, 335, 0, 30)
            
            local UICorner = Instance.new("UICorner")
            UICorner.Parent = ButtonFrame
            UICorner.CornerRadius = UDim.new(0,5)
            
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = ButtonFrame
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 1, 0, 1)
            Button.Size = UDim2.new(0, 333, 0, 28)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 14.000

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.Parent = Button
            UICorner_2.CornerRadius = UDim.new(0,5)
            
            local Black = Instance.new("Frame")
            Black.Name = "Black"
            Black.Parent = Button
            Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Black.BackgroundTransparency = 1.000
            Black.Size = UDim2.new(0, 335, 0, 28)

            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = maincolor}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end)

            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end)

            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
				TweenService:Create(
					Button,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextSize = 14}
				):Play()
            end)
        end

        function main:AddToggle(text,config,callback)
            config = config or false
            local istoggled = config

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = MainFramePage
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleFrame.BackgroundTransparency = 1.000
            ToggleFrame.Size = UDim2.new(0, 335, 0, 25)

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 1.000
            ToggleButton.Size = UDim2.new(0, 335, 0, 25)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0.0447761193, 0, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 276, 0, 25)
            ToggleLabel.Font = Enum.Font.GothamSemibold
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 15.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local ToggleImage = Instance.new("Frame")
            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = ToggleFrame
            ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            ToggleImage.Position = UDim2.new(0, 290, 0, 1)
            ToggleImage.Size = UDim2.new(0, 46, 0, 21)

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 10)
            UICorner.Parent = ToggleImage

            local Circle = Instance.new("Frame")
            Circle.Name = "Circle"
            Circle.Parent = ToggleImage
            Circle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
            Circle.Position = UDim2.new(0, 2, 0, 1)
            Circle.Size = UDim2.new(0, 19, 0, 19)

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.CornerRadius = UDim.new(0, 10)
            UICorner_2.Parent = Circle

            ToggleButton.MouseButton1Click:Connect(function()
                if istoggled == false then
                    istoggled = true
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 24, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = maincolor}
                    ):Play()
                else
                    istoggled = false
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 2, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(233, 63, 63)}
                    ):Play()
                end
                pcall(callback,istoggled)
            end)

            if config == true then
                if istoggled == false then
                    istoggled = true
                end
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 24, 0, 1)}
                ):Play()
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundColor3 = maincolor}
                ):Play()
                pcall(callback,istoggled)
            end
		end

        function main:AddDropdown(text,option,callback)
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 335, 0, 30)
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown
			
			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 335, 0, 30)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000
            DropTitle.TextXAlignment = Enum.TextXAlignment.Left

            local UIPaddingHAHA = Instance.new("UIPadding")
            UIPaddingHAHA.Parent = DropTitle
            UIPaddingHAHA.Name = "UIPaddingHAHA"
            UIPaddingHAHA.PaddingLeft = UDim.new(0,15)
			
			DropScroll.Name = "DropScroll"
			DropScroll.Parent = Dropdown
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 335, 0, 70)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropScroll.ScrollBarThickness = 3
			
			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)
			
			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 305, 0, 5)
			DropImage.Rotation = 180.000
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://12211497574"
			
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 335, 0, 30)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0,335,0,100),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end
			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end
        function main:AddSlider(text,min,max,set,callback)
			local Slider = Instance.new("Frame")
			local slidercorner = Instance.new("UICorner")
			local sliderr = Instance.new("Frame")
			local sliderrcorner = Instance.new("UICorner")
			local SliderLabel = Instance.new("TextLabel")
			local HAHA = Instance.new("Frame")
			local AHEHE = Instance.new("TextButton")
			local bar = Instance.new("Frame")
			local bar1 = Instance.new("Frame")
			local bar1corner = Instance.new("UICorner")
			local barcorner = Instance.new("UICorner")
			local circlebar = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local slidervalue = Instance.new("Frame")
			local valuecorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = MainFramePage
			Slider.BackgroundColor3 = maincolor
			Slider.BackgroundTransparency = 0
			Slider.Size = UDim2.new(0, 335, 0, 51)

			slidercorner.CornerRadius = UDim.new(0, 5)
			slidercorner.Name = "slidercorner"
			slidercorner.Parent = Slider

			sliderr.Name = "sliderr"
			sliderr.Parent = Slider
			sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			sliderr.Position = UDim2.new(0, 1, 0, 1)
			sliderr.Size = UDim2.new(0, 333, 0, 49)

			sliderrcorner.CornerRadius = UDim.new(0, 5)
			sliderrcorner.Name = "sliderrcorner"
			sliderrcorner.Parent = sliderr

			SliderLabel.Name = "SliderLabel"
			SliderLabel.Parent = sliderr
			SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderLabel.BackgroundTransparency = 1.000
			SliderLabel.Position = UDim2.new(0, 15, 0, 0)
			SliderLabel.Size = UDim2.new(0, 180, 0, 26)
			SliderLabel.Font = Enum.Font.GothamSemibold
			SliderLabel.Text = text
			SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			SliderLabel.TextSize = 16.000
			SliderLabel.TextTransparency = 0
			SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

			HAHA.Name = "HAHA"
			HAHA.Parent = sliderr
			HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HAHA.BackgroundTransparency = 1.000
			HAHA.Size = UDim2.new(0, 333, 0, 29)

			AHEHE.Name = "AHEHE"
			AHEHE.Parent = sliderr
			AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AHEHE.BackgroundTransparency = 1.000
			AHEHE.Position = UDim2.new(0, 10, 0, 35)
			AHEHE.Size = UDim2.new(0, 313, 0, 5)
			AHEHE.Font = Enum.Font.SourceSans
			AHEHE.Text = ""
			AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
			AHEHE.TextSize = 14.000

			bar.Name = "bar"
			bar.Parent = AHEHE
			bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			bar.Size = UDim2.new(0, 313, 0, 5)

			bar1.Name = "bar1"
			bar1.Parent = bar
			bar1.BackgroundColor3 = maincolor
			bar1.BackgroundTransparency = 0
			bar1.Size = UDim2.new(set/max, 0, 0, 5)

			bar1corner.CornerRadius = UDim.new(0, 5)
			bar1corner.Name = "bar1corner"
			bar1corner.Parent = bar1

			barcorner.CornerRadius = UDim.new(0, 5)
			barcorner.Name = "barcorner"
			barcorner.Parent = bar

			circlebar.Name = "circlebar"
			circlebar.Parent = bar1
			circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			circlebar.Position = UDim2.new(1, -2, 0, -3)
			circlebar.Size = UDim2.new(0, 10, 0, 10)

			UICorner.CornerRadius = UDim.new(0, 100)
			UICorner.Parent = circlebar

			slidervalue.Name = "slidervalue"
			slidervalue.Parent = sliderr
			slidervalue.BackgroundColor3 = maincolor
			slidervalue.BackgroundTransparency = 0
			slidervalue.Position = UDim2.new(0, 265, 0, 5)
			slidervalue.Size = UDim2.new(0, 65, 0, 18)

			valuecorner.CornerRadius = UDim.new(0, 5)
			valuecorner.Name = "valuecorner"
			valuecorner.Parent = slidervalue

			TextBox.Parent = slidervalue
			TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextBox.Position = UDim2.new(0, 1, 0, 1)
			TextBox.Size = UDim2.new(0, 63, 0, 16)
			TextBox.Font = Enum.Font.GothamSemibold
			TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextBox.TextSize = 9.000
			TextBox.Text = set
			TextBox.TextTransparency = 0

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBox

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			if Value == nil then
				Value = set
				pcall(function()
					callback(Value)
				end)
			end
			
			AHEHE.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
				circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				moveconnection = mouse.Move:Connect(function()
					TextBox.Text = Value
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					pcall(function()
						callback(Value)
					end)
					bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
					circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
						circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					TextBox.Text = Value
				end
			end)

			TextBox.FocusLost:Connect(function()
				if tonumber(TextBox.Text) > max then
					TextBox.Text  = max
				end
				bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
				pcall(callback, TextBox.Text)
			end)
		end

        function main:AddTextbox(text,disappear,callback)
			local Textbox = Instance.new("Frame")
			local TextboxCorner = Instance.new("UICorner")
			local Textboxx = Instance.new("Frame")
			local TextboxxCorner = Instance.new("UICorner")
			local TextboxLabel = Instance.new("TextLabel")
			local txtbtn = Instance.new("TextButton")
			local RealTextbox = Instance.new("TextBox")
			local UICorner = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = MainFramePage
			Textbox.BackgroundColor3 = maincolor
			Textbox.BackgroundTransparency = 0
			Textbox.Size = UDim2.new(0, 335, 0, 31)

			TextboxCorner.CornerRadius = UDim.new(0, 5)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			Textboxx.Name = "Textboxx"
			Textboxx.Parent = Textbox
			Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Textboxx.Position = UDim2.new(0, 1, 0, 1)
			Textboxx.Size = UDim2.new(0, 333, 0, 29)

			TextboxxCorner.CornerRadius = UDim.new(0, 5)
			TextboxxCorner.Name = "TextboxxCorner"
			TextboxxCorner.Parent = Textboxx

			TextboxLabel.Name = "TextboxLabel"
			TextboxLabel.Parent = Textbox
			TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxLabel.BackgroundTransparency = 1.000
			TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
			TextboxLabel.Text = text
			TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
			TextboxLabel.Font = Enum.Font.GothamSemibold
			TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextboxLabel.TextSize = 16.000
			TextboxLabel.TextTransparency = 0
			TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

			txtbtn.Name = "txtbtn"
			txtbtn.Parent = Textbox
			txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			txtbtn.BackgroundTransparency = 1.000
			txtbtn.Position = UDim2.new(0, 1, 0, 1)
			txtbtn.Size = UDim2.new(0, 333, 0, 29)
			txtbtn.Font = Enum.Font.SourceSans
			txtbtn.Text = ""
			txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			txtbtn.TextSize = 14.000

			RealTextbox.Name = "RealTextbox"
			RealTextbox.Parent = Textbox
            RealTextbox.ClipsDescendants = true
			RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			RealTextbox.BackgroundTransparency = 0
			RealTextbox.Position = UDim2.new(0, 255, 0, 6)
			RealTextbox.Size = UDim2.new(0, 75, 0, 20)
			RealTextbox.Font = Enum.Font.GothamSemibold
			RealTextbox.Text = ""
			RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
			RealTextbox.TextSize = 11.000
			RealTextbox.TextTransparency = 0

			RealTextbox.FocusLost:Connect(function()
				callback(RealTextbox.Text)
				if disappear then
					RealTextbox.Text = ""
				end
			end)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = RealTextbox
		end
		function main:AddLabel(text)
			local Label = Instance.new("TextLabel")
			local PaddingLabel = Instance.new("UIPadding")
			local labell = {}
	
			Label.Name = "Label"
			Label.Parent = MainFramePage
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 335, 0, 20)
			Label.Font = Enum.Font.GothamSemibold
			Label.TextColor3 = Color3.fromRGB(225, 225, 225)
			Label.TextSize = 16.000
			Label.Text = text
			Label.TextXAlignment = Enum.TextXAlignment.Left

			PaddingLabel.PaddingLeft = UDim.new(0,15)
			PaddingLabel.Parent = Label
			PaddingLabel.Name = "PaddingLabel"
	
			function labell:Set(newtext)
				Label.Text = newtext
			end

			return labell
		end
		function main:AddSeperator(text)
			local Seperator = Instance.new("Frame")
			local Sep1 = Instance.new("Frame")
			local Sep2 = Instance.new("TextLabel")
			local Sep3 = Instance.new("Frame")
			
			Seperator.Name = "Seperator"
			Seperator.Parent = MainFramePage
			Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.BackgroundTransparency = 1.000
			Seperator.Size = UDim2.new(0, 335, 0, 20)
			
			Sep1.Name = "Sep1"
			Sep1.Parent = Seperator
			Sep1.BackgroundColor3 = maincolor
			Sep1.BorderSizePixel = 0
			Sep1.Position = UDim2.new(0, 0, 0, 10)
			Sep1.Size = UDim2.new(0, 80, 0, 1)
			
			Sep2.Name = "Sep2"
			Sep2.Parent = Seperator
			Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.BackgroundTransparency = 1.000
			Sep2.Position = UDim2.new(0, 120, 0, 0)
			Sep2.Size = UDim2.new(0, 100, 0, 20)
			Sep2.Font = Enum.Font.GothamSemibold
			Sep2.Text = text
			Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.TextSize = 14.000
			
			Sep3.Name = "Sep3"
			Sep3.Parent = Seperator
			Sep3.BackgroundColor3 = maincolor
			Sep3.BorderSizePixel = 0
			Sep3.Position = UDim2.new(0, 255, 0, 10)
			Sep3.Size = UDim2.new(0, 80, 0, 1)
		end

		function main:AddLine()
			local Linee = Instance.new("Frame")
			local Line = Instance.new("Frame")
			
			Linee.Name = "Linee"
			Linee.Parent = MainFramePage
			Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Linee.BackgroundTransparency = 1.000
			Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
			Linee.Size = UDim2.new(0, 335, 0, 20)
			
			Line.Name = "Line"
			Line.Parent = Linee
			Line.BackgroundColor3 = maincolor
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 0, 0, 10)
			Line.Size = UDim2.new(0, 335, 0, 1)
		end
        return main
    end
    return uitab
end
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
task.spawn(function()
	while wait() do
		pcall(function()
			if HideDmg then
				game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
			else
				game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
			end
		end)
	end
end)

task.spawn(function()
while task.wait() do
		for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
			if v.Name == "eff" or v.Name == "CurvedRing" or v.Name == "SwordSlash" or v.Name == "Sounds" or v.Name == "SlashHit" then
				v:Destroy() 
			end
		end
end
end)

task.spawn(function()
while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
				if v.ClassName == "MeshPart" then
					v.Transparency = 0.5
				end
			end
			for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
				if v.Name == "Head" then
					v.Transparency = 0.5
				end
			end
			for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
				if v.ClassName == "Accessory" then
					v.Handle.Transparency = 0.5
				end
			end
			for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
				if v.ClassName == "Decal" then
					v.Transparency = 0.5
				end
			end
		end)
	end

end)
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
function Equip(ToolX)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolX) then
		getgenv().Tol = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolX)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tol)
	end
end
task.spawn(function()
    while true do wait()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                if Kick.Name == 'ErrorPrompt' and Kick:FindFirstChild('MessageArea') and Kick.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    wait(50)
                end
        end)
    end
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
function Equip(ToolX)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolX) then
		getgenv().Tol = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolX)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tol)
	end
end
task.spawn(function()
    while true do wait()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
                if Kick.Name == 'ErrorPrompt' and Kick:FindFirstChild('MessageArea') and Kick.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    wait(50)
                end
        end)
    end
end)
function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then 
			return true
		end
		return false
	end
end
function Com(com,...)
	local Remote = game:GetService('ReplicatedStorage').Remotes:FindFirstChild("Comm"..com)
	if Remote:IsA("RemoteEvent") then
		Remote:FireServer(...)
	elseif Remote:IsA("RemoteFunction") then
		Remote:InvokeServer(...)
	end
end
task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if _G.Clip or Fly or _G.TeleportIsland or _G.Auto_Farm_Fruit or _G.Auto_Farm_Level or _G.Auto_Bartilo_Quest or _G.Auto_Swan_Glasses or _G.Auto_Farm_LevelSky or _G.Auto_Hallow_Scythe or _G.Auto_Evo_Race_V2 or _G.MobAura or _G.Auto_Third_World or _G.Auto_New_World or _G.NextIsland or _G.Auto_Farm_Bone or _G.Auto_Farm_All_Boss or _G.Auto_Farm_Boss or _G.AutoEctoplasm or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Candy or _G.Auto_Farm_LevelFruitMastery or _G.Auto_Rengoku or _G.Auto_Canvander or _G.Auto_Twin_Hook or _G.Auto_Serpent_Bow or _G.Auto_Elite_Hunter or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_GunPowder or _G.Auto_Farm_Dragon_Scales or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Dragon_Trident or _G.Auto_Yama or _G.Auto_Soul_Reaper or _G.Auto_Cake_Prince then
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
local RenUi = library:CreateWindow("Day ",Color3.fromRGB(175,238,238)," Blox Fruits")
--------------------------------------------------------------------
local Main = RenUi:AddTab("Main")
local Teleport = RenUi:AddTab("Teleport")
local Dungeon = RenUi:AddTab("Dungeon")
local Misc = RenUi:AddTab("Misc")
--------------------------------------------------------------------
Main:AddSeperator("Settings")
Time = Main:AddLabel("Server Time")
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
end
task.spawn(function()
    while task.wait() do
        pcall(function()
            UpdateTime()
        end)
    end
end)
local plr = game.Players.LocalPlayer
    
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
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
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
task.spawn(function()
    while task.wait(0.04) do
        pcall(function()
          if _G.DamagerAura then
              if _G.DamagerAura then
                AttackNoCD(10000)
              end
          end
      end)
    end
end)
Weapon = {
	"Melee",
	"Sword",
	"Devil Fruit"
}
FastAttack = {
    "Slow",
    "Fast",
    "Extreme",
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
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
function CurrentWeapon()
	local ac = CombatFrameworkR.activeController
	local ret = ac.blades[1]
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	pcall(function()
		while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
	end)
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	return ret
end
function getAllBladeHitsPlayers(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i=1,#Characters do local v = Characters[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end
function getAllBladeHits(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i=1,#Enemies do local v = Enemies[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end
function DamageAura()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		for indexincrement = 1, 1 do
			local bladehit = getAllBladeHits(150) local a = getAllBladeHitsPlayers(150)
			if #bladehit or #a > 0 then
				local AcAttack8 = debug.getupvalue(ac.attack, 5)
				local AcAttack9 = debug.getupvalue(ac.attack, 6)
				local AcAttack7 = debug.getupvalue(ac.attack, 4)
				local AcAttack10 = debug.getupvalue(ac.attack, 7)
				local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
				local NumberAc13 = AcAttack7 * 798405
				(function()
					NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
					AcAttack8 = math.floor(NumberAc12 / AcAttack9)
					AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
				end)()
				AcAttack10 = AcAttack10 + 1
				debug.setupvalue(ac.attack, 5, AcAttack8)
				debug.setupvalue(ac.attack, 6, AcAttack9)
				debug.setupvalue(ac.attack, 4, AcAttack7)
				debug.setupvalue(ac.attack, 7, AcAttack10)
				for k, v in pairs(ac.animator.anims.basic) do
					v:Play(0.01,0.01,0.01)
				end                 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, indexincrement, "") 
				end
			end
		end
	end
end
function AttackFunction()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		for indexincrement = 1, 1 do
			local bladehit = getAllBladeHits(60)
			if #bladehit > 0 then
				local AcAttack8 = debug.getupvalue(ac.attack, 5)
				local AcAttack9 = debug.getupvalue(ac.attack, 6)
				local AcAttack7 = debug.getupvalue(ac.attack, 4)
				local AcAttack10 = debug.getupvalue(ac.attack, 7)
				local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
				local NumberAc13 = AcAttack7 * 798405
				(function()
					NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
					AcAttack8 = math.floor(NumberAc12 / AcAttack9)
					AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
				end)()
				AcAttack10 = AcAttack10 + 1 
				debug.setupvalue(ac.attack, 5, AcAttack8)
				debug.setupvalue(ac.attack, 6, AcAttack9)
				debug.setupvalue(ac.attack, 4, AcAttack7)
				debug.setupvalue(ac.attack, 7, AcAttack10)
				for k, v in pairs(ac.animator.anims.basic) do
					v:Play(0.01,0.01,0.01)
				end                 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, indexincrement, "")
				end
			end
		end
	end
end
task.spawn(function()
    pcall(function()
    while task.wait(_G.Fast_Delay) do
        if FastAttackSpeed then
            AttackFunction()
           end
        end
    end)
end)
Main:AddToggle("Auto Haki",true,_G.Auto_Haki,function(vu)
    _G.Auto_Haki = vu
end)
task.spawn(function()
    while task.wait() do
		pcall(function()
			if _G.Auto_Haki then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				else
					task.wait()
				end
			end
		end)
    end
end)
Main:AddDropdown("Select Weapon Type",Weapon,function(vu)
	SelectWeapon = vu
end)
Main:AddDropdown("Select Fast Attack",FastAttack,function(vu)
		SelectSpeedFast = vu
	if SelectSpeedFast == "Slow" then
		_G.Fast_Delay = 0.09
	elseif SelectSpeedFast == "Fast" then
		_G.Fast_Delay = 0.05
	elseif SelectSpeedFast == "Extreme" then
		_G.Fast_Delay = 0.01
	end
end)
Main:AddToggle("Damage Aura",_G.DamagerAura,function(vu)
    _G.DamagerAura = vu
end)
Main:AddToggle("White Screen",_G.WhiteScreen,function(vu)
    _G.WhiteScreen = vu
if _G.WhiteScreen == true then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
elseif _G.WhiteScreen == false then
    game:GetService("RunService"):Set3dRenderingEnabled(true)
end
end)
Main:AddToggle("Black Screen",StartBlackScreen,function(vu)
    StartBlackScreen = vu
local BlackScreen = game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen
getgenv().DefaultSize = BlackScreen.Size
getgenv().NewSize = UDim2.new(500, 0, 500, 500)
getgenv().StartBlackScreen = false
if StartBlackScreen then
	BlackScreen.Size = NewSize
else
	BlackScreen.Size = UDim2.new(DefaultSize)
end
end)
Main:AddSeperator("Farm")
local AutoFarm = Main:AddToggle("Auto Farm Level",_G.Auto_Farm_Level,function(vu)
    _G.Auto_Farm_Level = vu
	StopTween(_G.Auto_Farm_Level)
end)
require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.Particle.SlashHit).playAt = function() return nil end;
getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync 
getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
spawn(function()
    while wait() do
        if _G.Auto_Farm_Level then
            pcall(function()
                require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync =function(a1,a2,a3,a4,a5)
                    local GetBladeHits = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).getBladeHits(a2,a3,a4)
                    if GetBladeHits then
                        require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).play = function() end;
                        a1:Play(0.1, 0.1, 0.1);
                        a5(GetBladeHits);
                        require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).play = getgenv().B 
                        wait(.5);
                        a1:Stop();
                    end;
                end;
            end);
        end
    end;
end);
spawn(function()
	while task.wait() do
		if _G.Auto_Farm_Level then
		    pcall(function()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				StartMagnet = false;
				    CheckQuest();
        			TP2(CFrameQuestuest);
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuestuest.Position).Magnitude <= 20 then
					    CheckQuest();
					    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuestuest
					    task.wait(.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint");
		        end;
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckQuest();
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Ms and v:FindFirstChild("Humanoid") then
								if v.Humanoid.Health > 0 then
									repeat wait(_G.Fast_Delay)
										if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
											if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                local args = {
                                                    [1] = "Buso"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args));
												end;
												StartMagnet = true
												FastAttackSpeed = true
                                                Equip(WeaponName)
												if _G.Type==1 then
                                                     TP2(v.HumanoidRootPart.CFrame*CFrame.new(0,0,-30));
                                                    elseif _G.Type==2 then
                                                     TP2(v.HumanoidRootPart.CFrame*CFrame.new(30,0,0));
                                                    elseif _G.Type==3 then
                                                     TP2(v.HumanoidRootPart.CFrame*CFrame.new(-30,0,0));
                                                    elseif _G.Type==4 then
                                                     TP2(v.HumanoidRootPart.CFrame*CFrame.new(0,0,30));
                                                    elseif _G.Type==5 then
                                                     TP2(v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(270), 0, 0) - Vector3.new(0,-30,0));
                                                end;
												if isnetworkowner(v.HumanoidRootPart) then
												v.HumanoidRootPart.CanCollide = false;
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
												PosMon = v.HumanoidRootPart.CFrame
                        						v.Humanoid.JumpPower = 0;
                        						v.Humanoid.WalkSpeed = 0;
                                                v.HumanoidRootPart.CanCollide = false
                                                if v.Humanoid:FindFirstChild("Animator") then
                                                    v.Humanoid.Animator:Destroy();
                                                end;
                                                v.Humanoid:ChangeState(14);
                                                else
                                                v.HumanoidRootPart.CanCollide = false;
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
												PosMon = v.HumanoidRootPart.CFrame
                        						v.Humanoid.JumpPower = 0;
                        						v.Humanoid.WalkSpeed = 0;
                                                v.HumanoidRootPart.CanCollide = false;
                                                if v.Humanoid:FindFirstChild("Animator") then
                                                    v.Humanoid.Animator:Destroy();
                                                end;
                                                v.Humanoid:ChangeState(14);
												end;
												StartMagnet = true;
											else
												StartMagnet = false; 
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
											end;
										else
											StartMagnet = false;
											FastAttackSpeed = false;
											CheckQuest();
											TP2(CFrameMon)
										end
									until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Farm_Level == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
									FastAttackSpeed = false
								end;
							end;
						end;
					else
						StartMagnet = false;
						FastAttackSpeed = false;
						CheckQuest();
						TP2(CFrameMon)
					end;
				end);
			end;
		    end);
	    end;
	end;
end);
task.spawn(function() 
	_G.Type=math.random(1,5);
	while task.wait(.2) do
	_G.Type=math.random(1,5);
	end;
end);
Main:AddToggle("Auto Soul Reaper",_G.Auto_Soul_Reaper,function(vu)
    _G.Auto_Soul_Reaper = vu
	StopTween(_G.Auto_Soul_Reaper)
end)
task.spawn(function()
	while task.wait() do
		if _G.Auto_Soul_Reaper then
			pcall(function()
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then                    
					topos(CFrame.new(-8932.7900390625, 146.8223114013672, 6063.076171875))  
				elseif game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
					if game.Workspace.Enemies:FindFirstChild ("Soul Reaper [Lv. 2100] [Raid Boss]") then    
						for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]"  then
								if _G.Auto_Soul_Reaper and v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat task.wait(_G.Fast_Delay)
										FastAttackSpeed = true
										Equip(WeaponName)
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until not _G.Auto_Soul_Reaper or not v.Parent or v.Humanoid.Health <= 0
									FastAttackSpeed = false
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
Boss = {}
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
	if string.find(v.Name,"Boss") then
		table.insert(Boss,v.Name)
	end
end
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
	if string.find(v.Name,"Boss") then
		table.insert(Boss,v.Name)
	end
end
Main:AddToggle("Auto Farm Boss",_G.Auto_Farm_Boss,function(vu)
    _G.Auto_Farm_Boss = vu
	StopTween(_G.Auto_Farm_Boss)
end)
task.spawn(function()
	while task.wait() do
		if _G.Auto_Farm_Boss then
			pcall(function()
				CheckBossQuest()
				if MsBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or MsBoss == "Longma [Lv. 2000] [Boss]" or MsBoss == "Don Swan [Lv. 1000] [Boss]" or MsBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or MsBoss == "Order [Lv. 1250] [Raid Boss]" or MsBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
					if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == MsBoss then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					else
						TP2(CFrameBoss)
					end
				else
					if _G.Auto_Quest_Boss then
						CheckBossQuest()
						if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							repeat task.wait() TP2(CFrameQuestuestBoss) until (CFrameQuestuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Farm_Boss
							if (CFrameQuestuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == MsBoss then
										repeat task.wait(_G.Fast_Delay)
											if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
												FastAttackSpeed = true
												Equip(WeaponName)
												TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))									
											else
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
											end
										until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
										FastAttackSpeed = false
									end
								end
							else
								TP2(CFrameBoss)
							end
						end
					else
						if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == MsBoss then
									repeat task.wait()
										FastAttackSpeed = true
										Equip(WeaponName)
										TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))										
									until _G.Auto_Farm_Boss == false or not v.Parent or v.Humanoid.Health <= 0
									FastAttackSpeed = false
								end
							end
						else
							TP2(CFrameBoss)
						end
					end
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Quest Boss",true,_G.Auto_Quest_Boss,function(vu)
    _G.Auto_Quest_Boss = vu
end)
Main:AddToggle("Auto Farm All Boss",_G.Auto_Farm_All_Boss,function(vu)
    _G.Auto_Farm_All_Boss = vu
	StopTween(_G.Auto_Farm_All_Boss)
end)
task.spawn(function()
	while task.wait() do
		if _G.Auto_Farm_All_Boss then
			pcall(function()
				for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
					if string.find(v.Name,"Boss") then
						repeat task.wait(_G.Fast_Delay)
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
								TP2(v.HumanoidRootPart.CFrame)
							elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
								FastAttackSpeed = true
								Equip(WeaponName)
								v.Humanoid.WalkSpeed = 0
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(80,80,80)
								TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
							end
						until v.Humanoid.Health <= 0 or _G.Auto_Farm_All_Boss == false or not v.Parent
						FastAttackSpeed = false
					end
				end
			end)
		end
	end
end)
Main:AddDropdown("Select Boss",Boss,function(vu)
	_G.Select_Boss = vu
end)
Main:AddButton("Refresh Boss",function(vu)
	Boss:Clear()
for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
	if string.find(v.Name,"Boss") then
		Boss:Add(v.Name)
	end
end
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
	if string.find(v.Name,"Boss") then
		Boss:Add(v.Name)
	end
end
end)
if Old_World then
Main:AddSeperator("Farm Items World 1")
Main:AddToggle("Auto Farm Magma Ore",_G.Auto_Farm_Magma_Ore,function(vu)
    _G.Auto_Farm_Magma_Ore = vu
	StopTween(_G.Auto_Farm_Magma_Ore)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Magma_Ore and StartMagnetMagmaOreMon and (v.Name == "Military Soldier [Lv. 300]" or v.Name == "Military Spy [Lv. 325]") and (v.HumanoidRootPart.Position - PosMonMagmaOre.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMagmaOre
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
		if _G.Auto_Farm_Magma_Ore and Old_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Military Soldier [Lv. 300]") or game:GetService("Workspace").Enemies:FindFirstChild("Military Spy [Lv. 325]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Military Soldier [Lv. 300]" or v.Name == "Military Spy [Lv. 325]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetMagmaOreMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonMagmaOre = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Magma_Ore == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetMagmaOreMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Military Soldier [Lv. 300]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Military Spy [Lv. 325]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Fish Tail",_G.Auto_Farm_Fish_Tail,function(vu)
    _G.Auto_Farm_Fish_Tail = vu
	StopTween(_G.Auto_Farm_Fish_Tail)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Fish_Tail and StartMagnetFishTailMon and (v.Name == "Fishman Warrior [Lv. 375]" or v.Name == "Fishman Commando [Lv. 400]") and (v.HumanoidRootPart.Position - PosMonFishTail.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonFishTail
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
		if _G.Auto_Farm_Fish_Tail and Old_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Warrior [Lv. 375]") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Commando [Lv. 400]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Fishman Warrior [Lv. 375]" or v.Name == "Fishman Commando [Lv. 400]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetFishTailMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonFishTail = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Fish_Tail == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetFishTailMon = false
					local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					if Distance > 20000 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
					end
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Fishman Warrior [Lv. 375]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Fishman Commando [Lv. 400]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Scrap and Leather",_G.Auto_Farm_Scrap_and_Leather,function(vu)
    _G.Auto_Farm_Scrap_and_Leather = vu
	StopTween(_G.Auto_Farm_Scrap_and_Leather)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Scrap_and_Leather and StartMagnetScrapleatherMon and (v.Name == "Pirate [Lv. 35]" or v.Name == "Brute [Lv. 45]") and (v.HumanoidRootPart.Position - PosMonScrapleather.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonScrapleather
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
		if _G.Auto_Farm_Scrap_and_Leather and Old_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Pirate [Lv. 35]") or game:GetService("Workspace").Enemies:FindFirstChild("Brute [Lv. 45]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Pirate [Lv. 35]" or v.Name == "Brute [Lv. 45]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetScrapleatherMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonScrapleather = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Scrap_and_Leather == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetScrapleatherMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Pirate [Lv. 35]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Brute [Lv. 45]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-1182.3310546875, 60.88254928588867, 4049.5380859375))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Angel Wing",_G.Auto_Farm_Angel_Wing,function(vu)
    _G.Auto_Farm_Angel_Wing = vu
	StopTween(_G.Auto_Farm_Angel_Wing)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Angel_Wing and StartMagnetAngelWingMon and (v.Name == "Royal Squad [Lv. 525]" or v.Name == "Royal Soldier [Lv. 550]") and (v.HumanoidRootPart.Position - PosMonAngelWing.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonAngelWing
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
		if _G.Auto_Farm_Angel_Wing and Old_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Royal Squad [Lv. 525]") or game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier [Lv. 550]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Royal Squad [Lv. 525]" or v.Name == "Royal Soldier [Lv. 550]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetAngelWingMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonAngelWing = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Angel_Wing == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetAngelWingMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Royal Squad [Lv. 525]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Royal Soldier [Lv. 550]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-7957.654296875, 5644.396484375, -1457.434814453125))
				end
			end)
		end
	end
end)
end
if New_World then
Main:AddSeperator("Farm Items World 2")
Main:AddToggle("Auto Farm Ectoplasm",_G.AutoEctoplasm,function(vu)
    _G.AutoEctoplasm = vu
	StopTween(_G.AutoEctoplasm)
end)
task.spawn(function()
	pcall(function()
		while task.wait() do
			if _G.AutoEctoplasm then
				if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if string.find(v.Name, "Ship") then
							repeat task.wait(_G.Fast_Delay)
								FastAttackSpeed = true
								Equip(WeaponName)
								if string.find(v.Name,"Ship") then
									v.HumanoidRootPart.CanCollide = false
									v.Head.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									EctoplasmMon = v.HumanoidRootPart.CFrame
									StartEctoplasmMagnet = true
								else
									StartEctoplasmMagnet = false
									TP2(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
								end
							until _G.AutoEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
							FastAttackSpeed = false
						end
					end
				else
					StartEctoplasmMagnet = false
					local Distance = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					if Distance > 18000 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
					end
					TP2(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
				end
			end
		end
	end)
end)
Main:AddToggle("Auto Farm Scrap and Leather",_G.Auto_Farm_Scrap_and_Leather,function(vu)
    _G.Auto_Farm_Scrap_and_Leather = vu
	StopTween(_G.Auto_Farm_Scrap_and_Leather)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Scrap_and_Leather and StartMagnetScrapleatherMon and v.Name == "Mercenary [Lv. 725]" and (v.HumanoidRootPart.Position - PosMonScrapleather.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonScrapleather
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
		if _G.Auto_Farm_Scrap_and_Leather and New_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Mercenary [Lv. 725]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Mercenary [Lv. 725]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetScrapleatherMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonScrapleather = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Scrap_and_Leather == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetScrapleatherMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Mercenary [Lv. 725]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344, -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Radioactive",_G.Auto_Farm_Radioactive,function(vu)
    _G.Auto_Farm_Radioactive = vu
	StopTween(_G.Auto_Farm_Radioactive)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Radioactive and StartMagnetRadioactive and v.Name == "Factory Staff [Lv. 800]" and (v.HumanoidRootPart.Position - PosMonRadioactive.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonRadioactive
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
		if _G.Auto_Farm_Radioactive and New_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff [Lv. 800]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Factory Staff [Lv. 800]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetRadioactive = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonRadioactive = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Radioactive == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetRadioactive = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Factory Staff [Lv. 800]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(262.9140625, 72.95976257324219, -89.57562255859375))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Vampire Fang",_G.Auto_Farm_Vampire_Fang,function(vu)
    _G.Auto_Farm_Vampire_Fang = vu
	StopTween(_G.Auto_Farm_Vampire_Fang)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Vampire_Fang and StartMagnetVampireFang and v.Name == "Vampire [Lv. 975]" and (v.HumanoidRootPart.Position - PosMonVampireFang.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonVampireFang
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
		if _G.Auto_Farm_Vampire_Fang and New_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Vampire [Lv. 975]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Vampire [Lv. 975]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetVampireFang = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonVampireFang = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Vampire_Fang == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetRadioactive = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Vampire [Lv. 975]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Magma Ore",_G.Auto_Farm_Magma_Ore,function(vu)
    _G.Auto_Farm_Magma_Ore = vu
	StopTween(_G.Auto_Farm_Magma_Ore)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Magma_Ore and StartMagnetMagmaOreMon and (v.Name == "Magma Ninja [Lv. 1175]" or v.Name == "Lava Pirate [Lv. 1200]") and (v.HumanoidRootPart.Position - PosMonMagmaOre.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMagmaOre
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
		if _G.Auto_Farm_Magma_Ore and New_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Magma Ninja [Lv. 1175]") or game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Magma Ninja [Lv. 1175]" or v.Name == "Lava Pirate [Lv. 1200]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetMagmaOreMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonMagmaOre = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Magma_Ore == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetMagmaOreMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Magma Ninja [Lv. 1175]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Lava Pirate [Lv. 1200]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-5525.38037109375, 17.856924057006836, -5577.93359375))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Mystic Droplet",_G.Auto_Farm_Mystic_Droplet,function(vu)
    _G.Auto_Farm_Mystic_Droplet = vu
	StopTween(_G.Auto_Farm_Mystic_Droplet)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Mystic_Droplet and StartMagnetMysticDropletMon and (v.Name == "Sea Soldier [Lv. 1425]") and (v.HumanoidRootPart.Position - PosMonMysticDroplet.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMysticDroplet
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
		if _G.Auto_Farm_Mystic_Droplet and New_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Sea Soldier [Lv. 1425]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Sea Soldier [Lv. 1425]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetMysticDropletMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonMysticDroplet = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Mystic_Droplet == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetMysticDropletMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Sea Soldier [Lv. 1425]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-2955.86328125, 15.63549518585205, -9725.2802734375))
				end
			end)
		end
	end
end)
end
if Three_World then
Main:AddSeperator("Farm Items World 3")
Main:AddToggle("Auto Farm Scrap And Leather",_G.Auto_Farm_Scrap_and_Leather,function(vu)
    _G.Auto_Farm_Scrap_and_Leather = vu
	StopTween(_G.Auto_Farm_Scrap_and_Leather)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Scrap_and_Leather and StartMagnetScrapleatherMon and v.Name == "Pirate Millionaire [Lv. 1500]" and (v.HumanoidRootPart.Position - PosMonScrapleather.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonScrapleather
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
		if _G.Auto_Farm_Scrap_and_Leather and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Pirate Millionaire [Lv. 1500]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Pirate Millionaire [Lv. 1500]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetScrapleatherMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonScrapleather = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Scrap_and_Leather == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetScrapleatherMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Pirate Millionaire [Lv. 1500]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-275.8073425292969, 44.80481719970703, 5598.36865234375))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Gun Powder",_G.Auto_Farm_GunPowder,function(vu)
    _G.Auto_Farm_GunPowder = vu
	StopTween(_G.Auto_Farm_GunPowder)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_GunPowder and StartMagnetGunPowderMon and v.Name == "Pistol Billionaire [Lv. 1525]" and (v.HumanoidRootPart.Position - PosMonGunPowder.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonGunPowder
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
		if _G.Auto_Farm_GunPowder and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Pistol Billionaire [Lv. 1525]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Pistol Billionaire [Lv. 1525]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetGunPowderMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonGunPowder = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_GunPowder == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetGunPowderMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Pistol Billionaire [Lv. 1525]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-455.71466064453125, 73.72992706298828, 5929.4609375))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Dragon Scales",_G.Auto_Farm_Dragon_Scales,function(vu)
    _G.Auto_Farm_Dragon_Scales = vu
	StopTween(_G.Auto_Farm_Dragon_Scales)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Dragon_Scales and StartMagnetDragonScalesMon and (v.Name == "Dragon Crew Archer [Lv. 1600]") and (v.HumanoidRootPart.Position - PosMonDragonScales.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonDragonScales
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
		if _G.Auto_Farm_Dragon_Scales and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer [Lv. 1600]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Dragon Crew Archer [Lv. 1600]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetDragonScalesMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonDragonScales = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Dragon_Scales == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetDragonScalesMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Dragon Crew Archer [Lv. 1600]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(6611.4091796875, 383.3892517089844, 159.88619995117188))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Fish Tail",_G.Auto_Farm_Fish_Tail,function(vu)
    _G.Auto_Farm_Fish_Tail = vu
	StopTween(_G.Auto_Farm_Fish_Tail)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Fish_Tail and StartMagnetFishTailMon and (v.Name == "Fishman Raider [Lv. 1775]" or v.Name == "Fishman Captain [Lv. 1800]") and (v.HumanoidRootPart.Position - PosMonFishTail.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonFishTail
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
		if _G.Auto_Farm_Fish_Tail and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Raider [Lv. 1775]") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Captain [Lv. 1800]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Fishman Raider [Lv. 1775]" or v.Name == "Fishman Captain [Lv. 1800]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetFishTailMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonFishTail = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Fish_Tail == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetFishTailMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Fishman Raider [Lv. 1775]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Fishman Captain [Lv. 1800]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Mini Tusk",_G.Auto_Farm_Mini_Tusk,function(vu)
    _G.Auto_Farm_Mini_Tusk = vu
	StopTween(_G.Auto_Farm_Mini_Tusk)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Mini_Tusk and StartMagnetMiniTuskMon and v.Name == "Mythological Pirate [Lv. 1850]" and (v.HumanoidRootPart.Position - PosMonMiniTusk.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMiniTusk
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
		if _G.Auto_Farm_Mini_Tusk and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate [Lv. 1850]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Mythological Pirate [Lv. 1850]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetMiniTuskMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonMiniTusk = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Mini_Tusk == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetMiniTuskMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Mythological Pirate [Lv. 1850]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(-13508.68359375, 582.6758422851562, -6986.06298828125))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Conjured Cocoa",_G.Auto_Farm_Conjured_Cocoa,function(vu)
    _G.Auto_Farm_Conjured_Cocoa = vu
	StopTween(_G.Auto_Farm_Conjured_Cocoa)
end)
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Conjured_Cocoa and StartMagnetConjuredCocoaMon and (v.Name == "Cocoa Warrior [Lv. 2300]" or v.Name == "Chocolate Bar Battler [Lv. 2325]") and (v.HumanoidRootPart.Position - PosMonConjuredCocoa.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonConjuredCocoa
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
		if _G.Auto_Farm_Conjured_Cocoa and Three_World then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior [Lv. 2300]") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler [Lv. 2325]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Cocoa Warrior [Lv. 2300]" or v.Name == "Chocolate Bar Battler [Lv. 2325]" then
							if v.Humanoid.Health > 0 then
								repeat task.wait(_G.Fast_Delay)
									FastAttackSpeed = true
									Equip(WeaponName)
									StartMagnetConjuredCocoaMon = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									PosMonConjuredCocoa = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.Auto_Farm_Conjured_Cocoa == false or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
							end
						end
					end
				else
					StartMagnetConjuredCocoaMon = false
					for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
						if v.Name == "Cocoa Warrior [Lv. 2300]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						elseif v.Name == "Chocolate Bar Battler [Lv. 2325]" then
							TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
						end
					end
					TP2(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
				end
			end)
		end
	end
end)
Main:AddToggle("Auto Farm Bone",_G.Auto_Farm_Bone,function(vu)
    _G.Auto_Farm_Bone = vu
	StopTween(_G.Auto_Farm_Bone)
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
		pcall(function()
			if _G.Auto_Farm_Bone then
				if Three_World then
				if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat wait(_G.Fast_Delay)
									StartMagnetBoneMon = true
									FastAttackSpeed = true
									Equip(WeaponName)
									PosMonBone = v.HumanoidRootPart.CFrame
									v.HumanoidRootPart.Size = Vector3.new(60,60,60)
									v.Humanoid.JumpPower = 0
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.Humanoid:ChangeState(11)
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
								until not _G.Auto_Farm_Bone or _G.Auto_Farm_LevelBoneForSythe or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
								FastAttackSpeed = false
								StartMagnetBoneMon = false
							end
						end
					end
				else
					TP2(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
				end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
				end
		end
		end)
	end
end)
end
if Old_World then
Teleport:AddLabel("[ World 1 🌀 ]")
Teleport:AddButton("Teleport To Second Sea",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end)
Teleport:AddButton("Teleport To Third Sea",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end)
end
if New_World then
	Teleport:AddLabel("[ World 2 🌀 ]")
	Teleport:AddButton("Teleport To Old World",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
Teleport:AddButton("Teleport To Third Sea",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)
end
if Three_World then
	Teleport:AddLabel("[ World 3 🌀 ]")
	Teleport:AddButton("Teleport To Old World",function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
Teleport:AddButton("Teleport To Second Sea",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
end
if New_World or Three_World then
	Teleport:AddButton("Teleport to Sea beast",function()
        for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                TP2(v.HumanoidRootPart.CFrame*CFrame.new(0,100,0))
            end
        end
    end)
end
Teleport:AddSeperator("[ Server ]")
Teleport:AddButton('Hop', function()
	game.StarterGui:SetCore("SendNotification", {
	Title = "Hop Server", 
	Text = "Ready Go!",
	Duration = 10
})
HOP()
end)
Teleport:AddButton('Hop Low Server', function()
	game.StarterGui:SetCore("SendNotification", {
	Title = "Hop Lower Server", 
	Text = "Ready Go!",
	Duration = 10
})
HopServer()
end)
Teleport:AddButton('Rejoin', function()
	game.StarterGui:SetCore("SendNotification", {
	Title = "Re Join Server", 
	Text = "Ready Go!",
	Duration = 10
})
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(game.PlaceId, p)
end)
function HopServer()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TP2Returner()
		local Site;
		if foundAnything == "" then
			Site = game.HtTP2Service:JSONDecode(game:HtTP2Get('htTP2s://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HtTP2Service:JSONDecode(game:HtTP2Get('htTP2s://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nexTP2ageCursor and Site.nexTP2ageCursor ~= "null" and Site.nexTP2ageCursor ~= nil then
			foundAnything = Site.nexTP2ageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
						-- delfile("NotSameServers.json")
						AllIDs = {}
						table.insert(AllIDs, actualHour)
						end)
					end
				end
					num = num + 1
			end
				if Possible == true then
				table.insert(AllIDs, ID)
				task.wait()
				pcall(function()
				-- writefile("NotSameServers.json", game:GetService('HtTP2Service'):JSONEncode(AllIDs))
				wait()
				game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(.1)
			end
		end
	end
end
									
function Teleport() 
		while wait(1) do
			pcall(function()
				TP2Returner()
				if foundAnything ~= "" then
					TP2Returner()
				end
			end)
		end
	end
	Teleport()
end

function HOP()
	HopServer()
	HopServer()
	HopServer()
	HopServer()
	HopServer()
	while wait(0.2) do
		pcall(function()
			HopServer()
			if foundAnything ~= "" then
				HopServer()
			end
		end)
	end
end
Teleport:AddSeperator("[ Teleport Island 🌀 ]")
if Old_World then
	TeleportTable = {"Start Island","Marine","MarineFord","Middle Town","Jungle","Pirate Village","Desert","Frozen Village","Colosseum","Prison","Mob Leader","Magma Village","UnderWater Gate","UnderWater City","Fountain City","Sky1","Sky2","Sky3"}
elseif New_World then
	TeleportTable = {"Dock","Flamingo Mansion","Flamingo Room","Cafe","Sunflower Field","Jeramy Mountain","Colossuem","Factroy","The Bridge","Green Bit","Graveyard","Dark Area","Snow Mountain","Hot Island","Cold Island","Raid Lab","Law Raid","Ice Castle","Usopp's Island","Inscription Island","Forgotten Island","Ghost Ship"}
elseif Three_World then
	TeleportTable = {"Port Town","Hydra Island","Hydra Area","Yama/Enma Room","Tushita Door","Gaint Tree","Mansion","PineApple Village","Floating Turtle","Castle On The Sea","Dougeon","Haunted Castle","Ice Cream Island","Peanut Island","Cake Loaf","Chocolate Island","Candy Land"}
end
function ByPass(Position)
    game.Players.LocalPlayer.Character.Head:Destroy()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
Teleport:AddDropdown("Select Island",TeleportTable,function(vu)
	SelectIsland = vu
end)
Teleport:AddToggle("Teleport Island",_G.TeleportIsland,false,function(vu)
    _G.TeleportIsland = vu
if _G.TeleportIsland == true then
	repeat task.wait()
		if SelectIsland == "Start Island" then
			TP2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
		elseif SelectIsland == "Marine" then
			TP2(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
		elseif SelectIsland == "Middle Town" then
			TP2(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
		elseif SelectIsland == "Jungle" then
			TP2(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
		elseif SelectIsland == "Pirate Village" then
			TP2(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
		elseif SelectIsland == "Desert" then
			TP2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
		elseif SelectIsland == "Frozen Village" then
			TP2(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
		elseif SelectIsland == "MarineFord" then
			TP2(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
		elseif SelectIsland == "Colosseum" then
			TP2( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
		elseif SelectIsland == "Sky1" then
			TP2(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
		elseif SelectIsland == "Sky2" then  
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
		elseif SelectIsland == "Sky3" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
		elseif SelectIsland == "Prison" then
			TP2( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
		elseif SelectIsland == "Magma Village" then
			TP2(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
		elseif SelectIsland == "UnderWater City" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		elseif SelectIsland == "Fountain City" then
			TP2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
		elseif SelectIsland == "UnderWater Gate" then
			TP2(CFrame.new(3876.17333984375, 5.398951053619385, -1908.29638671875))
		elseif SelectIsland == "Mob Leader" then
			TP2(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
		--New_World
		elseif SelectIsland == "Cafe" then
			TP2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
		elseif SelectIsland == "Dock" then
			TP2(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
		elseif SelectIsland == "Dark Area" then
			TP2(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
		elseif SelectIsland == "Flamingo Mansion" then
			TP2(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
		elseif SelectIsland == "Flamingo Room" then
			TP2(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
		elseif SelectIsland == "Green Bit" then
			TP2( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
		elseif SelectIsland == "Factroy" then
			TP2(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
		elseif SelectIsland == "Colossuem" then
			TP2( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
		elseif SelectIsland == "Graveyard" then
			TP2(CFrame.new(-5376.267578125, 8.99490737915039, -712.3366088867188))
		elseif SelectIsland == "Sunflower Field" then
			TP2(CFrame.new(-1693.498046875, 198.6184539794922, -254.1299591064453))
		elseif SelectIsland == "Jeramy Mountain" then
			TP2(CFrame.new(2153.423583984375, 448.9566650390625, 721.7761840820312))
		elseif SelectIsland == "The Bridge" then
			TP2(CFrame.new(-1884.421875, 88.38383483886719, -1914.0904541015625))
		elseif SelectIsland == "Ghost Ship" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
		elseif SelectIsland == "Ice Castle" then
			TP2(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
		elseif SelectIsland == "Forgotten Island" then
			TP2(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
		elseif SelectIsland == "Usopp's Island" then
			TP2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
		elseif SelectIsland == "Snow Mountain" then
			TP2(CFrame.new(561.23834228516, 401.44781494141, -5297.14453125))
		elseif SelectIsland == "Hot Island" then
			TP2(CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875))
		elseif SelectIsland == "Cold Island" then
			TP2(CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375))
		elseif SelectIsland == "Raid Lab" then
			TP2(CFrame.new(-6436.58056640625, 250.6453094482422, -4499.71777343755))
		elseif SelectIsland == "Law Raid" then
			TP2(CFrame.new(-5565.9921875, 329.0404968261719, -5953.748046875))
		elseif SelectIsland == "Inscription Island" then
			TP2(CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531))
		elseif SelectIsland == "Great Tree" then
			TP2(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
		--Three World
		elseif SelectIsland == "Castle On The Sea" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.77246, 314.54129, -3151.95483, 0.359622836, -6.80840202e-08, -0.93309778, 4.08927434e-08, 1, -5.72052095e-08, 0.93309778, -1.75846271e-08, 0.359622836))
		elseif SelectIsland == "Port Town" then
			TP2(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
		elseif SelectIsland == "Hydra Island" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5745.28809, 610.449829, -239.348633, 0.999923825, -5.70820617e-08, -0.0123431049, 5.71043159e-08, 1, 1.45039625e-09, 0.0123431049, -2.1551303e-09, 0.999923825))
		elseif SelectIsland == "Hydra Area" then
			TP2(CFrame.new(5229.0166015625, 68.15036010742188, -1434.3436279296875))
		elseif SelectIsland == "Floating Turtle" then
			TP2(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
		elseif SelectIsland == "Yama/Enma Room" then
			TP2(CFrame.new(5226.80517578125, 6.565110683441162, 1109.474609375))
		elseif SelectIsland == "Tushita Door" then
			TP2(CFrame.new(5184.662109375, 141.78726196289062, 912.6285400390625))
		elseif SelectIsland == "Gaint Tree" then
			TP2(CFrame.new(2276.0859375, 25.87850189209, -6493.03125))
		elseif SelectIsland == "PineApple Village" then
			TP2(CFrame.new(-11172.950195313, 331.8049621582, -10151.033203125))
		elseif SelectIsland == "Dougeon" then
			TP2(CFrame.new(-5016.49365234375, 314.84393310546875, -2819.84033203125))
		elseif SelectIsland == "Ice Cream Island" then
			TP2(CFrame.new(-874.2578125, 65.8453369140625, -10911.232421875))
		elseif SelectIsland == "Cake Loaf" then
			TP2(CFrame.new(-2099.33, 66.9971, -12128.6))
		elseif SelectIsland == "Peanut Island" then
			TP2(CFrame.new(-2073.262451171875, 37.16134262084961, -10183.3271484375))
		elseif SelectIsland == "Haunted Castle" then
			TP2(CFrame.new(-9515.07324, 142.130615, 5537.58398))
		elseif SelectIsland == "Chocolate Island" then
			TP2(CFrame.new(101.124573, 24.7601147, -12080.1318, -0.636760354, -0, -0.771061838, -0, 1, -0, 0.771061718, 0, -0.636760414))
		elseif SelectIsland == "Candy Land" then
			TP2(CFrame.new(-1047.7470703125, 14.821270942687988, -14185.7939453125))
		elseif SelectIsland == "Mansion" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12549.7236328125, 337.1940612792969, -7470.36328125))
		end
	until not _G.TeleportIsland
end
StopTween(_G.TeleportIsland)
end)
Teleport:AddButton("Teleport To Island (Quicky)",function()
	if SelectIsland == "Start Island" then
		ByPass(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
	elseif SelectIsland == "Marine" then
		TP2(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
	elseif SelectIsland == "Middle Town" then
		ByPass(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
	elseif SelectIsland == "Jungle" then
		ByPass(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
	elseif SelectIsland == "Pirate Village" then
		ByPass(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
	elseif SelectIsland == "Desert" then
		ByPass(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
	elseif SelectIsland == "Frozen Village" then
		ByPass(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
	elseif SelectIsland == "MarineFord" then
		ByPass(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
	elseif SelectIsland == "Colosseum" then
		ByPass( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
	elseif SelectIsland == "Sky1" then
		ByPass(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
	elseif SelectIsland == "Sky2" then  
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
	elseif SelectIsland == "Sky3" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
	elseif SelectIsland == "Prison" then
		ByPass( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
	elseif SelectIsland == "Magma Village" then
		ByPass(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
	elseif SelectIsland == "UnderWater City" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
	elseif SelectIsland == "Fountain City" then
		ByPass(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
	elseif SelectIsland == "UnderWater Gate" then
		ByPass(CFrame.new(3876.17333984375, 5.398951053619385, -1908.29638671875))
	elseif SelectIsland == "Mob Leader" then
		TP2(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
	--New_World
	elseif SelectIsland == "Cafe" then
		ByPass(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
	elseif SelectIsland == "Dock" then
		ByPass(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
	elseif SelectIsland == "Dark Area" then
		TP2(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
	elseif SelectIsland == "Flamingo Mansion" then
		TP2(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
	elseif SelectIsland == "Flamingo Room" then
		TP2(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
	elseif SelectIsland == "Green Bit" then
		ByPass( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
	elseif SelectIsland == "Factroy" then
		TP2(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
	elseif SelectIsland == "Colossuem" then
		TP2( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
	elseif SelectIsland == "Graveyard" then
		ByPass(CFrame.new(-5376.267578125, 8.99490737915039, -712.3366088867188))
	elseif SelectIsland == "Sunflower Field" then
		TP2(CFrame.new(-1693.498046875, 198.6184539794922, -254.1299591064453))
	elseif SelectIsland == "Jeramy Mountain" then
		TP2(CFrame.new(2153.423583984375, 448.9566650390625, 721.7761840820312))
	elseif SelectIsland == "The Bridge" then
		TP2(CFrame.new(-1884.421875, 88.38383483886719, -1914.0904541015625))
	elseif SelectIsland == "Ghost Ship" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
	elseif SelectIsland == "Ice Castle" then
		ByPass(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
	elseif SelectIsland == "Forgotten Island" then
		ByPass(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
	elseif SelectIsland == "Usopp's Island" then
		TP2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
	elseif SelectIsland == "Snow Mountain" then
		ByPass(CFrame.new(561.23834228516, 401.44781494141, -5297.14453125))
	elseif SelectIsland == "Hot Island" then
		ByPass(CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875))
	elseif SelectIsland == "Cold Island" then
		ByPass(CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375))
	elseif SelectIsland == "Raid Lab" then
		TP2(CFrame.new(-6436.58056640625, 250.6453094482422, -4499.71777343755))
	elseif SelectIsland == "Law Raid" then
		TP2(CFrame.new(-5565.9921875, 329.0404968261719, -5953.748046875))
	elseif SelectIsland == "Inscription Island" then
		TP2(CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531))
	--Three World
	elseif SelectIsland == "Castle On The Sea" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.77246, 314.54129, -3151.95483, 0.359622836, -6.80840202e-08, -0.93309778, 4.08927434e-08, 1, -5.72052095e-08, 0.93309778, -1.75846271e-08, 0.359622836))
		TP2(CFrame.new(-4999.45361328125, 314.5412902832031, -3010.540283203125))
	elseif SelectIsland == "Port Town" then
		ByPass(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
	elseif SelectIsland == "Hydra Island" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5745.28809, 610.449829, -239.348633, 0.999923825, -5.70820617e-08, -0.0123431049, 5.71043159e-08, 1, 1.45039625e-09, 0.0123431049, -2.1551303e-09, 0.999923825))
	elseif SelectIsland == "Hydra Area" then
		TP2(CFrame.new(5229.0166015625, 68.15036010742188, -1434.3436279296875))
	elseif SelectIsland == "Floating Turtle" then
		TP2(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
	elseif SelectIsland == "Yama/Enma Room" then
		TP2(CFrame.new(5226.80517578125, 6.565110683441162, 1109.474609375))
	elseif SelectIsland == "Tushita Door" then
		TP2(CFrame.new(5184.662109375, 141.78726196289062, 912.6285400390625))
	elseif SelectIsland == "Gaint Tree" then
		ByPass(CFrame.new(2276.0859375, 25.87850189209, -6493.03125))
	elseif SelectIsland == "PineApple Village" then
		ByPass(CFrame.new(-11172.950195313, 331.8049621582, -10151.033203125))
	elseif SelectIsland == "Dougeon" then
		TP2(CFrame.new(-5016.49365234375, 314.84393310546875, -2819.84033203125))
	elseif SelectIsland == "Ice Cream Island" then
		ByPass(CFrame.new(-874.2578125, 65.8453369140625, -10911.232421875))
	elseif SelectIsland == "Cake Loaf" then
		ByPass(CFrame.new(-2099.33, 66.9971, -12128.6))
	elseif SelectIsland == "Peanut Island" then
		ByPass(CFrame.new(-2073.262451171875, 37.16134262084961, -10183.3271484375))
	elseif SelectIsland == "Haunted Castle" then
		ByPass(CFrame.new(-9515.07324, 142.130615, 5537.58398))
	elseif SelectIsland == "Chocolate Island" then
		ByPass(CFrame.new(101.124573, 24.7601147, -12080.1318, -0.636760354, -0, -0.771061838, -0, 1, -0, 0.771061718, 0, -0.636760414))
	elseif SelectIsland == "Candy Land" then
		ByPass(CFrame.new(-1047.7470703125, 14.821270942687988, -14185.7939453125))
	elseif SelectIsland == "Mansion" then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12549.7236328125, 337.1940612792969, -7470.36328125))
	end
end)
Teleport:AddButton("Stop All Tween",function(vu)
	TP2(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
	StopTween = vu
end)
RaidsName = {
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
Dungeon:AddSeperator("Dungeon")
local TimeRaid = Dungeon:AddLabel("Wait For Dungeon")
task.spawn(function()
	pcall(function()
		while task.wait() do
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
				TimeRaid:SetText(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
			else
				TimeRaid:SetText("Wait For Dungeon")
			end
		end
	end)
end)
Dungeon:AddDropdown("Select Raids",RaidsName,function(vu)
	SelectDungeon = vu
end)
Dungeon:AddToggle("Kill Aura",_G.KillAura,function(vu)
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
Dungeon:AddToggle("Next Island",_G.NextIsland,false,function(vu)
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
Dungeon:AddToggle("Auto Awaken Skill",_G.Auto_Awakener,false,function(vu)
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
Dungeon:AddToggle("Auto Buy Chips Select",_G.AutoBuyChipsSelect,function(vu)
    _G.AutoBuyChipsSelect = vu
end)
task.spawn(function()
    while task.wait() do
        if _G.AutoBuyChipsSelect then
            pcall(function()
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = SelectDungeon
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
Dungeon:AddToggle("Auto Start Raids",_G.Auto_Start_Dungeon,function(vu)
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
Dungeon:AddButton("Buy Chip Select",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectDungeon)
end)
Dungeon:AddButton("Start Raid",function()
    if New_World then
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif Three_World then
        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
end)
Misc:AddSeperator("[ Fruits ]")
Misc:AddToggle("Esp Fruit",function(vu)
	DevilFruitESP = vu
	while DevilFruitESP do wait()
		UpdateBfEsp() 
	end
		end)
Misc:AddToggle("Bring Fruit",_G.BringFruit,false,function(vu)
    _G.BringFruit = vu
	_G.BringFruit_P = vu
end)
task.spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringFruit or _G.BringFruit_P then
                    for i,v6 in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v6:IsA ("Tool") and (v6.Handle.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 13000 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v6.Handle.CFrame
                            v6.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end)
Misc:AddSeperator("[ User Interface ]")
Misc:AddButton("Open Fruit Inventory",function()
	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)
Misc:AddButton("Open Fruit Awaken",function()
	game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
end)
Misc:AddButton("Open Fruit Store",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)
Misc:AddButton("Open Color Haki",function()
	game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)
Misc:AddButton("Open Title Name",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)
Misc:AddToggle("Inf Ability",true,function(vu)
    _G.InfAbility = vu
end)
if vu == false then
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
end
task.spawn(function()
while task.wait() do
	if _G.InfAbility then
		InfAb()
	end
end
end)
function InfAb()
	if _G.InfAbility then
		if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			local inf = Instance.new("ParticleEmitter")
			inf.Acceleration = Vector3.new(0,0,0)
			inf.Archivable = true
			inf.Drag = 20
			inf.EmissionDirection = Enum.NormalId.Top
			inf.Enabled = true
			inf.Lifetime = NumberRange.new(0,0)
			inf.LightInfluence = 0
			inf.LockedToPart = true
			inf.Name = "Agility"
			inf.Rate = 500
			local numberKeypoints2 = {
				NumberSequenceKeypoint.new(0, 0);
				NumberSequenceKeypoint.new(1, 4); 
			}
			inf.Size = NumberSequence.new(numberKeypoints2)
			inf.RotSpeed = NumberRange.new(9999, 99999)
			inf.Rotation = NumberRange.new(0, 0)
			inf.Speed = NumberRange.new(30, 30)
			inf.SpreadAngle = Vector2.new(0,0,0,0)
			inf.Texture = ""
			inf.VelocityInheritance = 0
			inf.ZOffset = 2
			inf.Transparency = NumberSequence.new(0)
			inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
			inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		end
	else
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
		end
	end
	end
	Misc:AddSeperator("「 Melee 」")
	Misc:AddButton("Buy Superhuman",function()
		local args = {
			[1] = "BuySuperhuman"
		}
	
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	
	Misc:AddButton("Buy Death Step",function()
		local args = {
			[1] = "BuyDeathStep"
		}
	
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	
	Misc:AddButton("Buy Shakman Karate",function()
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
	Misc:AddButton("Buy Electric Claw",function()
		local args = {
			[1] = "BuyElectricClaw"
			}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	
	Misc:AddButton("Buy Dragon Talon",function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
			end)
	Misc:AddButton("Buy God Human",function()
				local args = {
				[1] = "BuyGodhuman"
			}
			
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
			local placeId = game.PlaceId;
			if placeId == 2753915549 then
			   OldWorld = true;
			elseif placeId == 4442272183 then
			   NewWorld = true;
			elseif placeId == 7449423635 then
			   Three = true;
			   do
				  local count = 0;
				  for i,v in pairs(game:GetService("Workspace").Map.Turtle:GetChildren()) do
					 if v.Name == "Model" and #v:GetChildren() >= 40 and v:FindFirstChild("Meshes/Plank7") and i > 20 then
						v:Destroy()
						count = count + 1
						if count > 2 then
						   break
						end
					 end
				  end
			   end
			end
			function CheckQuest()
			   local MyLevel = game.Players.LocalPlayer.Data.Level.Value
			   if OldWorld then
				  if MyLevel == 1 or MyLevel <= 9 then -- Bandit
				   Ms = "Bandit [Lv. 5]"
				   NaemQuest = "BanditQuest1"
				   LevelQuest = 1
				   NameMon = "Bandit"
				   CFrameQuestuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
				   CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516, -0.929782331, 6.60215846e-08, -0.368109822, 3.9077392e-08, 1, 8.06501603e-08, 0.368109822, 6.06023249e-08, -0.929782331)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
				   magbring = 400
				   Ms = "Monkey [Lv. 14]"
				   NaemQuest = "JungleQuest"
				   LevelQuest = 1
				   NameMon = "Monkey"
				   CFrameQuestuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
				   CFrameMon = CFrame.new(-1502.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
				   magbring = 240
				   Ms = "Gorilla [Lv. 20]"
				   NaemQuest = "JungleQuest"
				   LevelQuest = 2
				   NameMon = "Gorilla"
				   CFrameQuestuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
				   CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
				   Dis = 150
				   Ms = "Pirate [Lv. 35]"
				   NaemQuest = "BuggyQuest1"
				   LevelQuest = 1
				   NameMon = "Pirate"
				   CFrameQuestuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
				   CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452, -0.966492832, -6.91238853e-08, 0.25669381, -5.21195496e-08, 1, 7.3047012e-08, -0.25669381, 5.72206496e-08, -0.966492832)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
				   Dis = 150
				   Ms = "Brute [Lv. 45]"
				   NaemQuest = "BuggyQuest1"
				   LevelQuest = 2
				   NameMon = "Brute"
				   CFrameQuestuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
				   CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333, -0.978175163, -1.53222057e-08, 0.207781896, -3.33316912e-08, 1, -8.31738873e-08, -0.207781896, -8.82843523e-08, -0.978175163)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
				   Ms = "Desert Bandit [Lv. 60]"
				   NaemQuest = "DesertQuest"
				   LevelQuest = 1
				   NameMon = "Desert Bandit"
				   CFrameQuestuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
				   CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
				   Ms = "Desert Officer [Lv. 70]"
				   NaemQuest = "DesertQuest"
				   LevelQuest = 2
				   NameMon = "Desert Officer"
				   CFrameQuestuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
				   CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426, 0.135744005, -6.44280718e-08, -0.990743816, 4.35738308e-08, 1, -5.90598574e-08, 0.990743816, -3.51534837e-08, 0.135744005)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
				   Ms = "Snow Bandit [Lv. 90]"
				   NaemQuest = "SnowQuest"
				   LevelQuest = 1
				   NameMon = "Snow Bandits"
				   CFrameQuestuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
				   CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
				   Ms = "Snowman [Lv. 100]"
				   NaemQuest = "SnowQuest"
				   LevelQuest = 2
				   NameMon = "Snowman"
				   CFrameQuestuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
				   CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
				   Ms = "Chief Petty Officer [Lv. 120]"
				   NaemQuest = "MarineQuest2"
				   LevelQuest = 1
				   NameMon = "Chief Petty Officer"
				   CFrameQuestuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
				   CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
				   Ms = "Sky Bandit [Lv. 150]"
				   NaemQuest = "SkyQuest"
				   LevelQuest = 1
				   NameMon = "Sky Bandit"
				   CFrameQuestuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
				   CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311236e-08, -0.101116329, -9.10836206e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
				   end
			   elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
				   Ms = "Dark Master [Lv. 175]"
				   NaemQuest = "SkyQuest"
				   LevelQuest = 2
				   NameMon = "Dark Master"
				   CFrameQuestuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
				   CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456, -0.925375521, 1.12086873e-08, 0.379051805, -1.05115507e-08, 1, -5.52320891e-08, -0.379051805, -5.50948407e-08, -0.925375521)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
				   end
			   elseif MyLevel == 190 or MyLevel <= 209 then -- Dark Master
				   Ms = "Prisoner [Lv. 190]"
				   NaemQuest = "PrisonerQuest"
				   LevelQuest = 1
				   NameMon = "Prisoner"
				   CFrameQuestuest = CFrame.new(5310.61, 0.350015, 474.947)
				   CFrameMon = CFrame.new(4977.88525390625, 72.67780303955078, 498.108642578125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 210 or MyLevel <= 249 then -- Dark Master
				   Ms = "Dangerous Prisoner [Lv. 210]"
				   NaemQuest = "PrisonerQuest"
				   LevelQuest = 2
				   NameMon = "Dangerous Prisoner"
				   CFrameQuestuest = CFrame.new(5310.61, 0.350015, 474.947)
				   CFrameMon = CFrame.new(5656.42333984375, 72.67793273925781, 866.1055908203125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
				   Ms = "Toga Warrior [Lv. 250]"
				   NaemQuest = "ColosseumQuest"
				   LevelQuest = 1
				   NameMon = "Toga Warrior"
				   CFrameQuestuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
				   CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
				   Ms = "Gladiator [Lv. 275]"
				   NaemQuest = "ColosseumQuest"
				   LevelQuest = 2
				   NameMon = "Gladiato"
				   CFrameQuestuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
				   CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
				   Ms = "Military Soldier [Lv. 300]"
				   NaemQuest = "MagmaQuest"
				   LevelQuest = 1
				   NameMon = "Military Soldier"
				   CFrameQuestuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
				   CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 325 or MyLevel <= 374 then -- Military Spy
				   FM = false
				   Ms = "Military Spy [Lv. 325]"
				   NaemQuest = "MagmaQuest"
				   LevelQuest = 2
				   NameMon = "Military Spy"
				   CFrameQuestuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
				   CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
				   FM = true
				   Ms = "Fishman Warrior [Lv. 375]"
				   NaemQuest = "FishmanQuest"
				   LevelQuest = 1
				   NameMon = "Fishman Warrior"
				   CFrameQuestuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
				   CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				   end
			   elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
				   FM = true
				   Ms = "Fishman Commando [Lv. 400]"
				   NaemQuest = "FishmanQuest"
				   LevelQuest = 2
				   NameMon = "Fishman Commando"
				   CFrameQuestuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
				   CFrameMon = CFrame.new(61885.5039, 18.4828243, 1504.17896, 0.577502489, 0, -0.816389024, -0, 1.00000012, -0, 0.816389024, 0, 0.577502489)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				   end
			   elseif MyLevel == 450 or MyLevel <= 474 then -- God's Guards
				   FM = false
				   Ms = "God's Guard [Lv. 450]"
				   NaemQuest = "SkyExp1Quest"
				   LevelQuest = 1
				   NameMon = "God's Guards"
				   CFrameQuestuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
				   CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.92542, -0.93441087, -6.77488776e-09, -0.356197298, 1.12145182e-08, 1, -4.84390199e-08, 0.356197298, -4.92565206e-08, -0.93441087)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
				   end
			   elseif MyLevel == 475 or MyLevel <= 524 then -- Shandas
				   sky = false
				   Ms = "Shanda [Lv. 475]"
				   NaemQuest = "SkyExp1Quest"
				   LevelQuest = 2
				   NameMon = "Shandas"
				   CFrameQuestuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
				   CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509, 0.150056243, 1.79768236e-08, -0.988677442, 6.67798661e-09, 1, 1.91962481e-08, 0.988677442, -9.48289181e-09, 0.150056243)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
				   end
			   elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
				   sky = true
				   Ms = "Royal Squad [Lv. 525]"
				   NaemQuest = "SkyExp2Quest"
				   LevelQuest = 1
				   NameMon = "Royal Squad"
				   CFrameQuestuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
				   CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729, 0.561947823, 7.69527464e-09, -0.827172697, -4.24974544e-09, 1, 6.41599973e-09, 0.827172697, -9.01838604e-11, 0.561947823)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
				   Dis = 240
				   sky = true
				   Ms = "Royal Soldier [Lv. 550]"
				   NaemQuest = "SkyExp2Quest"
				   LevelQuest = 2
				   NameMon = "Royal Soldier"
				   CFrameQuestuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
				   CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351, 0.998389959, 2.28686137e-09, -0.0567218624, 1.99431383e-09, 1, 7.54200258e-08, 0.0567218624, -7.54117195e-08, 0.998389959)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
				   Dis = 240
				   sky = false
				   Ms = "Galley Pirate [Lv. 625]"
				   NaemQuest = "FountainQuest"
				   LevelQuest = 1
				   NameMon = "Galley Pirate"
				   CFrameQuestuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
				   CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095, -0.992138803, -2.11610267e-08, -0.125142589, -1.34249509e-08, 1, -6.26613996e-08, 0.125142589, -6.04887518e-08, -0.992138803)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel >= 650 then -- Galley Captain
				   Dis = 240
				   Ms = "Galley Captain [Lv. 650]"
				   NaemQuest = "FountainQuest"
				   LevelQuest = 2
				   NameMon = "Galley Captain"
				   CFrameQuestuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
				   CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506, -0.996873081, 2.12391046e-06, -0.0790185928, 2.16989656e-06, 1, -4.96097414e-07, 0.0790185928, -6.66008248e-07, -0.996873081)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   end
		   elseif NewWorld then
			   local MyLevel = game.Players.LocalPlayer.Data.Level.Value
			   Dis = 240
			   if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
				   Ms = "Raider [Lv. 700]"
				   NaemQuest = "Area1Quest"
				   LevelQuest = 1
				   NameMon = "Raider"
				   CFrameQuestuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
				   CFrameMon = CFrame.new(-217.138626, 39.2450829, 2393.54468, 0.146848485, 0, -0.989159107, 0, 1, 0, 0.989159107, 0, 0.146848485)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
				   Ms = "Mercenary [Lv. 725]"
				   NaemQuest = "Area1Quest"
				   LevelQuest = 2
				   NameMon = "Mercenary"
				   CFrameQuestuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
				   CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344, -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
				   Ms = "Swan Pirate [Lv. 775]"
				   NaemQuest = "Area2Quest"
				   LevelQuest = 1
				   NameMon = "Swan Pirate"
				   CFrameQuestuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
				   CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
				   Ms = "Factory Staff [Lv. 800]"
				   NaemQuest = "Area2Quest"
				   LevelQuest = 2
				   NameMon = "Factory Staff"
				   CFrameQuestuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
				   CFrameMon = CFrame.new(296.786499, 72.9948196, -57.1298141, -0.876037002, -5.32364979e-08, 0.482243896, -3.87658332e-08, 1, 3.99718729e-08, -0.482243896, 1.63222538e-08, -0.876037002)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
				   Ms = "Marine Lieutenant [Lv. 875]"
				   NaemQuest = "MarineQuest3"
				   LevelQuest = 1
				   NameMon = "Marine Lieutenant"
				   CFrameQuestuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
				   CFrameMon = CFrame.new(-2913.26367, 73.0011826, -2971.64282, 0.910507619, 0, 0.413492233, 0, 1.00000012, 0, -0.413492233, 0, 0.910507619)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
				   Ms = "Marine Captain [Lv. 900]"
				   NaemQuest = "MarineQuest3"
				   LevelQuest = 2
				   NameMon = "Marine Captain"
				   CFrameQuestuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
				   CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333, -0.971402287, 1.06502087e-08, 0.237439692, 3.68856199e-08, 1, 1.06050372e-07, -0.237439692, 1.11775684e-07, -0.971402287)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
				   Ms = "Zombie [Lv. 950]"
				   NaemQuest = "ZombieQuest"
				   LevelQuest = 1
				   NameMon = "Zombie"
				   CFrameQuestuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
				   CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039, -0.992770672, 6.77618939e-09, 0.120025545, 1.65461245e-08, 1, 8.04023372e-08, -0.120025545, 8.18070234e-08, -0.992770672)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
				   Ms = "Vampire [Lv. 975]"
				   NaemQuest = "ZombieQuest"
				   LevelQuest = 2
				   NameMon = "Vampire"
				   CFrameQuestuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
				   CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
				   Ms = "Snow Trooper [Lv. 1000]"
				   NaemQuest = "SnowMountainQuest"
				   LevelQuest = 1
				   NameMon = "Snow Trooper"
				   CFrameQuestuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
				   CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958, -0.999524176, 0, 0.0308452044, 0, 1, -0, -0.0308452044, 0, -0.999524176)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
				   Ms = "Winter Warrior [Lv. 1050]"
				   NaemQuest = "SnowMountainQuest"
				   LevelQuest = 2
				   NameMon = "Winter Warrior"
				   CFrameQuestuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
				   CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148, 0.473996818, 2.56845354e-08, 0.880526543, -5.62456428e-08, 1, 1.10811016e-09, -0.880526543, -5.00510211e-08, 0.473996818)
			   
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
				   Ms = "Lab Subordinate [Lv. 1100]"
				   NaemQuest = "IceSideQuest"
				   LevelQuest = 1
				   NameMon = "Lab Subordinate"
				   CFrameQuestuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
				   CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
				   Ms = "Horned Warrior [Lv. 1125]"
				   NaemQuest = "IceSideQuest"
				   LevelQuest = 2
				   NameMon = "Horned Warrior"
				   CFrameQuestuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
				   CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574, -0.964845479, 8.65926566e-08, -0.262817472, 3.98261392e-07, 1, -1.13260398e-06, 0.262817472, -1.19745812e-06, -0.964845479)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
				   Ms = "Magma Ninja [Lv. 1175]"
				   NaemQuest = "FireSideQuest"
				   LevelQuest = 1
				   NameMon = "Magma Ninja"
				   CFrameQuestuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
				   CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855, -0.885073781, 0, -0.465450764, 0, 1.00000012, -0, 0.465450764, 0, -0.885073781)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1200 or MyLevel <= 1249 then -- Lava Pirate [Lv. 1200]
				   Ms = "Lava Pirate [Lv. 1200]"
				   NaemQuest = "FireSideQuest"
				   LevelQuest = 2
				   NameMon = "Lava Pirate"
				   CFrameQuestuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
				   CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1250 or MyLevel <= 1274 then -- Ship Deckhand [Lv. 1250]
				   Ms = "Ship Deckhand [Lv. 1250]"
				   NaemQuest = "ShipQuest1"
				   LevelQuest = 1
				   NameMon = "Ship Deckhand"
				   CFrameQuestuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
				   CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				   end
			   elseif MyLevel == 1275 or MyLevel <= 1299 then -- Ship Engineer [Lv. 1275]
				   Ms = "Ship Engineer [Lv. 1275]"
				   NaemQuest = "ShipQuest1"
				   LevelQuest = 2
				   NameMon = "Ship Engineer"
				   CFrameQuestuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
				   CFrameMon = CFrame.new(916.666504, 44.0920448, 32917.207, -0.99746871, -4.85034697e-08, -0.0711069331, -4.8925461e-08, 1, 4.19294288e-09, 0.0711069331, 7.66126895e-09, -0.99746871)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				   end
			   elseif MyLevel == 1300 or MyLevel <= 1324 then -- Ship Steward [Lv. 1300]
				   Ms = "Ship Steward [Lv. 1300]"
				   NaemQuest = "ShipQuest2"
				   LevelQuest = 1
				   NameMon = "Ship Steward"
				   CFrameQuestuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
				   CFrameMon = CFrame.new(918.743286, 129.591064, 33443.4609, -0.999792814, -1.7070947e-07, -0.020350717, -1.72559169e-07, 1, 8.91351277e-08, 0.020350717, 9.2628369e-08, -0.999792814)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				   end
			   elseif MyLevel == 1325 or MyLevel <= 1349 then -- Ship Officer [Lv. 1325]
				   Ms = "Ship Officer [Lv. 1325]"
				   NaemQuest = "ShipQuest2"
				   LevelQuest = 2
				   NameMon = "Ship Officer"
				   CFrameQuestuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
				   CFrameMon = CFrame.new(786.051941, 181.474106, 33303.2969, 0.999285698, -5.32193063e-08, 0.0377905183, 5.68968588e-08, 1, -9.62386864e-08, -0.0377905183, 9.83201005e-08, 0.999285698)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				   end
			   elseif MyLevel == 1350 or MyLevel <= 1374 then -- Arctic Warrior [Lv. 1350]
				   Ms = "Arctic Warrior [Lv. 1350]"
				   NaemQuest = "FrostQuest"
				   LevelQuest = 1
				   NameMon = "Arctic Warrior"
				   CFrameQuestuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
				   CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314, 0.702747107, -1.53454167e-07, -0.711440146, -1.08168464e-07, 1, -3.22542007e-07, 0.711440146, 3.03620908e-07, 0.702747107)
				   if _G.Auto_Farm_Level and (CFrameQuestuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
				   end
			   elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
				   Ms = "Snow Lurker [Lv. 1375]"
				   NaemQuest = "FrostQuest"
				   LevelQuest = 2
				   NameMon = "Snow Lurker"
				   CFrameQuestuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
				   CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
				   Ms = "Sea Soldier [Lv. 1425]"
				   NaemQuest = "ForgottenQuest"
				   LevelQuest = 1
				   NameMon = "Sea Soldier"
				   CFrameQuestuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
				   CFrameMon = CFrame.new(-3029.78467, 66.944252, -9777.38184, -0.998552859, 1.09555076e-08, 0.0537791774, 7.79564235e-09, 1, -5.89660658e-08, -0.0537791774, -5.84614881e-08, -0.998552859)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
				   Ms = "Water Fighter [Lv. 1450]"
				   NaemQuest = "ForgottenQuest"
				   LevelQuest = 2
				   NameMon = "Water Fighter"
				   CFrameQuestuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
				   CFrameMon = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869, -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   end
		   else
			   local MyLevel =  game.Players.LocalPlayer.Data.Level.Value
			   Dis = 240
			   if MyLevel == 1500 or MyLevel <= 1524 then
				   Ms = "Pirate Millionaire [Lv. 1500]"
				   NaemQuest = "PiratePortQuest"
				   LevelQuest = 1
				   NameMon = "Pirate Millionaire"
				   CFrameQuestuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
				   CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1525 or MyLevel <= 1574 then
				   Ms = "Pistol Billionaire [Lv. 1525]"
				   NaemQuest = "PiratePortQuest"
				   LevelQuest = 2
				   NameMon = "Pistol Billionaire"
				   CFrameQuestuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
				   CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1575 or MyLevel <= 1599 then
				   Ms = "Dragon Crew Warrior [Lv. 1575]"
				   NaemQuest = "AmazonQuest"
				   LevelQuest = 1
				   NameMon = "Dragon Crew Warrior"
				   CFrameQuestuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
				   CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1600 or MyLevel <= 1624 then
				   Ms = "Dragon Crew Archer [Lv. 1600]"
				   NaemQuest = "AmazonQuest"
				   LevelQuest = 2
				   NameMon = "Dragon Crew Archer"
				   CFrameQuestuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
				   CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1625 or MyLevel <= 1649 then
				   Ms = "Female Islander [Lv. 1625]"
				   NaemQuest = "AmazonQuest2"
				   LevelQuest = 1
				   NameMon = "Female Islander"
				   CFrameQuestuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				   CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1650 or MyLevel <= 1699 then
				   Ms = "Giant Islander [Lv. 1650]"
				   NaemQuest = "AmazonQuest2"
				   LevelQuest = 2
				   NameMon = "Giant Islander"
				   CFrameQuestuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				   CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1700 or MyLevel <= 1724 then
				   Ms = "Marine Commodore [Lv. 1700]"
				   NaemQuest = "MarineTreeIsland"
				   LevelQuest = 1
				   NameMon = "Marine Commodore"
				   CFrameQuestuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
				   CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1725 or MyLevel <= 1774 then
				   Ms = "Marine Rear Admiral [Lv. 1725]"
				   NaemQuest = "MarineTreeIsland"
				   LevelQuest = 2
				   NameMon = "Marine Rear Admiral"
				   CFrameQuestuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
				   CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1775 or MyLevel <= 1799 then
				   Ms = "Fishman Raider [Lv. 1775]"
				   NaemQuest = "DeepForestIsland3"
				   LevelQuest = 1
				   NameMon = "Fishman Raider"
				   CFrameQuestuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				   CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1800 or MyLevel <= 1824 then
				   Ms = "Fishman Captain [Lv. 1800]"
				   NaemQuest = "DeepForestIsland3"
				   LevelQuest = 2
				   NameMon = "Fishman Captain"
				   CFrameQuestuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				   CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1825 or MyLevel <= 1849 then
				   Ms = "Forest Pirate [Lv. 1825]"
				   NaemQuest = "DeepForestIsland"
				   LevelQuest = 1
				   NameMon = "Forest Pirate"
				   CFrameQuestuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
				   CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1850 or MyLevel <= 1899 then
				   Ms = "Mythological Pirate [Lv. 1850]"
				   NaemQuest = "DeepForestIsland"
				   LevelQuest = 2
				   NameMon = "Mythological Pirate"
				   CFrameQuestuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
				   CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1900 or MyLevel <= 1924 then
				   Ms = "Jungle Pirate [Lv. 1900]"
				   NaemQuest = "DeepForestIsland2"
				   LevelQuest = 1
				   NameMon = "Jungle Pirate"
				   CFrameQuestuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
				   CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1925 or MyLevel <= 1974 then
				   Ms = "Musketeer Pirate [Lv. 1925]"
				   NaemQuest = "DeepForestIsland2"
				   LevelQuest = 2
				   NameMon = "Musketeer Pirate"
				   CFrameQuestuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
				   CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 1975 or MyLevel <= 1999 then
				   Ms = "Reborn Skeleton [Lv. 1975]"
				   NaemQuest = "HauntedQuest1"
				   LevelQuest = 1
				   NameMon = "Reborn Skeleton"
				   CFrameQuestuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				   CFrameMon = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2000 or MyLevel <= 2024 then
				   Ms = "Living Zombie [Lv. 2000]"
				   NaemQuest = "HauntedQuest1"
				   LevelQuest = 2
				   NameMon = "Living Zombie"
				   CFrameQuestuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				   CFrameMon = CFrame.new(-10093.930664063, 237.38233947754, 6180.5654296875)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2025 or MyLevel <= 2049 then
				   Ms = "Demonic Soul [Lv. 2025]"
				   NaemQuest = "HauntedQuest2"
				   LevelQuest = 1
				   NameMon = "Demonic Soul"
				   CFrameQuestuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
				   CFrameMon = CFrame.new(-9503.9921875, 272.1305847167969, 6250.5703125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2050 or MyLevel <= 2074 then
				   Ms = "Posessed Mummy [Lv. 2050]" 
				   NaemQuest = "HauntedQuest2"
				   LevelQuest = 2
				   NameMon = "Posessed Mummy"
				   CFrameQuestuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
				   CFrameMon = CFrame.new(-9589.93848, 4.85058546, 6190.27197)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2075 or MyLevel <= 2099 then
				   Ms = "Peanut Scout [Lv. 2075]"
				   NaemQuest = "NutsIslandQuest"
				   LevelQuest = 1
				   NameMon = "Peanut Scout"
				   CFrameQuestuest = CFrame.new(-2075.9643554688, 38.129207611084, -10172.815429688)
				   CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2100 or MyLevel <= 2124 then
				   Ms = "Peanut President [Lv. 2100]"
				   NaemQuest = "NutsIslandQuest"
				   LevelQuest = 2
				   NameMon = "Peanut President"
				   CFrameQuestuest = CFrame.new(-2075.9643554688, 38.129207611084, -10172.815429688)
				   CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2125 or MyLevel <= 2149 then
				   Ms = "Ice Cream Chef [Lv. 2125]"
				   NaemQuest = "IceCreamIslandQuest"
				   LevelQuest = 1
				   NameMon = "Ice Cream Chef"
				   CFrameQuestuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
				   CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2150 or MyLevel <= 2199 then
				   Ms = "Ice Cream Commander [Lv. 2150]"
				   NaemQuest = "IceCreamIslandQuest"
				   LevelQuest = 2
				   NameMon = "Ice Cream Commander"
				   CFrameQuestuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
				   CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2200 or MyLevel <= 2224 then
				   Ms = "Cookie Crafter [Lv. 2200]"
				   NaemQuest = "CakeQuest1"
				   LevelQuest = 1
				   NameMon = "Cookie Crafter"
				   CFrameQuestuest = CFrame.new(-2022.3, 36.9276, -12031)
				   CFrameMon = CFrame.new(-2280.569091796875, 89.83930206298828, -12041.4326171875)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2225 or MyLevel <= 2249 then
				   Ms = "Cake Guard [Lv. 2225]"
				   NaemQuest = "CakeQuest1"
				   LevelQuest = 2
				   NameMon = "Cake Guard"
				   CFrameQuestuest = CFrame.new(-2022.3, 36.9276, -12031)
				   CFrameMon = CFrame.new(-1621.9512939453125, 195.68287658691406, -12281.0908203125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2250 or MyLevel <= 2274 then
				   Ms = "Baking Staff [Lv. 2250]"
				   NaemQuest = "CakeQuest2"
				   LevelQuest = 1
				   NameMon = "Baking Staff"
				   CFrameQuestuest = CFrame.new(-1928.32, 37.7297, -12840.6)
				   CFrameMon = CFrame.new(-1912.928955078125, 113.134033203125, -12990.53515625)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2275 or MyLevel <= 2299 then
				   Ms = "Head Baker [Lv. 2275]"
				   NaemQuest = "CakeQuest2"
				   LevelQuest = 2
				   NameMon = "Head Baker"
				   CFrameQuestuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
				   CFrameMon = CFrame.new(-2203.302490234375, 109.90937042236328, -12788.7333984375)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2300 or MyLevel <= 2324 then
				   Ms = "Cocoa Warrior [Lv. 2300]"
				   NaemQuest = "ChocQuest1"
				   LevelQuest = 1
				   NameMon = "Cocoa Warriors"
				   CFrameQuestuest = CFrame.new(231.75, 23.9003, -12200.3)
				   CFrameMon = CFrame.new(89.75547790527344, 73.66654968261719, -12315.4609375)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2325 or MyLevel <= 2349 then
				   Ms = "Chocolate Bar Battler [Lv. 2325]"
				   NaemQuest = "ChocQuest1"
				   LevelQuest = 2
				   NameMon = "Chocolate Bar Battler"
				   CFrameQuestuest = CFrame.new(231.75, 23.9003, -12200.3)
				   CFrameMon = CFrame.new(614.6710205078125, 81.79888153076172, -12578.4521484375)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2350 or MyLevel <= 2374 then
				   Ms = "Sweet Thief [Lv. 2350]"
				   NaemQuest = "ChocQuest2"
				   LevelQuest = 1
				   NameMon = "Sweet Thiefs"
				   CFrameQuestuest = CFrame.new(147.222900390625, 24.819623947143555, -12775.2890625)
				   CFrameMon = CFrame.new(-92.28578186035156, 132.29556274414062, -12655.9111328125)
			   if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
			   elseif MyLevel == 2350 or MyLevel <= 2374 then
				   Ms = "Candy Rebel [Lv. 2375]"
				   NaemQuest = "ChocQuest2"
				   LevelQuest = 2
				   NameMon = "Candy Rebel"
				   CFrameQuestuest = CFrame.new(147.222900390625, 24.819623947143555, -12775.2890625)
				   CFrameMon = CFrame.new(66.337265, 27.430994, -12946.5674, -0.825375617, -7.78806708e-08, -0.564584017, -5.46535652e-08, 1, -5.80444244e-08, 0.564584017, -1.70519225e-08, -0.825375617)
			  if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				   game.Players.LocalPlayer.Character.Head:Destroy()
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				   wait(1)
				   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			   end
		   elseif MyLevel == 2400 or MyLevel <= 2425 then
			   Ms = "Candy Pirate [Lv. 2400]"
			   NaemQuest = "CandyQuest1"
			   LevelQuest = 1
			   NameMon = "Candy Pirate"
			   CFrameQuestuest = CFrame.new(-1151.48987, 16.1422901, -14445.6904, -0.316594511, -6.85698254e-08, -0.948560953, -2.05343067e-08, 1, -6.54346692e-08, 0.948560953, -1.23821675e-09, -0.316594511)
			   CFrameMon = CFrame.new(-1408.46521, 16.1423531, -14552.2041, 0.90175873, -8.17216943e-08, -0.432239741, 7.81264475e-08, 1, -2.60746162e-08, 0.432239741, -1.02563433e-08, 0.90175873)
		  if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
			   game.Players.LocalPlayer.Character.Head:Destroy()
			   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
			   wait(1)
			   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
		   end
	   elseif MyLevel == 2425 or MyLevel <= 2450 then
		   Ms = "Snow Demon [Lv. 2425]"
		   NaemQuest = "CandyQuest1"
		   LevelQuest = 2
		   NameMon = "Snow Demon"
		   CFrameQuestuest = CFrame.new(-1151.48987, 16.1422901, -14445.6904, -0.316594511, -6.85698254e-08, -0.948560953, -2.05343067e-08, 1, -6.54346692e-08, 0.948560953, -1.23821675e-09, -0.316594511)
		   CFrameMon = CFrame.new(-777.070862, 23.5809536, -14453.0078, 0.33384338, 0, -0.942628562, 0, 1, 0, 0.942628562, 0, 0.33384338)
	  if _G.Auto_Farm_Level and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
		   game.Players.LocalPlayer.Character.Head:Destroy()
		   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
		   wait(1)
		   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
	   end
		   end
	   end
   end
   function CheckBossQuest()
	   if _G.Select_Boss == "Saber Expert [Lv. 200] [Boss]" then
		   MsBoss = "Saber Expert [Lv. 200] [Boss]"
		   NameBoss = "Saber Expert"
		   CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
	   elseif _G.Select_Boss == "The Saw [Lv. 100] [Boss]" then
		   MsBoss = "The Saw [Lv. 100] [Boss]"
		   NameBoss = "The Saw"
		   CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
	   elseif _G.Select_Boss == "Greybeard [Lv. 750] [Raid Boss]" then
		   MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
		   NameBoss = "Greybeard"
		   CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
	   elseif _G.Select_Boss == "The Gorilla King [Lv. 25] [Boss]" then
		   MsBoss = "The Gorilla King [Lv. 25] [Boss]"
		   NameBoss = "The Gorilla King"
		   NameQuestBoss = "JungleQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
		   CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
	   elseif _G.Select_Boss == "Bobby [Lv. 55] [Boss]" then
		   MsBoss = "Bobby [Lv. 55] [Boss]"
		   NameBoss = "Bobby"
		   NameQuestBoss = "BuggyQuest1"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
		   CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
	   elseif _G.Select_Boss == "Yeti [Lv. 110] [Boss]" then
		   MsBoss = "Yeti [Lv. 110] [Boss]"
		   NameBoss = "Yeti"
		   NameQuestBoss = "SnowQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
		   CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
	   elseif _G.Select_Boss == "Mob Leader [Lv. 120] [Boss]" then
		   MsBoss = "Mob Leader [Lv. 120] [Boss]"
		   NameBoss = "Mob Leader"
		   CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
	   elseif _G.Select_Boss == "Vice Admiral [Lv. 130] [Boss]" then
		   MsBoss = "Vice Admiral [Lv. 130] [Boss]"
		   NameBoss = "Vice Admiral"
		   NameQuestBoss = "MarineQuest2"
		   LevelQuestBoss = 2
		   CFrameQuestuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
		   CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
	   elseif _G.Select_Boss == "Warden [Lv. 175] [Boss]" then
		   MsBoss = "Warden [Lv. 175] [Boss]"
		   NameBoss = "Warden"
		   NameQuestBoss = "ImpelQuest"
		   LevelQuestBoss = 1
		   CFrameQuestuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		   CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	   elseif _G.Select_Boss == "Chief Warden [Lv. 200] [Boss]" then
		   MsBoss = "Chief Warden [Lv. 200] [Boss]"
		   NameBoss = "Chief Warden"
		   NameQuestBoss = "ImpelQuest"
		   LevelQuestBoss = 2
		   CFrameQuestuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		   CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	   elseif _G.Select_Boss == "Swan [Lv. 225] [Boss]" then
		   MsBoss = "Swan [Lv. 225] [Boss]"
		   NameBoss = "Swan"
		   NameQuestBoss = "ImpelQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		   CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	   elseif _G.Select_Boss == "Magma Admiral [Lv. 350] [Boss]" then
		   MsBoss = "Magma Admiral [Lv. 350] [Boss]"
		   NameBoss = "Magma Admiral"
		   NameQuestBoss = "MagmaQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
		   CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
	   elseif _G.Select_Boss == "Fishman Lord [Lv. 425] [Boss]" then
		   MsBoss = "Fishman Lord [Lv. 425] [Boss]"
		   NameBoss = "Fishman Lord"
		   NameQuestBoss = "FishmanQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
		   CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
	   elseif _G.Select_Boss == "Wysper [Lv. 500] [Boss]" then
		   MsBoss = "Wysper [Lv. 500] [Boss]"
		   NameBoss = "Wysper"
		   NameQuestBoss = "SkyExp1Quest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
		   CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
	   elseif _G.Select_Boss == "Thunder God [Lv. 575] [Boss]" then
		   MsBoss = "Thunder God [Lv. 575] [Boss]"
		   NameBoss = "Thunder God"
		   NameQuestBoss = "SkyExp2Quest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
		   CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
	   elseif _G.Select_Boss == "Cyborg [Lv. 675] [Boss]" then
		   MsBoss = "Cyborg [Lv. 675] [Boss]"
		   NameBoss = "Cyborg"
		   NameQuestBoss = "FountainQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
		   CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
	   -- New World
	   elseif _G.Select_Boss == "Diamond [Lv. 750] [Boss]" then
		   MsBoss = "Diamond [Lv. 750] [Boss]"
		   NameBoss = "Diamond"
		   NameQuestBoss = "Area1Quest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		   CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
	   elseif _G.Select_Boss == "Jeremy [Lv. 850] [Boss]" then
		   MsBoss = "Jeremy [Lv. 850] [Boss]"
		   NameBoss = "Jeremy"
		   NameQuestBoss = "Area2Quest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		   CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
	   elseif _G.Select_Boss == "Fajita [Lv. 925] [Boss]" then
		   MsBoss = "Fajita [Lv. 925] [Boss]"
		   NameBoss = "Fajita"
		   NameQuestBoss = "MarineQuest3"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
		   CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
	   elseif _G.Select_Boss == "Don Swan [Lv. 1000] [Boss]" then
		   MsBoss = "Don Swan [Lv. 1000] [Boss]"
		   NameBoss = "Don Swan"
		   CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
	   elseif _G.Select_Boss == "Smoke Admiral [Lv. 1150] [Boss]" then
		   MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
		   NameBoss = "Smoke Admiral"
		   NameQuestBoss = "IceSideQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
		   CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
	   elseif _G.Select_Boss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
		   MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
		   NameBoss = "Cursed Captain"
		   CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
	   elseif _G.Select_Boss == "Darkbeard [Lv. 1000] [Raid Boss]" then
		   MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
		   NameBoss = "Darkbeard"
		   CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
	   elseif _G.Select_Boss == "Order [Lv. 1250] [Raid Boss]" then
		   MsBoss = "Order [Lv. 1250] [Raid Boss]"
		   NameBoss = "Order"
		   CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
	   elseif _G.Select_Boss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
		   MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
		   NameBoss = "Awakened Ice Admiral"
		   NameQuestBoss = "FrostQuest"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
		   CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
	   elseif _G.Select_Boss == "Tide Keeper [Lv. 1475] [Boss]" then
		   MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
			NameBoss = "Tide Keeper"
		   NameQuestBoss = "ForgottenQuest"             
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
		   CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
	   -- Thire World
	   elseif _G.Select_Boss == "Stone [Lv. 1550] [Boss]" then
		   MsBoss = "Stone [Lv. 1550] [Boss]"
		   NameBoss = "Stone"
		   NameQuestBoss = "PiratePortQuest"             
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-290, 44, 5577)
		   CFrameBoss = CFrame.new(-1085, 40, 6779)
	   elseif _G.Select_Boss == "Island Empress [Lv. 1675] [Boss]" then
		   MsBoss = "Island Empress [Lv. 1675] [Boss]"
			NameBoss = "Island Empress"
		   NameQuestBoss = "AmazonQuest2"
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(5443, 602, 752)
		   CFrameBoss = CFrame.new(5659, 602, 244)
	   elseif _G.Select_Boss == "Kilo Admiral [Lv. 1750] [Boss]" then
		   MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
		   NameBoss = "Kilo Admiral"
		   NameQuestBoss = "MarineTreeIsland"    
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(2178, 29, -6737)
		   CFrameBoss =CFrame.new(2846, 433, -7100)
	   elseif _G.Select_Boss == "Captain Elephant [Lv. 1875] [Boss]" then
		   MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
		   NameBoss = "Captain Elephant"
		   NameQuestBoss = "DeepForestIsland"             
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-13232, 333, -7631)
		   CFrameBoss = CFrame.new(-13221, 325, -8405)
	   elseif _G.Select_Boss == "Beautiful Pirate [Lv. 1950] [Boss]" then
		   MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
		   NameBoss = "Beautiful Pirate"
		   NameQuestBoss = "DeepForestIsland2"             
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-12686, 391, -9902)
		   CFrameBoss = CFrame.new(5182, 23, -20)
	   elseif _G.Select_Boss == "Cake Queen [Lv. 2175] [Boss]" then
		   MsBoss = "Cake Queen [Lv. 2175] [Boss]"
		   NameBoss = "Cake Queen"
		   NameQuestBoss = "IceCreamIslandQuest"             
		   LevelQuestBoss = 3
		   CFrameQuestuestBoss = CFrame.new(-716, 382, -11010)
		   CFrameBoss = CFrame.new(-821, 66, -10965)
	   elseif _G.Select_Boss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
		   MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
		   NameBoss = "rip_indra True Form"
		   CFrameBoss = CFrame.new(-5359, 424, -2735)
	   elseif _G.Select_Boss == "Longma [Lv. 2000] [Boss]" then
		   MsBoss = "Longma [Lv. 2000] [Boss]"
		   NameBoss = "Longma"
		   CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
	   elseif _G.Select_Boss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
		   MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
		   NameBoss = "Soul Reaper"
		   CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
   end
   end