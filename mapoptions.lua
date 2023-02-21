--[[  OPTION DEFINITION FILES

  CustomMapOptions.lua
  - belongs in the map archive
  - options that get used by LuaGaia

  CustomModOptions.lua
  - belongs in the mod archive
  - options that get used by LuaRules

--]]

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--  NOTES:
--  - using an enumerated table lets you specify the options order

--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  scope:    'all', 'player', 'team', 'allyteam'      <<< not supported yet >>>
--

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local options = {
 	--[[
	{
	    key    = 'Roads',
	    name   = 'Roads',
	    desc   = 'Enables speed boosts for units on roads',
		type   = 'bool',
	    def    = true,
 	}, 
	{
		key    = 'WaterDamage',
		name   = 'Water Damage',
		desc   = 'Enables acidic water',
	 	type   = 'bool',
	 	def    = false,
	},
	]]--
	{
		key    = 'WaterLevel',
		name   = 'Water Level',
		desc   = 'Should the map be dry?',
		type   = 'number',
		def    = 0,
		min    = 0,
		max    = 2,
		step   = 1,  -- quantization is aligned to the def value
				-- (step <= 0) means that there is no quantization
	},
}

return options