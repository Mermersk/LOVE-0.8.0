

function love.load()

    love.graphics.setMode(1000, 800)
    p = love.graphics.newImage("p.png")
	jii = love.graphics.newParticleSystem(p, 1000)
    jii:setEmissionRate          (20)   --nauðsynlegt, virkar ekki án þess = N
	jii:setLifetime              (1)  --ekki nauðsynlegt = EN
    jii:setParticleLife          (10)  --N, setur hversu lengi hver particle lífir.
    jii:setPosition              (50, 50) --EN
    jii:setDirection             (4.40)  --EN
    jii:setSpread                (0.5)  --EN
    jii:setSpeed                 (40, 40)  --EN, en annars fer allt í beina linu!! Stærri tölur = allt fer í allar áttir.
    jii:setGravity               (40, 50)  --EN, setur þyngdarafl, um hversu mikið fer það niður á Y-ás.
    jii:setRadialAcceleration    (30, 31)  --EN, Setur hraðann frá the emitter.
    jii:setTangentialAcceleration(20, 30)  --EN
    jii:setSizes                  (1, 0.1)  --EN Setur stærðirnar á the particles. Hér teiknar hann SAMA PARTICLEINN fyrst venjulega stærð, svo miklu minni, svo tvöfalt stærri, svo svo mikluklu minni og repeat.
    jii:setSizeVariation         (1)  --EN, setur hversu mikill stærðarmunir skulu vera, 0 = enginn 1 = fullt.
    jii:setRotation              (0)  --EN, setur hvernig myndinn snýst þegar hhún kemur út úr the emitter.
    jii:setSpin                  (0, 1)  --EN, setur hversu ikið the particle spinnar í radians eftir að hún er til, sést ekki á hringi...
   
   ex = love.graphics.newImage("ex.png")
   exe = love.graphics.newParticleSystem(ex, 300)
   exe:setEmissionRate(40)
   exe:setParticleLife(2)
   exe:setDirection(1)
   exe:setSpeed(30, 40)
   exe:setSizes(1, 1.2, 0.8)
   exe:setSpread(0.5)
   exe:setColors(255, 0, 0, 220, 50, 200, 0, 200)
   
   sno = love.graphics.newImage("sno.png")
   snoh = love.graphics.newParticleSystem(sno, 500)
   snoh:setEmissionRate(10)
   snoh:setParticleLife(6)
   snoh:setSpeed(100, 120)
   snoh:setGravity(40, 75)
   snoh:setColors(255, 215, 0, 255,    0, 0, 0, 255)
   snoh:setDirection(0)
   snoh:setSpread(6)
   snoh:setSpin(20, 25, 1)
   snoh:setRotation(1, 6)
   
   dropi = love.graphics.newImage("dropi.png")
   dropih = love.graphics.newParticleSystem(dropi, 10000)
   dropih:setEmissionRate(13)
   dropih:setParticleLife(100)
   dropih:setSpeed(30, 35)
   dropih:setDirection(3.14)
   dropih:setSpread(6.14)
   dropih:setGravity(0.2)
   
   regn = love.graphics.newImage("regn.png")
   regnh = love.graphics.newParticleSystem(regn, 100000)
   regnh:setEmissionRate(20)
   regnh:setSpeed(300, 310)
   regnh:setParticleLife(50)
   regnh:setDirection(1.20)
   regnh:setSpread(1)
   regnh:setGravity(30, 35)
   --regnh:setTangentialAcceleration(300, 301)  --Setur hraðann á particleinu eftir að hann er kominn út, ss í gagnstæða átt.
   regnh:setRadialAcceleration(300, 301) --Eykur hraðann á particleinu um 300 á hverri sekúndu eftir að hann er kominn út.
  
end

function love.update(dt)
    jii:update(dt)
	jii:start()

	exe:update(dt)
	exe:start()
	
	snoh:update(dt)
	snoh:start()
	
	dropih:update(dt)
	dropih:start()
	
	regnh:update(dt)
	regnh:start()
end

function love.draw()

    love.graphics.draw(jii, 1, 300)
	
	love.graphics.draw(snoh, 400, -50, 0, 0.3, 0.3)
	
	love.graphics.draw(dropih, 400, 400, 0, 0.20, 0.20)
	
	love.graphics.draw(regnh, 600, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 550, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 500, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 450, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 400, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 350, 400, 0.50, 0.10, 0.10)
	
	--love.graphics.draw(regnh, 300, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 250, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 200, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 150, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 100, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 50, 400, 0, 0.10, 0.10)
	--love.graphics.draw(regnh, 0, 400, 0, 0.10, 0.10)

end

