----------------------------------------------------------
-- AutoCreated by FeaturePlacer (by smoth)

local setcfg = {
	unitlist = {
		-- Yes you can add gaia units here:
		--[[
		-- a neutral AK
			{name = 'corak', x = 1000, z = 1000},
			
			-- a hostile thud
			{name = 'corthud', x = 1000, z = 960, neutral = false},
			
			-- a neutral storm not alwaysvisible
			{name = 'corstorm', x = 1000, z = 920, alwaysVisible = false},
			
			-- a neutral ck not visible at all?
			{name = 'corck', x = 1000, z = 920, alwaysVisible = false, los = false, prevLos = false},
			
			-- A really expensive necro
			{name = 'cornecro', x = 1000, z = 920, metalCost = 5000},
		]]--
	
	},
	buildinglist = {
	},
	objectlist = {
		--[[ Default example
		{ 
			name = 'armpw_dead', -- must be a valid featureDef name
			x = 1000, -- X position
			z = 1000, -- Z position
			rot = 12, -- rotation, 65k range
			resurrectAs = 'armpw', -- valid unitdef name, not resurrectable if not specified.
			reclaimLeft = 0.5, -- how much of it has been reclaimed compared to default starting amount, default 1, 0 is fully reclaimed
			metal = 100, -- how much metal its got, default unchanged
			energy = 200, -- how much energy its got, default unchanged
			reclaimTime = 20000, -- see buildtime, default unchanged
			health = 200, -- how many hp its got, default unchanged
			resurrectProgress = 0, -- how far along its been rezzed, default 0, max 1
		}
		
		]]--
		--[[
			-- Some trees, pretty vanilla
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 1004,z = 166, rot = "0"},
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 46,z = 159, rot = "0" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 301,z = 153,rot = "0" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 20,z = 162, rot = "0" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 992,z = 153,rot = "-1" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 582,z = 131, rot = "-1" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 85,z = 161, rot = "-1" },
			{name = 'fir_tree_small_1()tree_fir_tall_5', x = 438,z = 142, rot = "-1" },
		]]--
		-- Other fun stuff:
		--[[
			-- A dead, regular non-resurrectable Pawn, 
			{name = 'armpw_dead', x = 32,z = 32,  rot = "0" },
			
			-- a resurrectable pawn
			{name = 'armpw_dead', x = 32,z = 64,  rot = "0" , resurrectAs = 'armpw'},
			
			-- a resurrectable, 50% reclaimed rocko
			{name = 'armrock_dead', x = 32,z = 96,  rot = "0" , resurrectAs = 'armpw', reclaimLeft = 0.5},
			
			-- low HP wrecked hammer
			{name = 'armham_dead', x = 64,z = 32,  rot = "0" , health = 100.0}, -- works!
			
			-- a half-resurrected warrior
			{name = 'armwar_dead', x = 64,z = 64,  rot = "0" , resurrectAs = 'armwar', resurrectProgress = 0.5}, -- works!
			
			-- a half dead, half reclaimed, half resurrected cb
			{name = 'armck_dead', x = 64,z = 96,  rot = "0" , health = 100.0, resurrectAs = 'armck', resurrectProgress = 0.5, reclaimLeft = 0.5}, -- works!
		]]--
	},
}
return setcfg
