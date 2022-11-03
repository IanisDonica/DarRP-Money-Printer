ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Erls Printer"

ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "erl_printer_NMoney")
    self:NetworkVar("Int", 2, "erl_printer_MAET") --Money Added Each time 
    self:NetworkVar("Int", 3, "erl_printer_MaxStorage")
end