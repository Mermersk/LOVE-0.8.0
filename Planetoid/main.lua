require("AnAL")
function love.load()
    love.window.setMode(600, 800)
	love.graphics.setBackgroundColor(0, 0, 0)
	base = love.graphics.newImage("base.png")
	hjol = love.graphics.newImage("hjol.png")
	takki = love.graphics.newImage("takki.png")
	hanski_off = love.graphics.newImage("hanski.png")
	hanski_on = love.graphics.newImage("hanskion.png")
	sky = love.graphics.newImage("skyh.png")
	gunholder = love.graphics.newImage("gunholder2.png")
	star = love.graphics.newImage("star.png")
	blastjarna = love.graphics.newImage("blastjarna.png")
	rusl = love.graphics.newImage("rusl.png")
	gun = love.graphics.newImage("byssa2.png")
	kula = love.graphics.newImage("kula.png")
	kulah = newAnimation(kula, 42, 54, 0.1, 0)
	reykur = love.graphics.newImage("reykur2.png")
	reykurh = newAnimation(reykur, 300, 175, 0.3, 0)
	reykurh:setMode("once")
	
	gamalt = love.audio.newSource("gamalt.ogg")
	gamalt:setVolume(0.2)
	raket = love.audio.newSource("raket.ogg")
	raket:setVolume(0.5)
	
	blatt = 150
	sky_x = -200
	sky_y = 680
	sky_clarity = math.random(140, 255)
	gun_rot = 0
	hjol_rot = 0
	skot_y = 715
	skot_x = 288
	rusl_x = math.random(30, 550)
	rusl_y = -20
	rusl_rot = 0
	afstad = false
	kulas = false
	
	mintafla = {}  --B� til n�ja t�flu
	--for gildi = 1, 60 do  -- b� �arna til 60 "kassa" til a� setja t�lur �
	--    mintafla[gildi] = math.random(15, 30) --H�r segi �g a� fyrir gildi 1 til 60 ver�i gert alltaf gert math.random(1, 40)
	--end --�a� sem gerist er a� �etta t.d.: mintafla[1] = 7, mintafla[2] = 32, mintafla[32] = 22.....allt uppi � mintafla[60]. � hvert skipti kemur n� random tala.
	--�etta er �a� sama og gera mintafla1 = math.random(1, 40), mintafla2 = math.random(1, 40), bara miklu miklu styttri og betri k��i.
	
	
	for i = 0, 100 do  --100 sm�breytur eru skapa�ar! 100 stj�rnur.
	    mintafla[math.random(0, 600)] = math.random(0, 800)  -- Fysrta er lykill og svo seinna math.random er gildi.
	end
	
	blastafla = {}
	for i = 0, 20 do
	    blastafla[math.random(0, 600)] = math.random(0, 800)
	end
	
	love.mouse.setVisible(false)
end

function love.update(dt)
    mx, my = love.mouse.getPosition()
    blatt = blatt + 0.5 * dt
	
	
	if love.mouse.isDown(1) then  --Hanski � notkun e�a ekki?
	    hanski = hanski_on
	else
	    hanski = hanski_off
	end
	
	if love.mouse.isDown(1) and mx > 480 and mx < 528 and my < 120 and gun_rot < 0.75 then  --Snuningur � hj�li og byssu og hlj�� me�.
	    hjol_rot = hjol_rot - 1 * dt
		gun_rot = gun_rot + 0.2 * dt
		love.audio.play(gamalt)

	else if love.mouse.isDown(1) and mx > 529 and mx < 620 and my < 120 and gun_rot > -0.75 then
	    hjol_rot = hjol_rot + 1 * dt
		gun_rot = gun_rot - 0.2 * dt
		love.audio.play(gamalt)
	else
	    love.audio.pause(gamalt)
	  end
	end
	
	if love.mouse.isDown(1) and mx > 520 and mx < 570 and my > 150 and my < 190 then  --rau�i takkinn
		afstad = true
		love.audio.play(raket)
	end
	
	
	sky_x = sky_x + 20 * dt     --sk�amovement
	if sky_x < 275 then
	    sky_y = sky_y - 7.5 * dt
	else
	    sky_y = sky_y + 7.5 * dt
	end
	
	if sky_x > 650 then  -- Endurn�un sk�a
	    sky_x = -200
		sky_y = 680
		sky_clarity = math.random(140, 255)
	end	
	
	kulah:update(dt)
	
	if afstad == true then   --Svo skoti� hreyfist �egar skoti� er.
	    skot_y = skot_y - 50 * dt
		kulas = true  --�egar �tt er � rau�a takkan �� er breytan kulas = true
		
		if kula_rot > 0 then
		    skot_x = skot_x + (kula_rot * 50) * dt
		end
		if kula_rot < 0 then
		    skot_x = skot_x - (kula_rot * -50) * dt
		end
		
	end
	
	reykurh:setMode("loop")
	reykurh:update(dt)
	
	
	if kulas == false then  --Kulas byrjar alltaf � false svo �etta er satt, en �egar �tt er � rau�a takkan �� er kulas = true og �� er skoti� frj�lst fr� sn�ningi byssunar!
	    kula_rot = gun_rot
	end
	
	if skot_x > 620 or skot_x < -20 or skot_y < -20 then
	    afstad = false
	    kulas = false
		skot_y = 715
	    skot_x = 287
	end
	    
	rusl_y = rusl_y + 42*dt 
	rusl_rot = rusl_rot + 0.2*dt

    if 	skot_x > rusl_x and skot_x < (rusl_x + 23) and skot_y < (rusl_y + 19) and skot_y > rusl_y then
	    rusl_y = -20
		rusl_x = math.random(30, 551)
	end
end


function love.draw()
    love.graphics.print(mx, 10, 10)
	love.graphics.print(my, 60, 10)
	
	--love.graphics.print(mintafla[1], 60, 50)
	--love.graphics.print(mintafla[36], 60, 90)
	
	love.graphics.print(gun_rot, 100, 10)
    
	--for x = 0, 600, 50 do  --for x = upphafssta�ur, endasta�ur, millibil do. og sama me� y.
	--for y = 0, 800, 50 do	--Svo set �g �a� x og y � love.graphics.point og �a� teiknast.
	--    love.graphics.draw(star, x, y)  --�g t.d. � x a� segja a� teikna � gildin 10, 20, 30 og svo �fram � x �s.
	--end
	--end
	
	for lykill, gildi in pairs(mintafla) do
		love.graphics.draw(star ,lykill, gildi)
		love.graphics.points(lykill, gildi)
	end
	
	for lykill, gildi in pairs(blastafla) do
	    love.graphics.draw(blastjarna, lykill, gildi, gildi, 0.4, 0.4)
	end

    love.graphics.setColor(250, 220, 220, 150)
	love.graphics.circle("fill", 305, 1160, 700, 500)  -- ytri j�r� athmosphere
	love.graphics.setColor(255, 255, 255)

    love.graphics.setColor(40, 0, blatt, 239)
	love.graphics.circle("fill", 305, 1175, 700, 500)  -- J�r� athmosphere
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.draw(base, 70, 750)
	love.graphics.draw(hjol, 545, 60, hjol_rot, 1, 1, 50, 50) --�essi 50, 50 segja a� snuningspunktur myndarinna er 50 inn � x-�s og sma � y �s. �essi mynd er 100x100 svo nu er  snunungspunkturinn mi�jan! Mj�g ggott fyrir til a� sn�a myndum!
	love.graphics.draw(takki, 515, 115)
	love.graphics.draw(gun, 290, 740, gun_rot, 0.35, 0.35, 75, 100)
	love.graphics.draw(gunholder, 218, 670, 0, 0.5, 0.5)
	
	love.graphics.draw(rusl, rusl_x, rusl_y, rusl_rot)
	
	love.graphics.draw(hanski, mx - 30, my - 30, 0, 0.6, 0.6)  --Hanskinn fylgir m�sinni, - t�lur svo a� mi�jan s� � mi�jum hanska en ekki efst-vinstri horni�.
	
	love.graphics.setColor(255, 255, 255, sky_clarity)
	love.graphics.draw(sky, sky_x, sky_y, 0, 0.5, 0.5)
	love.graphics.setColor(255, 255, 255)
	
	
	
	if afstad == true then  --svo a� skoti� teiknist �egar skoti� er.
	   kulah:draw(skot_x, skot_y, kula_rot, 0.4, 0.4, 33)
	   
	   reykurh:draw(205, 715, 0, 0.4, 0.4)
    end


	   
end