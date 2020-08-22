local original_init = SkillTreeTweakData.init

function SkillTreeTweakData:init(...)
	original_init(self, ...)
	
	table.remove(self.specializations[10][7].upgrades, 1)
	table.insert(self.specializations[10][7].upgrades, "player_loose_ammo_restore_health_alt")
	table.insert(self.specializations[10][7].upgrades, "player_loose_ammo_restore_armor")
	table.remove(self.specializations[10][9].upgrades, 1)
	table.insert(self.specializations[10][9].upgrades, "temporary_loose_ammo_crit_bonus")
	
end