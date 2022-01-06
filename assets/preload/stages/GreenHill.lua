function onCreate()
	-- background shit
	makeLuaSprite('GreenHill', 'GreenHill', 500, 300);
	setScrollFactor('GreenHill', 1, 1);
	addLuaSprite('GreenHill', false)	
	makeLuaSprite('HLives', 'HedgehogLives', 596, 1278);
	setScrollFactor('HLives', 1, 1);
	addLuaSprite('HLives', false)
	makeLuaSprite('Monitor', 'Monitor', 396, 212);
	setScrollFactor('Monitor', 1, 1);
	addLuaSprite('Monitor', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end