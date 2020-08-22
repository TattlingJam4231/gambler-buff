Hooks:Add("LocalizationManagerPostInit", "Gambler Buff Localization", function(loc)
	LocalizationManager:add_localized_strings({
        ["menu_deck10_1_desc"] = "Ammo packs you pick up also yeild Medical Supplies.\n\nMedical Supplies:\nYou are healed for ##16## to ##32## health when you pick up Medical Supplies. This is increased by ##20%## on the Gambler for every player that has more health than the Gambler. You cannot pick up Medical Supplies more than once every ##2.5## seconds.",
		["menu_deck10_3_desc"] = "When you pick up Medical Supplies, you trigger an ammo pickup for ##25%## of normal pickup to other players in your team.\n\nYou gain ##20%## more health.",
        ["menu_deck10_5_desc"] = "When you pick up Medical Supplies, your teammates also get healed for ##50%## of the ammount.\n\nYou gain ##20%## more health.",
		["menu_deck10_7"] = "More Healing",
		["menu_deck10_7_desc"] = "When Medical Supplies is on cooldown, picking up ammo heals you and your teammates for ##4## health.\n\nPicking up ammo grants you ##5## armor.",
        ["menu_deck10_9"] = "Just Lucky",
		["menu_deck10_9_desc"] = "When you pick up Medical Supplies, you gain ##0%## to ##7%## critical hit chance for ##7.5## seconds. This effect stacks. Getting three ##7%## critical bonuses in a row triggers Lucky.\n\nLucky:\nYou gain ##30%## critical hit chance for ##15## seconds. This effect overrides all other critical bonuses from Gambler.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%##."
    })
end)