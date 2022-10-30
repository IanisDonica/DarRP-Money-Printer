ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "printer"

ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "NMoney")
    self:NetworkVar("Int", 2, "MAET") --Money Added Each time 
    self:NetworkVar("Int", 3, "MaxStorage")
end