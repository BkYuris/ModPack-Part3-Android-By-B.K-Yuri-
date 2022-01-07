function onCreate()
	-- background shit
	makeLuaSprite('day_sky', 'street/day_sky', -140, 195);
	setScrollFactor('day_sky', 0.9, 0.9);
        
	makeLuaSprite('buildings', 'street/buildings', -50, 140);
	setScrollFactor('buildings', 0.9, 0.9);
	scaleObject('buildings', 0.94, 0.94);
	
	makeLuaSprite('ground', 'street/ground', -40, 50);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.00, 1.00);
	
	makeLuaSprite('street', 'street/street', -40, 50);
	setScrollFactor('street', 0.9, 0.9);
	scaleObject('street', 1.00, 1.00);

	addLuaSprite('day_sky', false);
	addLuaSprite('buildings', false);
	addLuaSprite('ground', false);
	addLuaSprite('street', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end