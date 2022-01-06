function onCreate()
makeLuaSprite('back', 'stageback-dark',-800, -100)
addLuaSprite('back',false)
setLuaSpriteScrollFactor('back', 0.2, 0.2)
makeLuaSprite('front', 'stagefront-dark',-200, 600)
addLuaSprite('front',false)
setLuaSpriteScrollFactor('front', 0.8, 0.8)
close(true)
end