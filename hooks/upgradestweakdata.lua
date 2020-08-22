local original_player_definitions = UpgradesTweakData._player_definitions

function UpgradesTweakData:_player_definitions(...)
	original_player_definitions(self, ...)
	
	self.definitions.player_loose_ammo_restore_health_alt = {
		name_id = "menu_player_loose_ammo_restore_health_alt",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "loose_ammo_restore_health_alt",
			category = "player"
		}
	}
	self.definitions.player_loose_ammo_restore_armor = {
		name_id = "menu_player_loose_ammo_restore_armor",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "loose_ammo_restore_armor",
			category = "player"
		}
	}
	self.definitions.temporary_loose_ammo_crit_bonus = {
		name_id = "menu_temporary_loose_ammo_crit_bonus",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "loose_ammo_crit_bonus",
			category = "temporary"
		}
	}
	
	self.loose_ammo_restore_health_values = {
		{
			0,
			4
		},
		{
			4,
			8
		},
		{
			8,
			12
		},
		multiplier = 0.1,
		cd = 2.5,
		base = 8
	}
	self.values.temporary.loose_ammo_restore_health = {}
	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		local base = self.loose_ammo_restore_health_values.base

		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				8,
				16
			},
			self.loose_ammo_restore_health_values.cd
		})
	end
		
	self.loose_ammo_give_team_health_ratio = 1
	self.loose_ammo_give_team_ratio = 0.25
	self.values.temporary.loose_ammo_give_team = {
		{
			true,
			2.5
		}
	}
	self.values.player.loose_ammo_restore_health_alt = {4}
	self.values.player.loose_ammo_restore_armor = {5}
	self.values.temporary.loose_ammo_crit_bonus = {
		{
			0,
			7
		},
		7.5,
		30,
		15
	}
end