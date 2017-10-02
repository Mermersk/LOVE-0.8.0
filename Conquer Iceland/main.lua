--Strategy game about conquering Iceland.
--Author: Mermersk

require ("AnAL")
require("conf")
function love.load()

    island = love.graphics.newImage("island.jpg")
	exi = love.graphics.newImage("exi.png")
	skjoldur = love.graphics.newImage("skjoldur.png")
	exiwin = love.graphics.newImage("exival.png")
	skjoldurwin = love.graphics.newImage("skjoldurval.png")
	arrow = love.graphics.newImage("or.png")
	skip = love.graphics.newImage("skip2.png")
	sky = love.graphics.newImage("skyh.png")
	neutral = love.graphics.newImage("neutral.png")
	ond = love.graphics.newImage("tond.png")
	hond = newAnimation(ond, 116, 88, 0.1, 0)
	exis = love.audio.newSource("axe.ogg")
	skjolds = love.audio.newSource("skjold.ogg")
	quack = love.audio.newSource("duck.mp3")
	vindur = love.audio.newSource("vindur.ogg")
	vindur:setLooping(true)
	vindur:setVolume(0.2)
    
	-- Some beginning values
	flutningur = 0
	bonustala = 0
	smelltr = 0
	smelltg = 0
	smelltb = 0
	win = 0
	paused = true
	ondgo = true
	turn = 0
	ora = 3
	
	--Endur
	ond_x = -500
	ond_y = math.random(1, 750)
	ond_yangle = math.random(-50 , 60)
	
	--skýasystem
	sky_x = math.random(-700, -250)
	sky_x2 = math.random(-700, -250)
	sky_x3 = math.random(-700, -250)
	sky_x4 = math.random(-700, -250)
	sky_x5 = math.random(-700, -250)
	
	sky_y = math.random(1, 750)
	sky_y2 = math.random(1, 750)
	sky_y3 = math.random(1, 750)
	sky_y4 = math.random(1, 750)
	sky_y5 = math.random(1, 750)
	
	sky_rot = math.random(0, 6)
	sky_rot2 = math.random(0, 6)
	sky_rot3 = math.random(0, 6)
	sky_rot4 = math.random(0, 6)
	sky_rot5 = math.random(0, 6)
	
	skyscale_x = math.random(1, 2)
	skyscale_x2 = math.random(1, 2)
	skyscale_x3 = math.random(1, 2)
	skyscale_x4 = math.random(1, 2)
	skyscale_x5 = math.random(1, 2)
	
	sky_op = math.random(130, 255)
	sky_op2 = math.random(130, 255)
	sky_op3 = math.random(130, 255)
	sky_op4 = math.random(130, 255)
	sky_op5 = math.random(130, 255)
	
	sky_speed = math.random(20, 100)
	sky_speed2 = math.random(20, 100)
	sky_speed3 = math.random(20, 100)
	sky_speed4 = math.random(20, 100)
	sky_speed5 = math.random(20, 100)
	
	--font
	font = love.graphics.newFont("VIKING-N.TTF", 25)
		
	
	vestfirdir = math.random(2, 6)
	strandir = math.random(2, 6)
	dalabyggd = math.random(2, 6)
	saudarkrokur = math.random(2, 6)
	budardalur = math.random(2, 6)
	arnarvatnsheidi = math.random(2, 6)
	snaefell = math.random(2, 6)
	borgarnes = math.random(2, 6)
	reykjavik = math.random(2, 6)
	sudurnes = math.random(2, 6)
	selfoss = math.random(2, 6)
	vik = math.random(2, 6)
	hofn = math.random(2, 6)
	austfirdir = math.random(2, 6)
	raufarhofn = math.random(2, 6)
	akureyri = math.random(2, 6)
	myvatn = math.random(2, 6)
	egilsstadir = math.random(2, 6)
	oraefi = math.random(2, 6)
	gullfoss = math.random(2, 6)
    torsmork = math.random(2, 6)
	tingvellir = math.random(2, 6)
	

	--lond = vestfirdir and strandir and dalabyggd, saudarkrokur, budardalur, arnarvatnsheidi, snaefell, borgarnes, reykjavik, sudurnes, selfoss, vik, hofn, austfirdir, raufarhofn, akureyri, myvatn, egilsstadir, oraefi, gullfoss, torsmork, tingvellir
	vopnbyrjun()
	--vopn = vopn1 and vopn2 and vopn4 and vopn5 and vopn6 and vopn7 and vopn8 and vopn9 and vopn10 and vopn11 and vopn12 and vopn13 and vopn14 and vopn15 and vopn16 and vopn17 and vopn18 and vopn19 and vopn20 and vopn21 and vopn22
    valid = "chosen area"
end

function love.update(dt)
    mx, my = love.mouse.getPosition()
	hond:update(dt)
	 
	--Whos turn is it? logic
	ora = math.floor(turn/3) --Við hvert sinn sem breytan turn stækkar um 3, stækkar ora um 1.
	
	if ora % 2 == 0 then -- Þarna skoðum við hvort að talan sé oddatala eða ekki, ora stækar 3 hvert sinn og önnur hver tala er oddatala.
	    arrowrot = 3.14
		arrowx = 1190  --útkoman ef ekki oddatala
		arrowy = 840
		oklikk = true
		aleik = skjoldur
		else                                --breyta % 2 =  allataf oddatal svo ekki oddatala. 1-oddatala 2-ekki oddatala 3-oddatala.......
		arrowrot = 0
		arrowx = 1115 --útkoman ef það er oddatala.
	    arrowy = 790
		oklikk = false
		aleik = exi
		end
		
	--hvitur fáni
	if vestfirdir == 0 then
	    vopn1 = neutral
	end
	if strandir == 0 then
	    vopn2 = neutral
	end
	if dalabyggd == 0 then
	    vopn3 = neutral
	end
	if budardalur == 0 then
	    vopn5 = neutral
	end
	if snaefell == 0 then
	    vopn6 = neutral
	end
	if borgarnes == 0 then
	    vopn20 = neutral
	end
	if arnarvatnsheidi == 0 then
	    vopn19 = neutral
	end
	if saudarkrokur == 0 then
	    vopn4 = neutral
	end
	if reykjavik == 0 then
	    vopn21 = neutral
	end
	if sudurnes == 0 then
	    vopn15 = neutral
	end
	if selfoss == 0 then
	    vopn14 = neutral
	end
	if tingvellir == 0 then
	    vopn22 = neutral
	end
	if gullfoss == 0 then
	    vopn17 = neutral
	end
	if vik == 0 then
	    vopn13 = neutral
	end
	if torsmork == 0 then
	    vopn12 = neutral
	end
	if oraefi == 0 then
	    vopn18 = neutral
	end
	if akureyri == 0 then
	    vopn7 = neutral
	end
	if myvatn == 0 then
	    vopn8 = neutral
	end
	if raufarhofn == 0 then
	    vopn9 = neutral
	end
	if egilsstadir == 0 then
	    vopn16 = neutral
	end
	if austfirdir == 0 then
	    vopn10 = neutral
	end
	if hofn == 0 then
	    vopn11 = neutral
	end
	
	if paused == true then
		return
	end
	
	
	--win conditions
	if vopn1 == skjoldur and vopn2 == skjoldur and vopn4 == skjoldur and vopn5 == skjoldur and vopn6 == skjoldur and vopn7 == skjoldur and vopn8 == skjoldur and vopn9 == skjoldur and vopn10 == skjoldur and vopn11 == skjoldur and vopn12 == skjoldur and vopn13 == skjoldur and vopn14 == skjoldur and vopn15 == skjoldur and vopn16 == skjoldur and vopn17 == skjoldur and vopn18 == skjoldur and vopn19 == skjoldur and vopn20 == skjoldur and vopn21 == skjoldur and vopn22 == skjoldur then
	    win = 1
	else if vopn1 == exi and vopn2 == exi and vopn4 == exi and vopn5 == exi and vopn6 == exi and vopn7 == exi and vopn8 == exi and vopn9 == exi and vopn10 == exi and vopn11 == exi and vopn12 == exi and vopn13 == exi and vopn14 == exi and vopn15 == exi and vopn16 == exi and vopn17 == exi and vopn18 == exi and vopn19 == exi and vopn20 == exi and vopn21 == exi and vopn22 == exi then
	    win = 2
		else
		win = 0
	  end
	end
	
	--Ský
    sky_x = sky_x + sky_speed * dt
	sky_x2 = sky_x2 + sky_speed2  * dt
	sky_x3 = sky_x3 + sky_speed3  * dt
	sky_x4 = sky_x4 + sky_speed4  * dt
	sky_x5 = sky_x5 + sky_speed5  * dt
	
	-- Önd
	ond_x = ond_x + 100 * dt
	ond_y = ond_y - ond_yangle * dt
	
	
	
end
   
	


function love.draw()
    love.graphics.draw(island)
	
	--font draw
	love.graphics.setFont(font)
	--músin og fleira
    love.graphics.setColor(255, 127, 80)
	love.graphics.print(mx, 2, 2)
	love.graphics.print(my, 60, 2)
	love.graphics.print(ora, 50, 40)
	love.graphics.print("Movement value ", 10, 760) 
	love.graphics.print("Who's turn is it?", 930, 730)
	love.graphics.print(turn, 10, 40)
	love.graphics.print(flutningur, 10, 550)
	love.graphics.print(" + " ,19 , 550)
	love.graphics.print("boat", 50, 550)
	love.graphics.print(flutningur, 400, 760)
	love.graphics.print(valid, 10, 730)
	love.graphics.setColor(255, 255, 255)
	
	--Glacier
	love.graphics.setColor(10, 100, 10)
	love.graphics.print("Glacier", 850, 520)
	love.graphics.setColor(255, 255, 255)
	
	--whos turn is it? display-drawing
	love.graphics.draw(exi, 1020, 770, 0, 0.35, 0.35)
	love.graphics.draw(skjoldur, 1200, 770, 0, 0.35, 0.35)
	love.graphics.draw(arrow, arrowx, arrowy, arrowrot, 0.75, 0.75)
	
	love.graphics.setColor(255, 127, 80)
	if turn % 3 == 0 then
	    love.graphics.rectangle("fill", 1090, 760, 20, 20)
		love.graphics.rectangle("fill", 1130, 760, 20, 20)
		love.graphics.rectangle("fill", 1170, 760, 20, 20)
		else if turn % 3 == 1 then
		    love.graphics.rectangle("fill", 1090, 760, 20, 20)
		    love.graphics.rectangle("fill", 1130, 760, 20, 20)
		else if turn % 3 == 2 then
		    love.graphics.rectangle("fill", 1090, 760, 20, 20)
	end
	end
	end
	love.graphics.setColor(255, 255, 255)

	
	
	--skip og bonustala
	love.graphics.draw(skip, -20, 620, 0, 0.25, 0.25)
	love.graphics.setColor(0, 100, 0)
	love.graphics.print("+", 20, 630)
	love.graphics.print(bonustala, 35, 628)
	love.graphics.setColor(255, 255, 255)
	
	
	--generate takkinn
	love.graphics.setColor(smelltr, smelltg, smelltb)
	love.graphics.print("Generate", 20, 800)
	love.graphics.setColor(255, 255, 255)
	
	--Win conditions
	if win == 1 then
	    local font = love.graphics.setNewFont("VIKING-N.TTF", 40)
	    love.graphics.draw(skjoldurwin, 130, 300) 
	    love.graphics.setColor(255, 215, 0)
	    love.graphics.print("Is the conquerer of Iceland!", 400, 400)
		
		love.graphics.setColor(0, 100, 120)
	end
	if win == 2 then
	    local font = love.graphics.setNewFont("VIKING-N.TTF", 40) --Geri þetta til að geta minnkað/stækkað letrið bara í þessu tilfelli.
		love.graphics.draw(exiwin, 130, 300)
		love.graphics.setColor(255, 215, 0)  --textalitur
	    love.graphics.print("Is the conquerer of Iceland!", 400, 400)
		
		love.graphics.setColor(0, 100, 120) --bakgrunnslitur
	end
	
	--if love.keyboard.isDown("h") then
	    --local font = love.graphics.setNewFont("VIKING-N.TTF", 20) 
	    --love.graphics.setColor(255, 127, 80)
	    --love.graphics.print("Conquer Iceland is a game about", 800, 10)
		--love.graphics.setColor(255, 255, 255)
	--end
	
	
	if paused == true then
		return
	end
	
	
	love.graphics.setColor(200, 0, 0)
    love.graphics.print(vestfirdir, 345, 20)
	love.graphics.print(dalabyggd, 400, 210)
	love.graphics.print(strandir, 460, 90)
	love.graphics.print(saudarkrokur, 660, 120)
	love.graphics.print(akureyri, 750, 250)
	love.graphics.print(raufarhofn, 950, 67)
	love.graphics.print(egilsstadir, 1000, 290)
	love.graphics.print(hofn, 1196, 500)
	love.graphics.print(oraefi, 766, 415)
	love.graphics.print(gullfoss, 650, 490)
	love.graphics.print(vik, 732, 752)
	love.graphics.print(selfoss, 503, 640)
	love.graphics.print(sudurnes, 290, 598)
	love.graphics.print(tingvellir, 525, 430)
	love.graphics.print(reykjavik, 390, 500)
	love.graphics.print(borgarnes, 425, 365)
	love.graphics.print(torsmork, 684, 603)
	love.graphics.print(arnarvatnsheidi, 600, 350)
	love.graphics.print(snaefell, 288, 308)
	love.graphics.print(austfirdir, 1120, 320)
	love.graphics.print(budardalur, 520, 250)
	love.graphics.print(myvatn, 822, 343)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.draw(vopn1, 270, 55, 0, 0.25, 0.25) --vestfirdir
	love.graphics.draw(vopn2, 480, 70, 0, 0.25, 0.25)  --strandir
	love.graphics.draw(vopn3, 420, 176, 0, 0.25, 0.25)  --dalabyggð
	love.graphics.draw(vopn4, 570, 200, 0, 0.25, 0.25)  --Sauðárkrókur
	love.graphics.draw(vopn5, 460, 250, 0, 0.25, 0.25)  --Búðardalur
	love.graphics.draw(vopn6, 305, 292, 0, 0.25, 0.25)  --Snæfell
	love.graphics.draw(vopn7, 768, 137, 0, 0.25, 0.25)  --akureyri
	love.graphics.draw(vopn8, 850, 230, 0, 0.25, 0.25)  --mývatn
	love.graphics.draw(vopn9, 880, 55, 0, 0.25, 0.25)  --raufarhöfn
	love.graphics.draw(vopn10, 1158, 300, 0, 0.25, 0.25) --Austfirðir
	love.graphics.draw(vopn11, 1135, 450, 0, 0.25, 0.25) --höfn
	love.graphics.draw(vopn12, 780, 631, 0, 0.25, 0.25) --þórsmörk
	love.graphics.draw(vopn13, 680, 710, 0, 0.25, 0.25) -- vik
	love.graphics.draw(vopn14, 550, 630, 0, 0.25, 0.25) --selfoss
	love.graphics.draw(vopn15, 309, 556, 0, 0.25, 0.25) --suðurnes
	love.graphics.draw(vopn16, 960, 220, 0, 0.25, 0.25) --Egilsstaðir
	love.graphics.draw(vopn17, 590, 500, 0, 0.25, 0.25) -- Gullfoss
	love.graphics.draw(vopn18, 705, 350, 0, 0.25, 0.25) --Öræfi
	love.graphics.draw(vopn19, 625, 300, 0, 0.25, 0.25) --arnarvantsheiði
	love.graphics.draw(vopn20, 411, 385, 0, 0.25, 0.25) -- borgarnes
	love.graphics.draw(vopn21, 402, 490, 0, 0.25, 0.25) --reykjavik
	love.graphics.draw(vopn22, 505, 485, 0, 0.25, 0.25) --Þingvellir
	
	--Endur
	hond:draw(ond_x, ond_y)
	if ond_x > 6000 then
	    ond_x = -300
		ond_y = math.random(1, 750)
		ond_yangle = math.random(-50 , 60)
	end

	
	--Ský
	love.graphics.setColor(255, 255, 255, sky_op)
	love.graphics.draw(sky, sky_x, sky_y, sky_rot, skyscale_x)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.setColor(255, 255, 255, sky_op2)
	love.graphics.draw(sky, sky_x2, sky_y2, sky_rot2, skyscale_x2)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.setColor(255, 255, 255, sky_op3)
	love.graphics.draw(sky, sky_x3, sky_y3, sky_rot3, skyscale_x3)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.setColor(255, 255, 255, sky_op4)
	love.graphics.draw(sky, sky_x4, sky_y4, sky_rot4, skyscale_x4)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.setColor(255, 255, 255, sky_op5)
	love.graphics.draw(sky, sky_x5, sky_y5, sky_rot5, skyscale_x5)
	love.graphics.setColor(255, 255, 255)
	
	if sky_x  > 1600 then
	    sky_x =  math.random(-700, -200)
		sky_y = math.random(1, 750)
		sky_rot = math.random(0, 6)
		skyscale_x = math.random(1, 2)
		sky_op = math.random(130, 255)
		sky_speed = math.random(20, 100)
	end
	if sky_x2 > 1900 then
		sky_x2 =  math.random(-1000, -200)
		sky_y2 = math.random(1, 750)
		sky_rot2 = math.random(0, 6)
		skyscale_x2 = math.random(1, 2.5)
		sky_op2 = math.random(130, 255)
		sky_speed2 = math.random(20, 100)
	end
	if sky_x3 > 1600 then
		sky_x3 =  math.random(-700, -200)
		sky_y3 = math.random(1, 750)
		sky_rot3 = math.random(0, 6)
		skyscale_x3 = math.random(1, 2)
		sky_op3 = math.random(130, 255)
		sky_speed3 = math.random(20, 100)
	end
	if sky_x4 > 1900 then
		sky_x4 =  math.random(-1000, -200)
		sky_y4 = math.random(1, 750)
		sky_rot4 = math.random(0, 6)
		skyscale_x4 = math.random(1, 3)
		sky_op4 = math.random(130, 255)
		sky_speed4 = math.random(20, 100)
	end
	if sky_x5 > 1600 then
	   sky_x5 = math.random(-700, -200)
	   sky_y5 = math.random(1, 750)
	   sky_rot5 = math.random(0, 6)
	   skyscale_x5 = math.random(1, 2)
	   sky_op5 = math.random(130, 255)
	   sky_speed5 = math.random(20, 100)
	end
	
end

function love.mousepressed(x, y, button)
    if button == "l" and x > 30 and x < 208 and y > 790 and y < 860 then
	    paused = false
		smelltr = 255
		smelltg = 255
		smelltb = 255
		
		--Vindhljóð
	    love.audio.play(vindur)
	end
	if button == "l" and x > 270 and x < 325 and y > 60 and y < 111 and (valid == "vestfirdir" or valid == "strandir" or valid == "dalabyggd") then
	 bonustala = math.random(0, 3)
	 turn = turn + 1
	 svadi = "Vestfirdir"
        if flutningur > 0 and vopn1 == vopnid then
	       vestfirdir = vestfirdir + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= vestfirdir and flutningur > 0 then
		    flutningur = 0
			vestfirdir = vestfirdir - 1
			else if flutningur > 0 and vestfirdir <= flutningur + bonustala then
			    vopn1 = vopnid
			    vestfirdir = (flutningur + bonustala) - vestfirdir
				flutningur = 0
				if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			
           end		   
		end
		end
    end		
	
	if button == "l" and x > 485 and x < 537 and y > 80 and y < 130 and (valid == "vestfirdir" or valid == "dalabyggd" or valid == "strandir" or valid == "saudarkrokur") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Strandir"
		 if flutningur > 0 and vopn2 == vopnid then  -- ef uppfyllt þá = flutningur á her milli vinveitta svæða
	       strandir = strandir + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= strandir and flutningur > 0 then -- ef uppfyllt þá = varnarsigur    --Allir þessir flutningar > 0 er til að varna gegn misnotkun, t.d ef það væri ekki í seinasta tilvikinu þá myndi hvert hérað alltaf fá -1 þegar klikkað var á það þótt að flutningur væri 0.
		    flutningur = 0
			strandir = strandir - 1
			    else if flutningur > 0 and strandir <= flutningur + bonustala then--ef ekkert annað er uppfylt þá er = succesfull árás
			    vopn2 = vopnid
			    strandir = (flutningur + bonustala) - strandir
				flutningur = 0
				if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
				end
           end		   
		end
		
	end
	if button == "l" and x > 430 and x < 480 and y > 186 and y < 235 and (valid == "dalabyggd" or valid == "strandir" or valid == "vestfirdir" or valid == "budardalur" or valid == "saudarkrokur")  then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Dalabyggd"
		 if flutningur > 0 and vopn3 == vopnid then
	       dalabyggd = dalabyggd + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= dalabyggd and flutningur > 0 then
		    flutningur = 0
			dalabyggd = dalabyggd - 1
			else if flutningur > 0 and dalabyggd <= flutningur + bonustala then
			    vopn3 = vopnid
			    dalabyggd = (flutningur + bonustala) - dalabyggd
				flutningur = 0
				if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			  end
           end		   
		end
	end
	if button == "l" and x > 575 and x < 625 and y > 210 and y < 260 and (valid == "saudarkrokur" or valid == "strandir" or valid == "dalabyggd" or valid == "budardalur" or valid == "arnarvatnsheidi" or valid == "akureyri") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Saudarkrokur"
		 if flutningur > 0 and vopn4 == vopnid then
	       saudarkrokur = saudarkrokur + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= saudarkrokur and flutningur > 0 then
		    flutningur = 0
			saudarkrokur = saudarkrokur - 1
			else if flutningur > 0 and saudarkrokur <= flutningur + bonustala then
			    vopn4 = vopnid
				saudarkrokur = (flutningur + bonustala) - saudarkrokur
				flutningur = 0
				if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			  end
           end		   
		end
	end
	if button == "l" and x > 460 and x < 520 and y > 260 and y < 310 and (valid == "dalabyggd" or valid == "saudarkrokur" or valid == "arnarvatnsheidi" or valid == "borgarnes" or valid == "snaefell" or valid == "budardalur") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Budardalur"
		 if flutningur > 0 and vopn5 == vopnid then
	       budardalur = budardalur + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= budardalur and flutningur > 0 then
		    flutningur = 0
			budardalur = budardalur - 1
			else if flutningur > 0 and budardalur <= flutningur + bonustala then
			vopn5 = vopnid
			budardalur = (flutningur + bonustala) - budardalur
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
		
	end
	if button == "l" and x > 420 and x < 465 and y > 395 and y < 443 and (valid == "snaefell" or valid == "budardalur" or valid == "arnarvatnsheidi" or valid == "tingvellir" or valid == "reykjavik" or valid == "borgarnes") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Borgarnes"
		 if flutningur > 0 and vopn20 == vopnid then
	       borgarnes = borgarnes + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= borgarnes and flutningur > 0 then
		    flutningur = 0
			borgarnes = borgarnes - 1
			else if flutningur > 0 and borgarnes <= flutningur + bonustala then
			vopn20 = vopnid
			borgarnes = (flutningur + bonustala) - borgarnes
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 307 and x < 360 and y > 304 and y < 350 and (valid == "snaefell" or valid == "budardalur" or valid == "borgarnes") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
	    svadi = "Snaefell"
		 if flutningur > 0 and vopn6 == vopnid then
	       snaefell = snaefell + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= snaefell and flutningur > 0 then
		    flutningur = 0
			snaefell = snaefell - 1
			else if flutningur > 0 and snaefell <= flutningur + bonustala then
			vopn6 = vopnid
			snaefell = (flutningur + bonustala) - snaefell
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 635 and x < 680 and y > 295 and y < 360 and (valid == "arnarvatnsheidi" or valid == "budardalur" or valid == "saudarkrokur" or valid == "akureyri" or valid == "oraefi" or valid == "tingvellir" or valid == "borgarnes") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Arnarvatnsheidi"
		 if flutningur > 0 and  vopn19 == vopnid then
	       arnarvatnsheidi = arnarvatnsheidi + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= arnarvatnsheidi and flutningur > 0 then
		    flutningur = 0
			arnarvatnsheidi = arnarvatnsheidi - 1
			else if flutningur > 0 and arnarvatnsheidi <= flutningur + bonustala then
			vopn19 = vopnid
			arnarvatnsheidi = (flutningur + bonustala) - arnarvatnsheidi
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 770 and x < 820 and y > 150 and y < 200 and (valid == "akureyri" or valid == "saudarkrokur" or valid == "arnarvatnsheidi" or valid == "oraefi" or valid == "myvatn" or valid == "raufarhofn") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Akureyri"
		 if flutningur > 0 and vopn7 == vopnid then
	       akureyri = akureyri + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= akureyri and flutningur > 0 then
		    flutningur = 0
			akureyri = akureyri - 1
			else if flutningur > 0 and akureyri <= flutningur + bonustala then
			vopn7 = vopnid
			akureyri = (flutningur + bonustala) - akureyri
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 855 and x < 900 and y > 240 and y < 290 and (valid == "myvatn" or valid == "oraefi" or valid == "akureyri" or valid == "raufarhofn" or valid == "egilsstadir") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Myvatn"
		 if flutningur > 0 and vopn8 == vopnid then
	       myvatn = myvatn + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= myvatn and flutningur > 0 then
		    flutningur = 0
			myvatn = myvatn - 1
			else if flutningur > 0 and myvatn <= flutningur + bonustala then
			vopn8 = vopnid
			myvatn = (flutningur + bonustala) - myvatn
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 880 and x < 940 and y > 65 and y < 115 and (valid == "egilsstadir" or valid == "raufarhofn" or valid == "austfirdir" or valid == "myvatn" or valid == "akureyri") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Raufarhofn"
		 if flutningur > 0 and vopn9 == vopnid then
	       raufarhofn = raufarhofn + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= raufarhofn and flutningur > 0 then
		    flutningur = 0
			raufarhofn = raufarhofn - 1
			else if flutningur > 0 and raufarhofn <= flutningur + bonustala then
			vopn9 = vopnid
			raufarhofn = (flutningur + bonustala) - raufarhofn
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 960 and x < 1000 and y > 220 and y < 280 and (valid == "egilsstadir" or valid == "raufarhofn" or valid == "austfirdir" or valid == "myvatn") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Egilsstadir"
		 if flutningur > 0 and vopn16 == vopnid then
	       egilsstadir = egilsstadir + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= egilsstadir and flutningur > 0 then
		    flutningur = 0
			egilsstadir = egilsstadir - 1
			else if flutningur > 0 and egilsstadir <= flutningur + bonustala then
			vopn16 = vopnid
			egilsstadir = (flutningur + bonustala) - egilsstadir
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 1165 and x < 1200 and y > 305 and y < 360 and (valid == "austfirdir" or valid == "raufarhofn" or valid == "egilsstadir" or valid == "hofn") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Austfirdir"
		 if flutningur > 0 and vopn10 == vopnid then
	       austfirdir = austfirdir + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= austfirdir and flutningur > 0 then
		    flutningur = 0
			austfirdir = austfirdir - 1
			else if  flutningur > 0 and austfirdir <= flutningur + bonustala then
			vopn10 = vopnid
			austfirdir = (flutningur + bonustala) - austfirdir
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 1140 and x < 1190 and y > 450 and y < 500 and (valid == "hofn" or valid == "austfirdir" or valid == "vik" or valid == "torsmork") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Hofn"
		 if flutningur > 0 and vopn11 == vopnid then
	       hofn = hofn + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= hofn and flutningur > 0 then
		    flutningur = 0
			hofn = hofn - 1
			else if flutningur > 0 and hofn <= flutningur + bonustala then
			vopn11 = vopnid
			hofn = (flutningur + bonustala) - hofn
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 784 and x < 825 and y > 635 and y < 690 and (valid == "torsmork" or valid == "hofn" or valid == "vik" or valid == "selfoss" or valid == "gullfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Torsmork"
		 if flutningur > 0 and vopn12 == vopnid then
	       torsmork = torsmork + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= torsmork and flutningur > 0 then
		    flutningur = 0
			torsmork = torsmork - 1
			else if flutningur > 0 and torsmork <= flutningur + bonustala then
			vopn12 = vopnid
			torsmork = (flutningur + bonustala) - torsmork
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 683 and x < 735 and y > 725 and y < 770 and (valid == "vik" or valid == "hofn" or valid == "torsmork" or valid == "selfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Vik"
		 if flutningur > 0 and vopn13 == vopnid then
	       vik = vik + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= vik and flutningur > 0 then
		    flutningur = 0
			vik = vik - 1
			else if  flutningur > 0 and vik <= flutningur + bonustala then
			vopn13 = vopnid
			vik = (flutningur + bonustala) - vik
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 590 and x < 640 and y > 505 and y < 560 and (valid == "gullfoss" or valid == "tingvellir" or valid == "oraefi" or valid == "torsmork" or valid == "selfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Gullfoss"
		 if flutningur > 0 and vopn17 == vopnid then
	       gullfoss = gullfoss + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= gullfoss and flutningur > 0 then
		    flutningur = 0
			gullfoss = gullfoss - 1
			else if flutningur > 0 and gullfoss <= flutningur + bonustala then
			vopn17 = vopnid
			gullfoss = (flutningur + bonustala) - gullfoss
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 555 and x < 600 and y > 640 and y < 690 and (valid == "selfoss" or valid == "vik" or valid == "torsmork" or valid == "gullfoss" or valid == "tingvellir" or valid == "reykjavik" or valid == "sudurnes") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Selfoss"
		 if flutningur > 0 and vopn14 == vopnid then
	       selfoss = selfoss + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= selfoss and flutningur > 0 then
		    flutningur = 0
			selfoss = selfoss - 1
			else if flutningur > 0 and selfoss <= flutningur + bonustala then
			vopn14 = vopnid
			selfoss = (flutningur + bonustala) - selfoss
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 510 and x < 550 and y > 490 and y < 540 and (valid == "tingvellir" or valid == "selfoss" or valid == "reykjavik" or valid == "borgarnes" or valid == "arnarvatnsheidi" or valid == "gullfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Tingvellir"
		 if flutningur > 0 and vopn22 == vopnid then
	       tingvellir = tingvellir + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= tingvellir and flutningur > 0 then
		    flutningur = 0
			tingvellir = tingvellir - 1
			else if flutningur > 0 and tingvellir <= flutningur + bonustala then
			vopn22 = vopnid
			tingvellir = (flutningur + bonustala) - tingvellir
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 315 and x < 365 and y > 570 and y < 615 and (valid == "sudurnes" or valid == "reykjavik" or valid == "selfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Sudurnes"
		 if flutningur > 0 and vopn15 == vopnid then
	       sudurnes = sudurnes + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= sudurnes and flutningur > 0 then
		    flutningur = 0
			sudurnes = sudurnes - 1
			else if flutningur > 0 and sudurnes <= flutningur + bonustala then
			vopn15 = vopnid
			sudurnes = (flutningur + bonustala) - sudurnes
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 405 and x < 460 and y > 500 and y < 550 and (valid == "reykjavik" or valid == "sudurnes" or valid == "selfoss" or valid == "tingvellir" or valid == "borgarnes") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Reykjavik"
		 if flutningur > 0 and vopn21 == vopnid then
	       reykjavik = reykjavik + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= reykjavik and flutningur > 0 then
		    flutningur = 0
			reykjavik = reykjavik - 1
			else if  flutningur > 0 and reykjavik <= flutningur + bonustala then
			vopn21 = vopnid
			reykjavik = (flutningur + bonustala) - reykjavik
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	if button == "l" and x > 713 and x < 760 and y > 355 and y < 405 and (valid == "oraefi" or valid == "myvatn" or valid == "akureyri" or valid == "arnarvatnsheidi" or valid == "gullfoss") then
	    bonustala = math.random(0, 3)
		turn = turn + 1
		svadi = "Oraefi"
		 if flutningur > 0 and vopn18 == vopnid then
	       oraefi = oraefi + flutningur
		   flutningur = 0
		   else if flutningur + bonustala <= oraefi and flutningur > 0 then
		    flutningur = 0
			oraefi = oraefi - 1
			else if  flutningur > 0 and oraefi <= flutningur + bonustala then
			vopn18 = vopnid
			oraefi = (flutningur + bonustala) - oraefi
			flutningur = 0
			if vopnid == exi then
				    love.audio.play(exis)
					else
					love.audio.play(skjolds)
				end
			end
           end		   
		end
	end
	
	
	
	
	
	
	
	if button == "r" and x > 270 and x < 325 and y > 60 and y < 111 and vestfirdir > 1 then
	
	if vopn1 == aleik  then  --aleik skiptist alltaf með örinni (skjoldur eða exi)
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   vestfirdir = vestfirdir - 1
	   vopnid = vopn1
	   valid = "vestfirdir"
	   love.audio.play(skjolds)
	end
	if button == "r" and x > 485 and x < 537 and y > 80 and y < 130 and strandir > 1 then
	
	if vopn2 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   strandir = strandir - 1
	   vopnid = vopn2
	   valid = "strandir"
	  
	end
	
	if button == "r" and x > 430 and x < 480 and y > 186 and y < 235 and dalabyggd > 1 then
	
	if vopn3 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   dalabyggd = dalabyggd - 1
	   vopnid = vopn3
	   valid = "dalabyggd"
	  
	end
	if button == "r" and x > 575 and x < 625 and y > 210 and y < 260 and saudarkrokur > 1 then
	
	if vopn4 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   saudarkrokur = saudarkrokur - 1
	   vopnid = vopn4
	   valid = "saudarkrokur"
		
	end
	if button == "r" and x > 460 and x < 520 and y > 260 and y < 310 and budardalur > 1 then
    
    if vopn5 == aleik  then  
	      -- Do nothing
		else
		    return
	end	
	
	   flutningur = flutningur + 1
	   budardalur = budardalur - 1
	   vopnid = vopn5
	   valid = "budardalur"
	end
	if button == "r" and x > 420 and x < 465 and y > 395 and y < 443 and borgarnes > 1 then
	  
	if vopn20 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	  
	   flutningur = flutningur + 1
	   borgarnes = borgarnes - 1
	   vopnid = vopn20
	   valid = "borgarnes"
	end
	if button == "r" and x > 307 and x < 360 and y > 304 and y < 350 and snaefell > 1 then
	   
	if vopn6 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   snaefell = snaefell - 1
	   vopnid = vopn6
	   valid = "snaefell"
	end
	if button == "r" and x > 635 and x < 680 and y > 295 and y < 360 and arnarvatnsheidi > 1 then
	
	if vopn19 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   arnarvatnsheidi = arnarvatnsheidi - 1
	   vopnid = vopn19
	   valid = "arnarvatnsheidi"
	end
	if button == "r" and x > 770 and x < 820 and y > 150 and y < 200 and akureyri > 1 then
	
	if vopn7 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   akureyri = akureyri - 1
	   vopnid = vopn7
	   valid = "akureyri"
	end
	if button == "r" and x > 855 and x < 900 and y > 240 and y < 290 and myvatn > 1 then
	
	if vopn8 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   myvatn = myvatn - 1
	   vopnid = vopn8
	   valid = "myvatn"
	end
	if button == "r" and x > 880 and x < 940 and y > 65 and y < 115 and raufarhofn > 1 then
	
	if vopn9 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   raufarhofn = raufarhofn - 1
	   vopnid = vopn9
	   valid = "raufarhofn"
	end
	if button == "r" and x > 960 and x < 1000 and y > 220 and y < 280 and egilsstadir > 1 then
	
	if vopn16 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	  flutningur = flutningur + 1
	   egilsstadir = egilsstadir - 1
	   vopnid = vopn16
	   valid = "egilsstadir"
	end
	if button == "r" and x > 1165 and x < 1200 and y > 305 and y < 360 and austfirdir > 1 then
	
	if vopn10 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   austfirdir = austfirdir - 1
	   vopnid = vopn10
	   valid = "austfirdir"
	end
	if button == "r" and x > 1140 and x < 1190 and y > 450 and y < 500 and hofn > 1 then
	
	if vopn11 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   hofn = hofn - 1
	   vopnid = vopn11
	   valid = "hofn"
	end
	if button == "r" and x > 784 and x < 825 and y > 635 and y < 690 and torsmork > 1 then
	
	if vopn12 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   torsmork = torsmork - 1
	   vopnid = vopn12
	   valid = "torsmork"
	end
	if button == "r" and x > 683 and x < 735 and y > 725 and y < 770 and vik > 1 then
	
	if vopn13 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   vik = vik - 1
	   vopnid = vopn13
	   valid = "vik"
	end
	if button == "r" and x > 590 and x < 640 and y > 505 and y < 560 and gullfoss > 1 then
	
	if vopn17 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   gullfoss = gullfoss - 1
	   vopnid = vopn17
	   valid = "gullfoss"
	end
	if button == "r" and x > 555 and x < 600 and y > 640 and y < 690 and selfoss > 1 then
	
	if vopn14 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   selfoss = selfoss - 1
	   vopnid = vopn14
	   valid = "selfoss"
	end
	if button == "r" and x > 510 and x < 550 and y > 490 and y < 540 and tingvellir > 1 then
	
	if vopn22 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   tingvellir = tingvellir - 1
	   vopnid = vopn22
	   valid = "tingvellir"
	end
	if button == "r" and x > 315 and x < 365 and y > 570 and y < 615 and sudurnes > 1 then
	
	if vopn15 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   sudurnes = sudurnes - 1
	   vopnid = vopn15
	   valid = "sudurnes"
		
	end
	if button == "r" and x > 405 and x < 460 and y > 500 and y < 550 and reykjavik > 1 then
	
	if vopn21 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	   flutningur = flutningur + 1
	   reykjavik = reykjavik - 1
	   vopnid = vopn21
	   valid = "reykjavik"
	end
	if button == "r" and x > 713 and x < 760 and y > 355 and y < 405 and oraefi > 1 then
	
	if vopn18 == aleik  then  
	      -- Do nothing
		else
		    return
	end
	
	  flutningur = flutningur + 1
	  oraefi = oraefi - 1
	  vopnid = vopn18
	  valid = "oraefi"
	 end
	 
	 --Endur - hljóð
	if button == "r" and x > ond_x and x < (ond_x + 119) and y > ond_y and y < (ond_y + 100) then  -- Ef ég ætla klikka á eitthvað sem hreyfist nota ég hnitin sme hluturinn hreyfist á. +119 er stærð myndarinnar á x-ás. 
	    love.audio.play(quack)                                                                   -- +100 er stærð myndarinnar á y-ás. Með þessu er ég með litinn kassa sem hreyfist með myndinni og aðeins ef x-y hnit músarinnar eru í þeim þá vrikar klikkið.
	end                                                                                       	--Kassinn er þá eins og myndin, 119X100.
	
end	




function vopnbyrjun()

    vopn1 = math.random(1, 2)
	vopn2 = math.random(1, 2)
	vopn3 = math.random(1, 2)
	vopn4 = math.random(1, 2)
	vopn5 = math.random(1, 2)
	vopn6 = math.random(1, 2)
	vopn7 = math.random(1, 2)
	vopn8 = math.random(1, 2)
	vopn9 = math.random(1, 2)
	vopn10 = math.random(1, 2)
	vopn11 = math.random(1, 2)
	vopn12 = math.random(1, 2)
	vopn13 = math.random(1, 2)
	vopn14 = math.random(1, 2)
	vopn15 = math.random(1, 2)
	vopn16 = math.random(1, 2)
	vopn17 = math.random(1, 2)
	vopn18 = math.random(1, 2)
	vopn19 = math.random(1, 2)
	vopn20 = math.random(1, 2)
	vopn21 = math.random(1, 2)
	vopn22 = math.random(1, 2)

    if vopn1 == 1 then
	    vopn1 = skjoldur
	else
	    vopn1 = exi
	end
	
	if vopn2 == 1 then
	    vopn2 = skjoldur
	else
	    vopn2 = exi
	end
	
	if vopn3 == 1 then
	    vopn3 = skjoldur
	else
	    vopn3 = exi
	end
	
	if vopn4 == 1 then
	    vopn4 = skjoldur
	else
	    vopn4 = exi
	end
	
	if vopn5 == 1 then
	    vopn5 = skjoldur
	else
	    vopn5 = exi
	end
	
	if vopn6 == 1 then
	    vopn6 = skjoldur
	else
	    vopn6 = exi
	end
	
	if vopn7 == 1 then
	    vopn7 = skjoldur
	else
	    vopn7 = exi
	end
	
	if vopn8 == 1 then
	    vopn8 = skjoldur
	else
	    vopn8 = exi
	end
	
	if vopn9 == 1 then
	    vopn9 = skjoldur
	else
	    vopn9 = exi
	end
	
	if vopn10 == 1 then
	    vopn10 = skjoldur
	else
	    vopn10 = exi
	end
	
	if vopn11 == 1 then
	    vopn11 = skjoldur
	else
	    vopn11 = exi
	end
	
	if vopn12 == 1 then
	    vopn12 = skjoldur
	else
	    vopn12 = exi
	end
	
	if vopn13 == 1 then
	    vopn13 = skjoldur
	else
	    vopn13 = exi
	end
	
	if vopn14 == 1 then
	    vopn14 = skjoldur
	else
	    vopn14 = exi
	end
	
	if vopn15 == 1 then
	    vopn15 = skjoldur
	else
	    vopn15 = exi
	end
	
	if vopn16 == 1 then
	    vopn16 = skjoldur
	else
	    vopn16 = exi
	end
	
	if vopn17 == 1 then
	    vopn17 = skjoldur
	else
	    vopn17 = exi
	end
	
	if vopn18 == 1 then
	    vopn18 = skjoldur
	else
	    vopn18 = exi
	end
	
	if vopn19 == 1 then
	    vopn19 = skjoldur
	else
	    vopn19 = exi
	end
	
	if vopn20 == 1 then
	    vopn20 = skjoldur
	else
	    vopn20 = exi
	end
	
	if vopn21 == 1 then
	    vopn21 = skjoldur
	else
	    vopn21 = exi
	end
	
	if vopn22 == 1 then
	    vopn22 = skjoldur
	else
	    vopn22 = exi
	end
end


