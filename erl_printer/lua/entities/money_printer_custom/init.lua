AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("erl_printer_money_extraction")
util.AddNetworkString("erl_printer_upgradeSpeed")
util.AddNetworkString("erl_printer_upgradeStorage")


function ENT:Initialize()

    self:SetModel("models/props_c17/consolebox03a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self.interval = 1
    self:Seterl_printer_MAET(2)
    self:Seterl_printer_MaxStorage(1000)

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
        self:Seterl_printer_NMoney(self:Geterl_printer_NMoney() + self:Geterl_printer_MAET())
    end
    if self:Geterl_printer_MaxStorage() < self:Geterl_printer_NMoney() then self:Seterl_printer_NMoney(self:Geterl_printer_MaxStorage()) end
end

net.Receive("erl_printer_money_extraction", function(len, ply) 
    local enti = net.ReadEntity()

    ply:addMoney(enti:Geterl_printer_NMoney())
    enti:Seterl_printer_NMoney(0)
end)

net.Receive("erl_printer_upgradeSpeed", function(len, ply)
    local enti = net.ReadEntity()
    if enti:Geterl_printer_MAET() < 256 
    then
        if ply:getDarkRPVar("money") >= enti:Geterl_printer_MAET() * 2
        then
            ply:setDarkRPVar("money", ply:getDarkRPVar("money") - enti:Geterl_printer_MAET() * 2)
            enti:Seterl_printer_MAET(enti:Geterl_printer_MAET() * 2)
        end
    end
end)

net.Receive("erl_printer_upgradeStorage", function(len, ply)
    local enti = net.ReadEntity()
    if enti:Geterl_printer_MaxStorage() < 40000 
    then
        if ply:getDarkRPVar("money") >= 10000 
        then
            ply:setDarkRPVar("money", ply:getDarkRPVar("money") - 10000)
            enti:Seterl_printer_MaxStorage(enti:Geterl_printer_MaxStorage() + 10000)
        end
    end
end)