images="NOTE_taiko.png";

animatedImages="NOTE_taiko.xml";

function onStartCountdown()
--Takio--
AnimatedImagesXML=""..animatedImages.."";
--the images--
imagesPNG=""..images.."";
--add--
addImagesSprite('taikoSpot')
--animated lua sprite--
makeLuaSprite(''..images..'')
--lua conplete // anlua
end