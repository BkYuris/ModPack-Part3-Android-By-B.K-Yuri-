function onCreate()
makeLuaSprite('theSky', 'stageback-dark',-600, -200)
addLuaSprite('theSky',false)
setLuaSpriteScrollFactor('theSky', 0.8, 0.8)
makeLuaSprite('theGround', 'stagefront-dark',-600, 600)
addLuaSprite('theGround',false)
setLuaSpriteScrollFactor('theGround', 0.8, 0.8)
close(true)
end