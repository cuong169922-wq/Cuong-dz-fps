local r,c,p,v,tw,uis=game:GetService("RunService"),game:GetService("CoreGui"),game:GetService("Players").LocalPlayer,game:GetService("VirtualUser"),game:GetService("TweenService"),game:GetService("UserInputService")
p.Idled:Connect(function()v:CaptureController()v:ClickButton2(Vector2.new())end)
local g=(gethui and gethui())or c
if g:FindFirstChild("ArceusFPS")then g.ArceusFPS:Destroy()end
local s=Instance.new("ScreenGui",g)
s.Name="ArceusFPS"
local n=Instance.new("TextLabel",s)
n.Size,n.AnchorPoint,n.Position,n.BackgroundTransparency,n.Font,n.TextColor3,n.TextStrokeTransparency,n.TextSize,n.Text=UDim2.new(0,400,0,150),Vector2.new(0.5,0),UDim2.new(0.5,0,0,50),1,Enum.Font.PermanentMarker,Color3.fromRGB(255,255,0),0,35,""
task.spawn(function()
    n.Text="Xin chào"
    task.wait(0.5)
    n.Text="by Cuongdz210"
    task.wait(0.5)
    n.Text="Script show fps"
    task.wait(5)
    local t=tw:Create(n,TweenInfo.new(1.5),{TextTransparency=1,TextStrokeTransparency=1})
    t:Play()
    t.Completed:Connect(function()n:Destroy()end)
end)

local f=Instance.new("TextLabel",s)
f.Size,f.AnchorPoint,f.Position,f.BackgroundColor3,f.BackgroundTransparency,f.TextColor3,f.Font,f.TextSize,f.Text=UDim2.new(0,110,0,35),Vector2.new(1,0),UDim2.new(1,-15,0,130),Color3.fromRGB(40,40,40),0.3,Color3.fromRGB(255,255,255),Enum.Font.GothamBold,18,"FPS: ..."
Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)

-- ========== PHẦN ĐO FPS ĐÃ ĐƯỢC CẬP NHẬT (CHÍNH XÁC & KHÔNG LAG) ==========
local frameCount = 0
local lastTime = os.clock()  -- Thời điểm bắt đầu đo

r.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = os.clock()
    local delta = currentTime - lastTime
    
    -- Mỗi 1 giây cập nhật FPS một lần
    if delta >= 1 then
        local currentFPS = frameCount
        f.Text = "FPS: " .. currentFPS
        
        -- Reset bộ đếm cho giây tiếp theo
        frameCount = 0
        lastTime = currentTime
    end
end)
-- ========== KẾT THÚC PHẦN CẬP NHẬT ==========

-- Phần kéo thả (giữ nguyên từ code cũ, đã hoạt động tốt)
local d,di,ds,sp
local function upd(i)
    local dt=i.Position-ds
    f.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dt.X,sp.Y.Scale,sp.Y.Offset+dt.Y)
end
f.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        d,ds,sp=true,i.Position,f.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then d=false end
        end)
    end
end)
f.InputChanged:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then
        di=i
    end
end)
uis.InputChanged:Connect(function(i)
    if i==di and d then upd(i)end
end)
