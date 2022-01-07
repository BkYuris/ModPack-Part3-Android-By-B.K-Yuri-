function onCreate()
	-- background shit
	makeLuaSprite('bg', 'spikes/spikes_bg', -500, -540);
	setScrollFactor('bg', 0.9, 0.9);
        
	makeLuaSprite('spike', 'spikes/BigSpike', 650, -300);
	setScrollFactor('spike', 0.9, 0.9);
	scaleObject('spike', 1.00, 1.00);
	
	makeLuaSprite('ground', 'spikes/spikes_ground', -200, 675);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.00, 1.00);

	addLuaSprite('bg', false);
	addLuaSprite('spike', false);
	addLuaSprite('ground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end