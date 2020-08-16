function PlayerManager:_update_timers(t)
	local timers_copy = table.map_copy(self._timers)

	for key, timer in pairs(timers_copy) do
		if not timer.t or timer.t <= t then
			self._timers[key] = nil

			if timer.func then
				timer.func(key, timer.t)
			end
		end
	end
	
	if self:has_category_upgrade("temporary", "loose_ammo_crit_bonus") then
		PlayerManager:update_gambler_crit_bonus(t)
	end
end

function PlayerManager:update_gambler_crit_bonus(t)
	self.gambler_crit_stacks = self.gambler_crit_stacks or {}
	self.gambler_jackpot = self.gambler_jackpot or 0
	self.jackpot_expire_time = self.jackpot_expire_time or 0
	
	if self.gambler_crit_stacks[1] and self.gambler_crit_stacks[1][2] < t then
		table.remove(self.gambler_crit_stacks, 1)
	end
	
	if self.gambler_jackpot == 7 and self.jackpot_expire_time < t then
		self.gambler_jackpot = 0
		self.jackpot_expire_time = 0
	end
end

function PlayerManager:add_gambler_crit_stack()
	self.gambler_crit_stacks = self.gambler_crit_stacks or {}
	self.just_lucky = self.just_lucky or 0
	self.gambler_jackpot = self.gambler_jackpot or 0
	
	local value_range = PlayerManager:upgrade_value_by_level("temporary", "loose_ammo_crit_bonus", 1, {0,0})
	local crit_value = math.random(value_range[1], value_range[2])
	local expire_time = Application:time() + PlayerManager:upgrade_value_by_level("temporary", "loose_ammo_crit_bonus", 2, 5)
	
	self.just_lucky = (crit_value == 7) and self.just_lucky + 1 or 0
	self.gambler_jackpot = (self.just_lucky == 3) and 7 or 0
	if self.gambler_jackpot == 7 then
		self.jackpot_expire_time = Application:time() + PlayerManager:upgrade_value_by_level("temporary", "loose_ammo_crit_bonus", 4, 5)
	end
	
	table.insert(self.gambler_crit_stacks, {crit_value, expire_time})
 
end

function PlayerManager:get_gambler_crit_bonus()
	self.gambler_crit_stacks = self.gambler_crit_stacks or {}
	
	if self.gambler_jackpot == 7 then
		return PlayerManager:upgrade_value_by_level("temporary", "loose_ammo_crit_bonus", 2, 0) * 0.01
	end
	
	local crit_bonus = 0
	for k, v in pairs(self.gambler_crit_stacks) do
		crit_bonus = crit_bonus + v[1]
	end
	
	return crit_bonus * 0.01
end