local basenames = {
['fir_tree_small_1()tree_fir_tall_5'] = "tree_fir_tall_5",
}
local base = {

	footprintx = 1,
	footprintz = 1,
	blocking = false,
	upright = true,

	energy = 50,
	metal = 0,

	damage = 250,
	flammable = false,
	crushresistance = 9999,
}

local ad0features = {} -- its a table of basename = texname

for name, texturename in pairs(basenames) do
	ad0features[name] = {}
	for k, v in pairs(base) do
		ad0features[name][k] = v
	end
	
	ad0features[name].description = name
	ad0features[name].name = name
	ad0features[name].object = name .. ".s3o"
	ad0features[name].customparams = {
		model_author = "Beherith, 0 A.D.",
		normalmaps = "yes",
		normaltex = "unittextures/".. texturename .. "_normal.dds",
		treeshader = "yes",
		randomrotate = "true",
		category = "Plants",
		set = "0AD features",
	}
	
end

return ad0features