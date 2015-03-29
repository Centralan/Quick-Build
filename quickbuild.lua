local world = World:new('quickbuild');
local LobbyToBuildArea = Location:new(world, 2, 62, -1902);


local myTimer = Timer:new("playerCheck", 5 * 20);

-- The minimum co-ords for each axis.
local minPos = {
	X = -22,
	Y = 68,
	Z = -1930
};

-- The maximum co-ords for each axis.
local maxPos = {
	X = 26,
	Y = 77,
	Z = -1878
};

-- This is called by myTimer every 5 seconds.
function playerCheck()
	local worldPlayers = {myWorld:getPlayers()}; -- Get all players within the world.
	
	-- Loop every player in the world.
	for index, playerName in pairs(worldPlayers) do
		-- Give the player a 1 in 5 chance to actually be ported.
		if math.random(1, 5) == 4 then
			local player = Player:new(playerName);
			local _, x, y, z = player:getLocation();
			
			-- Check the player is within the bounds we've set.
			if x >= minPos.X and y >= minPos.Y and z >= minPos.Z then
				if x <= maxPos.X and y <= maxPos.Y and z <= maxPos.Z then
					moveTo = LobbyToBuildArea;
				end
			end
		end
	end
end

myTimer:startRepeating(); -- Start our timer.
