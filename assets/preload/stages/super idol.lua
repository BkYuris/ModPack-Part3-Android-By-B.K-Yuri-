function onCreate()

	makeLuaSprite('theSky', 'sky',-800, -100)
	addLuaSprite('theSky',false)
	setLuaSpriteScrollFactor('theSky', 0.2, 0.2)

	makeLuaSprite('theGround', 'ground',-200, 600)
	addLuaSprite('theGround',false)
	setLuaSpriteScrollFactor('theGround', 0.8, 0.8)

	close(true)

end