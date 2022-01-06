function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'EXE Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'EXENOTE_assets');
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'EXE Note' then
		setProperty('health', getProperty('health') - 0.15);
		makeAnimatedLuaSprite('static', 'staticred', 0, 0);
		addAnimationByPrefix('static', 'first', 'static', 7, true);
		objectPlayAnimation('static', 'first');
		setObjectCamera('static', 'other');
		scaleObject('static', 4, 4);
		addLuaSprite('static', true);
		doTweenAlpha('staticfade', 'static', 0, 1, 'linear');
		playSound('static', 0.5)
	end
end

