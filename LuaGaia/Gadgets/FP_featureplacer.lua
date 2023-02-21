function gadget:GetInfo()
	return {
		name      = "feature placer",
		desc      = "Spawns Features and Units",
		author    = "Gnome, Smoth",
		date      = "August 2008",
		license   = "PD",
		layer     = 0,
		enabled   = true  --  loaded by default?
	}
end

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

if (Spring.GetGameFrame() >= 1) then
  return false
end

local SetUnitNeutral        = Spring.SetUnitNeutral
local SetUnitBlocking       = Spring.SetUnitBlocking
local SetUnitRotation       = Spring.SetUnitRotation
local SetUnitAlwaysVisible  = Spring.SetUnitAlwaysVisible
local CreateUnit            = Spring.CreateUnit
local CreateFeature         = Spring.CreateFeature

local featurecfg
local featureslist
local buildinglist
local unitlist


if VFS.FileExists("mapconfig/featureplacer/config.lua") then
	featurecfg = VFS.Include("mapconfig/featureplacer/config.lua")
	
	featureslist = featurecfg.objectlist
	buildinglist = featurecfg.buildinglist
	unitlist     = featurecfg.unitlist
else
	Spring.Echo("missing file")
	Spring.Echo("No features loaded")
end


if ( featurecfg ) then
	local gaiaID = Spring.GetGaiaTeamID()

	if ( featureslist ) then
		for i,fDef in pairs(featureslist) do
			if FeatureDefNames[fDef.name] then 
				local rotation = fDef.rot or 0
				rotation = tonumber(rotation) or rotation

				if rotation == -1 then 
					rotation = (math.random() -0.5) * 65000 
				end
				local featureID = CreateFeature(fDef.name, fDef.x, Spring.GetGroundHeight(fDef.x,fDef.z)+5, fDef.z, rotation)
				if featureID then 
					if fDef.metal or fDef.energy or fDef.reclaimTime or fDef.reclaimLeft then 
						local rm, mm, re, mr, rl, rt = Spring.GetFeatureResources(featureID)
						Spring.SetFeatureResources(featureID, fDef.metal or rm, fDef.energy or re, fDef.reclaimTime or rt, fDef.reclaimLeft or rl)
					end
					if fDef.resurrectAs then 
						Spring.SetFeatureResurrect(featureID, fDef.resurrectAs, rotation, fDef.resurrectProgress)
					end
					if fDef.health then 
						Spring.SetFeatureHealth(featureID, fDef.health)
					end
				end
			else
				Spring.Echo("Warning: Cant find Feature Def name specified in maps set.lua", fDef.name)
			end
		end
	end

	if ( unitlist ) then
		for i,uDef in pairs(unitlist) do
			local rotation = uDef.rot or 0
			rotation = tonumber(rotation) or rotation
			if rotation == -1 then 
				rotation = (math.random() -0.5) * 65000 
			end
		
			if UnitDefNames[uDef.name] then 
				local unitID = CreateUnit(uDef.name, uDef.x, Spring.GetGroundHeight(uDef.x,uDef.z), uDef.z, rotation, gaiaID)
				if unitID then 
					SetUnitRotation(unitID, 0, rotation * math.pi / 32768, 0)
					if uDef.neutral ~= false then 
						SetUnitNeutral(unitID,true)
					end
					
					local los_status = {
						los = (uDef.los ~= false),
						prevLos = (uDef.prevLos ~= false),
						contRadar = (uDef.contRadar ~= false),
						radar = (uDef.radar ~= false)
						}
					
					Spring.SetUnitLosState(unitID,0,los_status)
					if uDef.alwaysVisible ~= false then 
						SetUnitAlwaysVisible(unitID,true)
					end
					if uDef.blocking ~= false then 
						SetUnitBlocking(unitID,true)
					end 
					
					if uDef.buildTime or uDef.metalCost or uDef.energyCost then 
						Spring.SetUnitCosts(unitID, {buildTime = uDef.buildTime, metalCost = uDef.metalCost, energyCost = uDef.energyCost})
					end
					if uDef.health then 
						Spring.SetUnitHealth(unitID, health) 
					end
					if uDef.maxHealth then 
						Spring.SetUnitMaxHealth(unitID, uDef.maxHealth) 
					end
					
					if uDef.stealth then 
						Spring.SetUnitStealth(unitID, uDef.stealth) 
					end
					
					if uDef.experience then 
						Spring.SetUnitExperience(unitID, uDef.experience)
					end
					
				end
			else 
				Spring.Echo("Warning: Cant find Unit Def name specified in maps set.lua", uDef.name)
			end
		end
	end

	if ( buildinglist ) then
		local los_status = {los=true, prevLos=true, contRadar=true, radar=true}
		for i,bDef in pairs(buildinglist) do
			local flagID = CreateUnit(bDef.name, bDef.x, 0, bDef.z, bDef.rot, gaiaID)
			SetUnitNeutral(flagID,true)
			Spring.SetUnitLosState(flagID,0,los_status)
			SetUnitAlwaysVisible(flagID,true)
			SetUnitBlocking(flagID,true)
		end
	end
end

return false --unload
