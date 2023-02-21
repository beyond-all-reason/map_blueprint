--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- mapinfo.lua

		
local mapinfo = {
	name        = "MAP_BLUEPRINT_V1",
	shortname   = "MAP_BLUEPRINT_V1",
	description = "Basic map blueprint, with the most minimal things required for this to be an actual map. Based on Ivands Pocket World",
	author      = "[teh]Beherith",
	version     = "1",
	--mutator   = "deployment";
	mapfile   = "maps/MAP_BLUEPRINT_V1.smf", --// location of smf/sm3 file (optional)
	modtype     = 3, --// 1=primary, 0=hidden, 3=map
	depend      = {"Map Helper v1"},
	replace     = {},

	--startpic   = "", --// deprecated
	--StartMusic = "", --// deprecated

	maphardness     = 200,
	notDeformable   = false,
	gravity         = 100,
	tidalStrength   = 15,
	maxMetal        = 0.90, --0.69, --=1.40
	extractorRadius = 90.0,
	voidWater       = false,
	autoShowMetal   = true, -- this seems to interfere with cmd area mex


	smf = {
		minheight = -340.0,
		maxheight = 760.0,
		smtFileName0 = "maps/MAP_BLUEPRINT_V1.smt",
	},

	sound = {
		preset = "default",
		passfilter = {
			gainlf = 1.0,
			gainhf = 1.0,
		},
		reverb = {
		},
	},

	resources = {
		--grassBladeTex = "grass_blade_tex.tga", --blade texture
		--grassShadingTex = "Medit_V2moose_minimap.dds", --defaults to minimap
		detailTex = "detailtexblurred.bmp",
		specularTex = "MAP_BLUEPRINT_V1_speculartex.dds",
		splatDetailTex = "iwantDNTS.tga", -- this file does not have to exist, but must be specified
		splatDistrTex = "MAP_BLUEPRINT_V1_splat_distribution.dds", --sand, rock, pebbles, cracks
		detailNormalTex = "MAP_BLUEPRINT_V1_normals.dds", --holy crap we can do 8K?
		--skyReflectModTex = "Medit_V2moose_skytex.dds",
		splatDetailNormalDiffuseAlpha = 1,
		--the order is cliffs, pebbles, grass, metalspots
		splatDetailNormalTex1 = "MAP_BLUEPRINT_V1_Rock_Brown_1k_dnts.dds";
		splatDetailNormalTex2 = "MAP_BLUEPRINT_V1_Ground_LargeScaleRockyDirt_1k_dnts.dds";
		splatDetailNormalTex3 = "MAP_BLUEPRINT_V1_Ground_GrassThickGreen_1k_dnts.dds";
		splatDetailNormalTex4 = "MAP_BLUEPRINT_V1_earth_NORM.dds";
		--lightEmissionTex = "",
	},

	splats = {
		texScales = {0.010, 0.005, 0.0075, 0.01},
		texMults  = {1.2, 0.4, 0.9, 0.25}, --cliff, pebbles, longgrass, sand
	},

	atmosphere = {
		minWind      = 1,
		maxWind      = 20,

		fogStart     = 0.8,
		fogEnd       = 1.0,

		cloudColor = {
		  0.89999998,
		  0.89999998,
		  0.89999998,
		},
    fogColor = {
      0.80000001,
      0.80000001,
      0.5,
    },
    skyColor = {
      0.42879999,
      0.58016002,
      0.63999999,
    },
		sunColor = {
		  1,
		  0.92,
		  0.78,
    },
		skyDir       = {0.0, 0.0, -1.0},
		skyBox       = "cloudySea.dds",

		cloudDensity = 0.5,
	},

	grass = {
		bladeWaveScale = 1.0,
		bladeWidth  = 1,
		bladeHeight = 2.5,
		bladeAngle  = 2.57,
		bladeColor  = {0.59, 0.81, 0.57}, --// does nothing when `grassBladeTex` is set
	},
	lighting = {
		--// dynsun
		--sunStartAngle = 0.0,
		--sunOrbitTime  = 1440.0, --how do i turn this off?
		sunDir = {
     		 0.8,
     		 1.0,
     		 -0.7,
   		},
		--// unit & ground lighting
         groundambientcolor            = { 0.40, 0.4, 0.4 },
         grounddiffusecolor            = { 0.9, 0.9, 0.85 },
         -- groundambientcolor            = { 0.0, 0.0, 0.0 }, -- specular debugging
         -- grounddiffusecolor            = { 0.0, 0.0, 0.0 }, -- specular debugging
		 groudspecularcolor            = {0.7,0.7,0.7    },
         groundshadowdensity           = 0.85,    
		 unitAmbientColor = {
			  0.5,
			  0.5,
			  0.55,
		},
		unitDiffuseColor = {
			  0.99,
			  0.99533332,
			  0.95000002,
			},
		unitSpecularColor = {
			  0.8,
			  0.60000001,
			  0.60000001,
		},
         unitshadowdensity          = 0.90,
		 specularsuncolor           = { 1.0, 1.0, 1.0 },
		 specularExponent    = 100.0,
	},
	water = { --regular water settings
		damage =  0,

		repeatX = 10.0,
		repeatY = 10.0,

		absorb    = { 0.05, 0.005, 0.001 }, --absorbption coefficient per elmo of water depth
		basecolor = { 0.3, 0.5, 0.5 }, -- the color shallow water starts out at
		mincolor  = { 0.0, 0.3, 0.3 },

		ambientFactor  = 1.0,
		diffuseFactor  = 1.0,
		specularFactor = 1.4,
		specularPower  = 40.0,

		surfacecolor  = { 0.67, 0.8, 1.0 }, --color of the water texture
		surfaceAlpha  = 0.02,
		diffuseColor  = {0.0, 0.0, 0.0},
		specularColor = {0.5, 0.5, 0.5},
		--planeColor = {0.00, 0.15, 0.15}, --outside water plane color --

		fresnelMin   = 0.08, --This defines the minimum amount of light the water surface will reflect when looking vertically down on it [0-1]
		fresnelMax   = 0.5, --Defines the maximum amount of light the water surface will reflect when looking horizontally across it [0-1]
		fresnelPower = 8.0, --Defines how much 

		reflectionDistortion = 1.0,

		blurBase      = 2.1,
		blurExponent = 1.5,

		causticsResolution = 100.0,
		causticsStrength = 0.16,

		perlinStartFreq  =  8.0,
		perlinLacunarity = 3,
		perlinAmplitude  =  0.85,

		shoreWaves = true,
		forceRendering = false,

		numTiles = 4, -- default 1
		windSpeed = 0.5, -- default 1.0
		waveOffsetFactor = 0.3, -- default 0.0
		waveLength = 0.37,
		waveFoamDistortion = 0.10,
		waveFoamIntensity = 1.0,
		normalTexture = "maps/waterbump_4tiles.png",

		--hasWaterPlane = true, --specifies whether the outside of the map has an extended water plane

		--// undefined == load them from resources.lua!
		--texture =       "",
		--foamTexture =   "",
		--normalTexture = "",
		--caustics = {
		--	"",
		--	"",
		--},
	},
	teams = {
		[0] = {startPos = {x = 50, z = 900}},
		[1] = {startPos = {x = 900, z = 50}},
	},

	terrainTypes = {
		[0] = {
			name = "Ground",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.0,
				kbot  = 1.0,
				hover = 1.0,
				ship  = 1.0,
			},
		},
		[255] = {
			name = "Roads",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.25,
				kbot  = 1.25,
				hover = 1.25,
				ship  = 1.25,
			},
		},
	},

	custom = {
		grassConfig= {
			--grassDistTGA = "maps/MAP_BLUEPRINT_V1_grassdist.tga",
			grassMaxSize = 2.0,
			grassMinSize = 0.8,
			grassBladeColorTex = "maps/grass_field_dry.dds.cached.dds", -- rgb + alpha transp
			grassShaderParams = { -- allcaps because thats how i know
				MAPCOLORFACTOR = 0.6, -- how much effect the minimapcolor has
				MAPCOLORBASE = 1.0,     --how much more to blend the bottom of the grass patches into map color
			},
		},
		fog = {
			color    = {0.26, 0.32, 0.41},
			height   = "80%", --// allows either absolue sizes or in percent of map's MaxHeight
			fogatten = 0.003,
		},
		clouds = {
            speed = 0.15, -- multiplier for speed of scrolling with wind
            --color    = {0.49,0.37,0.25}, -- diffuse color of the fog OLD
            --color    = {0.24,0.24,0.17},
            color      = {0.25,0.32,0.24},
            -- all altitude values can be either absolute, in percent, or "auto"
            -- High Clouds
            -- height   = 1200, 
            -- bottom = 600, 
            -- fade_alt = 1100, 
            -- Low Clouds
            height   = 1200, -- opacity of fog above and at this altitude will be zero
            bottom = 30, -- no fog below this altitude
            fade_alt = 30, -- fog will linearly fade away between this and "height", should be between height and bottom

            scale = 1400, -- how large will the clouds be
            opacity = 0.35, -- for low altitude
            clamp_to_map = true, -- whether fog volume is sliced to fit map, or spreads to horizon
            sun_penetration = 40, -- how much does the sun penetrate the fog
        },
		precipitation = {
			density   = 30000,
			size      = 1.5,
			speed     = 50,
			windscale = 1.2,
			texture   = 'LuaGaia/effects/snowflake.png',
		},
	},
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Helper

local function lowerkeys(ta)
	local fix = {}
	for i,v in pairs(ta) do
		if (type(i) == "string") then
			if (i ~= i:lower()) then
				fix[#fix+1] = i
			end
		end
		if (type(v) == "table") then
			lowerkeys(v)
		end
	end
	
	for i=1,#fix do
		local idx = fix[i]
		ta[idx:lower()] = ta[idx]
		ta[idx] = nil
	end
end

lowerkeys(mapinfo)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Map Options

if (Spring) then
	local function tmerge(t1, t2)
		for i,v in pairs(t2) do
			if (type(v) == "table") then
				t1[i] = t1[i] or {}
				tmerge(t1[i], v)
			else
				t1[i] = v
			end
		end
	end

	-- make code safe in unitsync
	if (not Spring.GetMapOptions) then
		Spring.GetMapOptions = function() return {} end
	end
	function tobool(val)
		local t = type(val)
		if (t == 'nil') then
			return false
		elseif (t == 'boolean') then
			return val
		elseif (t == 'number') then
			return (val ~= 0)
		elseif (t == 'string') then
			return ((val ~= '0') and (val ~= 'false'))
		end
		return false
	end

	getfenv()["mapinfo"] = mapinfo
		local files = VFS.DirList("mapconfig/mapinfo/", "*.lua")
		table.sort(files)
		for i=1,#files do
			local newcfg = VFS.Include(files[i])
			if newcfg then
				lowerkeys(newcfg)
				tmerge(mapinfo, newcfg)
			end
		end
	getfenv()["mapinfo"] = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return mapinfo

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
