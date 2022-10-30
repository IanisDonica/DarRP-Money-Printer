AddCSLuaFile("shared.lua")
AddCSLuaFile("imgui.lua")

include("shared.lua")

local imgui = include("imgui.lua") 

surface.CreateFont("DisplayFont", {
    font = "Bahnschrift",
	extended = false,
	size = 40,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})  
surface.CreateFont("DisplayFont2", {
    font = "Bahnschrift",
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})  

surface.CreateFont("DisplayFont3", {
    font = "Bahnschrift",
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})  
surface.CreateFont("DisplayFont4", {
    font = "Bahnschrift",
	extended = false,
	size = 18,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})  




function ENT:Draw()
    self:DrawModel()

    if imgui.Entity3D2D(self, Vector(-11, -11, 9), Angle(0, 90, 0), 0.1) 
    then
    
        draw.RoundedBox(0,-4,0, 225.2, 225, Color(255, 127, 110))
        draw.SimpleText("Erl's Printer","DisplayFont", 25,8, Color(252, 0, 0))
        draw.RoundedBox(0, 0, 50, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, -4, 0, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, 215, 00, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 215, 225,10, Color(255, 30, 0))
        draw.SimpleText("Money: $"..self:GetNMoney(),"DisplayFont2", 20,70, Color(252, 0, 0))
        self.wasPressed = imgui.xTextButton("Extract Money", "DisplayFont2", 40, 170, 145, 30, 2, Color(255, 30, 0), Color(153, 153, 153))
        self.wasPressedwhere = self
        self.wasPressed2 = imgui.xTextButton("Upgrade speed: "..self.upgrade_price, "DisplayFont3", 20, 100, 180, 30, 2, Color(255, 30, 0), Color(153, 153, 153))
        self.wasPressed3 = imgui.xTextButton("Upgrade Sorage: "..self.max_storage, "DisplayFont4", 20, 135, 180, 30, 2, Color(255, 30, 0), Color(153, 153, 153))

        imgui.End3D2D()
     
    end
    if imgui.Entity3D2D(self, Vector(-11, -11.4, 9), Angle(0, 0, 90), 0.1) 
    then
        draw.RoundedBox(0,0,0, 225, 90, Color(255, 127, 110))
        
        draw.RoundedBox(0, 215, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 80, 225,10, Color(255, 30, 0))
        imgui.End3D2D()
    end
    if imgui.Entity3D2D(self, Vector(-11, 11.4, 0), Angle(0, 0, -90), 0.1) 
    then
        draw.RoundedBox(0,0,0, 225, 90, Color(255, 127, 110))
        
        draw.RoundedBox(0, 215, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 80, 225,10, Color(255, 30, 0))
        imgui.End3D2D()
    end
    if imgui.Entity3D2D(self, Vector(11.4, -11.45, 9), Angle(0, 90,90), 0.1) 
    then
        draw.RoundedBox(0,0,0, 230, 90, Color(255, 127, 110))
        draw.SimpleText("Speed: "..self:GetMAET().."$/s", "DisplayFont2", 20,15,Color(255, 30, 0))
        draw.SimpleText("Max Storage: "..self:GetMaxStorage(), "DisplayFont2", 20,45,Color(255, 30, 0))
        draw.RoundedBox(0, 220, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 10,90, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 80, 225,10, Color(255, 30, 0))
        imgui.End3D2D()
    end
    if imgui.Entity3D2D(self, Vector(-11, 11.6, 0), Angle(-90, 0, 0), 0.1) 
    then
        draw.RoundedBox(0,0,0, 90, 230, Color(255, 127, 110))
        
        draw.RoundedBox(0, 80, 0, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 90,10, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 220, 90,10, Color(255, 30, 0))
        imgui.End3D2D()
    end
    if imgui.Entity3D2D(self, Vector(11.5, -11, 0), Angle(0, 90, 180), 0.1) 
    then
    
        draw.RoundedBox(0,-4,0, 225.2, 225, Color(255, 127, 110))
        draw.RoundedBox(0, -4, 0, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 0, 225,10, Color(255, 30, 0))
        draw.RoundedBox(0, 215, 00, 10,225, Color(255, 30, 0))
        draw.RoundedBox(0, 0, 215, 225,10, Color(255, 30, 0))

        imgui.End3D2D()
     
    end
end

function ENT:Think()
    if self:GetMAET() < 256 then 
        self.upgrade_price = self:GetMAET()
    else
        self.upgrade_price = "max"
    end
    if self:GetMaxStorage() < 40000 then 
        self.max_storage = 10000
    else
        self.max_storage = "max"
    end
    if self.wasPressed then
        net.Start("PrinterMoneyExtraction")
            net.WriteEntity(self.wasPressedwhere)
        net.SendToServer()
    end
    if self.wasPressed2 then
        net.Start("PrinterUpgradeSpeed")
            net.WriteEntity(self.wasPressedwhere)
        net.SendToServer()
    end
    if self.wasPressed3 then
        net.Start("PrinterUpgradeStorage")
            net.WriteEntity(self.wasPressedwhere)
        net.SendToServer()
    end
end
