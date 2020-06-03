impulse.Loot = impulse.Loot or {}

local ANTICRASH_ATTEMPTS = 0
function impulse.Loot.GenerateFromPool(pool)
	local lootPool = impulse.Config.LootPools[pool]
	local count = 0
	local rarityCount = 0
	local loot = {}

	for v,k in RandomPairs(lootPool.Items) do
		for i=1, (k.Rep or 1) do
			local rGen = math.random(1, 1000)

			if rGen >= k.Rarity then
				if lootPool.MaxItems and count >= lootPool.MaxItems then
					break
				end

				if lootPool.MaxRarity and rarityCount >= lootPool.MaxRarity then
					break
				end

				count = count + 1
				rarityCount = rarityCount + k.Rarity

				loot[v] = (loot[v] and loot[v] + 1) or 1
			end
		end
	end

	if count == 0 then -- warning this might get stuck?!
		ANTICRASH_ATTEMPTS = ANTICRASH_ATTEMPTS + 1

		if ANTICRASH_ATTEMPTS > 3 then
			print("HIGH LOOT GENERATION ATTEMPTS WARNING!!!!!!!!")	
		end

		return impulse.Loot.GenerateFromPool(pool)
	else
		ANTICRASH_ATTEMPTS = 0
	end

	return loot, count
end