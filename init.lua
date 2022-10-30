AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("PrinterMoneyExtraction")
util.AddNetworkString("PrinterUpgradeSpeed")
util.AddNetworkString("PrinterUpgradeStorage")


function ENT:Initialize()

    self:SetModel("models/props_c17/consolebox03a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self.interval = 1
    self:SetMAET(2)
    self:SetMaxStorage(1000)

    phys = self:GetPhysicsObject()

    self.timer = CurTime() 

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Think()

    if CurTime() > self.timer + self.interval 
    then
        self.timer = CurTime()
        self:SetNMoney(self:GetNMoney() + self:GetMAET())
    end
    if self:GetMaxStorage() < self:GetNMoney() then self:SetNMoney(self:GetMaxStorage()) end
end

net.Receive("PrinterMoneyExtraction", function(len, ply) 
    enti = net.ReadEntity()

    ply:addMoney(enti:GetNMoney())
    enti:SetNMoney(0)
end)

net.Receive("PrinterUpgradeSpeed", function(len, ply)
    enti = net.ReadEntity()
    if enti:GetMAET() < 256 
    then
        if ply:getDarkRPVar("money") >= enti:GetMAET() * 2
        then
            ply:setDarkRPVar("money", ply:getDarkRPVar("money") - enti:GetMAET() * 2)
            enti:SetMAET(enti:GetMAET() * 2)
        end
    end
end)

net.Receive("PrinterUpgradeStorage", function(len, ply)
    enti = net.ReadEntity()
    if enti:GetMaxStorage() < 40000 
    then
        if ply:getDarkRPVar("money") >= 10000 
        then
            ply:setDarkRPVar("money", ply:getDarkRPVar("money") - 10000)
            enti:SetMaxStorage(enti:GetMaxStorage() + 10000)
        end
    end
end)