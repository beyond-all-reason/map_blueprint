----------------------------------------------------------
-- AutoCreated by FeaturePlacer (by smoth)

local setcfg = {
	unitlist = {
		-- a neutral AK
		
		-- a hostile AK
		
		
		
	},
	buildinglist = {
	},
	objectlist = {
		-- Some trees, pretty vanilla
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 1004,z = 166, rot = "0"},
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 46,z = 159, rot = "0" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 301,z = 153,rot = "0" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 20,z = 162, rot = "0" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 992,z = 153,rot = "-1" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 582,z = 131, rot = "-1" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 85,z = 161, rot = "-1" },
		{name = 'fir_tree_small_1()tree_fir_tall_5', x = 438,z = 142, rot = "-1" },
		
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
		
	},
}
return setcfg