
local ringCount = 0;
local evilMode = 0;
local tooslowEnd = 0;

function onCreate()

        makeLuaSprite('ringCounter', 'ringCounter', 990, 12)
		scaleObject('ringCounter', 1, 1);
        setObjectCamera('ringCounter', 'hud')
        addLuaSprite('ringCounter', true)
		
end

function onUpdate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if evilMode == 0 and getPropertyFromGroup('notes', i, 'noteType') == 'Ring Note' then
			setPropertyFromGroup('notes', i, 'texture', 'RINGNOTE_assets');
			end
		if evilMode == 0 and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ring Note' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
		if evilMode == 1 and getPropertyFromGroup('notes', i, 'noteType') == 'Ring Note' then
			setPropertyFromGroup('notes', i, 'texture', 'REDRINGNOTE_assets');
		end
		if evilMode == 1 and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ring Note' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
		if evilMode == 0 and getPropertyFromGroup('notes', i, 'noteType') == 'Ringbox Note' then
			setPropertyFromGroup('notes', i, 'texture', 'RINGBOXNOTE_assets');
		end
		if evilMode == 1 and getPropertyFromGroup('notes', i, 'noteType') == 'Ringbox Note' then
			setPropertyFromGroup('notes', i, 'texture', 'BOXNOTE_assets');
		end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Static Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'STATICNOTE_assets');
		end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Static P1 Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'STATICNOTE_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Spike Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'SPIKENOTE_assets');
		end
	end
    makeLuaText("RingsCount", ringCount, 400, 1000, 0)
	setTextSize("RingsCount", 45)
	setTextFont("RingsCount", "sonic-1-hud-font.ttf");
    addLuaText("RingsCount")
		if ringCount < 1 then
			ringCount = 0;
		end
		if evilMode == 0 then
		removeLuaSprite('GreenHillEvil', false)
		removeLuaSprite('HLives2', false)
		removeLuaSprite('XLives', false)
		triggerEvent('Change Character', 2, 'gf-blank');
		end
		if evilMode == 1 and tooslowEnd == 0 then
		triggerEvent('Change Character', 2, 'gf-exe');
		makeLuaSprite('HLives2', 'HedgehogLives', 596, 1278);
		setScrollFactor('HLives2', 1, 1);
		addLuaSprite('HLives2', false)
		end
		if evilMode == 1 and tooslowEnd == 1 then
		makeLuaSprite('XLives', 'XenophanesLives', 596, 1278);
		setScrollFactor('XLives', 1, 1);
		addLuaSprite('XLives', false)
		triggerEvent('Change Character', 2, 'gf-blank');
		removeLuaSprite('endstatic', false)
		end
end

		
function onStepHit()
	if evilMode == 1 then
		setProperty('health', getProperty('health') - 0.013);
		addScore(-100)
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if evilMode == 0 and noteType == 'Ring Note' and isSustainNote == false then
		playSound('ring', 0.1)
		characterPlayAnim('boyfriend', 'hey', true);
		setProperty('health', getProperty('health') - 0.023);
		ringCount = ringCount + 1;
	end
	if evilMode == 1 and noteType == 'Ring Note' and isSustainNote == false then
		ringCount = ringCount - 1;
		addMisses(1)
		playSound('red-ring', 0.1)
		if ringCount < 1 then
		characterPlayAnim('boyfriend', 'hurt', true);
		playSound('warning-miss', 0.5)
		setProperty('health', getProperty('health') - 0.15);
		end
		if ringCount > 0 then
		characterPlayAnim('boyfriend', 'scared', true);
		end
	end
	if evilMode == 0 and noteType == 'Ringbox Note' and isSustainNote == false then
		playSound('ring', 0.1)
		playSound('box-poof', 0.8)
		characterPlayAnim('boyfriend', 'hey', true);
		setProperty('health', getProperty('health') - 0.023);
		ringCount = ringCount + 10;
	end
	if evilMode == 1 and noteType == 'Ringbox Note' and isSustainNote == false then
		playSound('box-poof', 0.8)
		characterPlayAnim('boyfriend', 'dodge', true);
		evilMode = 0;
	makeAnimatedLuaSprite('static', 'staticgrey', 500, 300);
	addAnimationByPrefix('static', 'first', 'static', 7, true);
	objectPlayAnimation('static', 'first');
	addLuaSprite('static', true);
	doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
		playSound('static', 0.5)
	end
	if noteType == 'Static P1 Note' then
	evilMode = 1;
	makeLuaSprite('GreenHillEvil', 'GreenHillEvil', 500, 300);
	setScrollFactor('GreenHillEvil', 1, 1);
	addLuaSprite('GreenHillEvil', false)
	setProperty('health', getProperty('health') - 0.15);
	makeAnimatedLuaSprite('static', 'staticgrey', 500, 300);
	addAnimationByPrefix('static', 'first', 'static', 7, true);
	objectPlayAnimation('static', 'first');
	addLuaSprite('static', true);
	doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
	playSound('static', 0.5)
	end
	 if noteType == 'Spike Note' then
		if ringCount > 0 then
		ringCount = 0;
		playSound('ring-loss', 0.05)
		playSound('spike', 0.5)
		end
		if ringCount < 1 then
		playSound('warning-miss', 0.5)
		playSound('spike', 0.5)
		setProperty('health', getProperty('health') - 0.2);
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if evilMode == 0 and noteType == 'Static Note' then
	evilMode = 1;
	makeLuaSprite('GreenHillEvil', 'GreenHillEvil', 500, 300);
	setScrollFactor('GreenHillEvil', 1, 1);
	addLuaSprite('GreenHillEvil', false)
	
	makeAnimatedLuaSprite('static', 'staticgrey', 500, 300);
	addAnimationByPrefix('static', 'first', 'static', 7, true);
	objectPlayAnimation('static', 'first');
	addLuaSprite('static', true);
	doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
	playSound('static', 0.5)
	end
	if evilMode == 1 and noteType == 'Ringbox Note' and isSustainNote == false then
		playSound('box-poof', 0.8)
		characterPlayAnim('boyfriend', 'dodge', true);
		evilMode = 0;
	makeAnimatedLuaSprite('static', 'staticgrey', 500, 300);
	addAnimationByPrefix('static', 'first', 'static', 7, true);
	objectPlayAnimation('static', 'first');
	addLuaSprite('static', true);
	doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
		playSound('static', 0.5)
	end
	if noteType == 'Spike Note' then
		tooslowEnd = 1;
		makeAnimatedLuaSprite('endstatic', 'staticred', 500, 300);
		addAnimationByPrefix('endstatic', 'first', 'static', 7, true);
		objectPlayAnimation('endstatic', 'first');
		addLuaSprite('endstatic', true);
		
	end
end


function noteMissPress(direction)
	if ringCount > 0 and noteType == '' then
	ringCount = ringCount - 1;
	characterPlayAnim('boyfriend', 'scared', true);
	playSound('ring-loss', 0.05)
	setProperty('health', getProperty('health') + 0.0475);
		if ringCount < 0 then
			ringCount = 0;
		end
	end
	if ringCount == 100 or ringCount > 100 and getProperty('health') == 0 then
	setProperty('health', getProperty('health') + 1);
	ringCount = 0;
	return Function_Stop
	end
end


function noteMiss(id, direction, noteType, isSustainNote)
    if ringCount > 0 and noteType == '' then
	ringCount = ringCount - 1;
	characterPlayAnim('boyfriend', 'scared', true);
	playSound('ring-loss', 0.05)
	setProperty('health', getProperty('health') + 0.0475);
		if ringCount < 1 then
			ringCount = 0;
		end
	end
	if ringCount == 100 or ringCount > 100 and getProperty('health') == 0 then
	setProperty('health', getProperty('health') + 1);
	ringCount = 0;
	return Function_Stop
	end
end

function onEndSong()
	evilMode = 0;
	makeAnimatedLuaSprite('static', 'staticgrey', 500, 300);
	addAnimationByPrefix('static', 'first', 'static', 7, true);
	objectPlayAnimation('static', 'first');
	addLuaSprite('static', true);
	doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
	triggerEvent('Change Character', 1, 'Sonic_Pixel');
end