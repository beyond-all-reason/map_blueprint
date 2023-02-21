


if Spring.GetMapOptions then
  local mapOptions = Spring.GetMapOptions()
  Spring.Echo("Spring.GetMapOptions Selected mapOptions: Waterdamage:",mapOptions.waterdamage,"WaterLevel:",mapOptions.waterlevel, "Roads:", mapOptions.roads)
  local acid = false
  if mapOptions.waterdamage == "1" or mapOptions.waterdamage == true  then
	mapinfo.water.damage = 50
	mapinfo.water.absorb    = { 0.01, 0.08, 0.01 }
	mapinfo.water.basecolor = { 0.8, 0.4, 0.8 } --or 0.4 0.0 0.4
	mapinfo.water.mincolor  = { 0.2, 0.0, 0.2 }--or 0.4 0.0 0.4
	mapinfo.water.surfacecolor  = { 1.0, 0.65, 1.0 }
	acid = true
  else
    mapinfo.water.damage = 0
  end
  if mapOptions.roads == "0" or mapOptions.roads == false then
    --set all typemaps modifiers to 1
    for terrainIndex in pairs(mapinfo.terraintypes) do
      for unitType in pairs(mapinfo.terraintypes[terrainIndex].movespeeds) do
        mapinfo.terraintypes[terrainIndex].movespeeds[unitType] = 1
      end
    end
  end
  --we intentionally put default out of bounds so that existance check will fail and map won't be altered
	if mapOptions.waterlevel then
	  local waterLevel = tonumber(mapOptions.waterlevel or "0") 
		--default min = -100
		--default max = 900
	  if waterLevel ==-1 then
		mapinfo.smf.minheight = -505
		mapinfo.smf.maxheight = 495
	  end
	  
	  if waterLevel ==1 and not acid then
		mapinfo.smf.minheight = -300
		mapinfo.smf.maxheight = 700
	  end
	  if waterLevel ==2 and not acid then
		mapinfo.smf.minheight = -610
		mapinfo.smf.maxheight = 390
	  end
	  if waterLevel ==3 and not acid then
		mapinfo.smf.minheight = -750
		mapinfo.smf.maxheight = 250
	  end
	  if waterLevel ==4 and not acid then
		mapinfo.smf.minheight = -900
		mapinfo.smf.maxheight = 100
	  end
	end
end

