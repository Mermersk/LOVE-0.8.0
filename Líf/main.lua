
require("conf")
camera = require("camera")

function love.load()
    
    bakteria = love.graphics.newImage("bakteria.png")
	bakteriai = love.image.newImageData("bakteria.png")
	love.graphics.setBackgroundColor(0, 128, 128)
	start = love.audio.newSource("start.ogg")
	stop = love.audio.newSource("stop.ogg")
	vatn = love.audio.newSource("vatn.ogg")
	vatn:isLooping(true)
	start:setVolume(0.5)
	stop:setVolume(0.5)
	Letur = love.graphics.setNewFont("Decibel_2.ttf", 50)
	cam = camera:new()
	das_zoom = 0.05
	cam_x = 0
	cam_y = 0
	
	timi = 0
	paused = true
	arekstur = false
	mark = 1
	
	founders()
	regn()
	
end

function love.update(dt)

   collision()
	
	cam:zoomTo(das_zoom)
	cam:lookAt(cam_x, cam_y)
	
	--lengd á milli LU og DU Með hjálp Pýþagoras, við vitum alltaf alltaf lengdina á milli á X-ás og á Y-ás, þá vitum við a og b og getum fundið hliðina c með pýþagóras
	lengd = math.sqrt((founders[1].bak_x - founders[2].bak_x) * (founders[1].bak_x - founders[2].bak_x) + (founders[1].bak_y - founders[2].bak_y) * (founders[1].bak_y - founders[2].bak_y)) 
	

	if paused == false then    --Start takkin, litir og texti
	    start_red = 100
		start_green = 0
		start_text = "Pause"
	else
	    start_red = 0
		start_green = 100
		start_text = "Start"
	end

    if paused == true then
	    return 
	end

    
	
	regnh:start()
	regnh:update(dt)
	
    
	for lykill, gildi in pairs(founders) do
	
	
	
	    if arekstur == true then
		    paused = true
		
		else
	        gildi.bak_y = gildi.bak_y + gildi.bak_speed * math.sin(gildi.bak_horn) *dt
	        gildi.bak_x = gildi.bak_x + gildi.bak_speed * math.cos(gildi.bak_horn) *dt
		end
		
		gildi.lif = gildi.lif + 1*dt 
		if gildi.lif > 4.9 then
		    gildi.bak_horn = math.random(0, 6) + math.random()
			gildi.lif = math.random(-10, 0)  --hvert lif gildi(fyrir hverja lif breytu í töflunni founders) fær tölu á milli -10 og 0, stundum er lengri timi þangað til að stefnan breytist, stundum ekki.
		end
		
		if lengd < 300 then 
		    founders[1].bak_horn = math.random(0, 6.14)
			founders[2].bak_horn = math.random(0, 6.14)
		end
		
		
	end
	

	

end

function love.draw()
    love.graphics.setFont(Letur)
	
    love.graphics.setColor(start_red, start_green, 0, 255)
	love.graphics.rectangle("fill", 1065, 690, 200, 50) 
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(start_text, 1075, 695)
	
	love.graphics.setColor(0, 250, 0, 255)
	love.graphics.print(math.floor(timi), 10, 10)
    love.graphics.print(math.floor(timi%5), 110, 10)
	love.graphics.print(das_zoom, 200, 10)
	love.graphics.print(math.cos(founders[2].bak_horn), 1050, 10)
	love.graphics.print(math.sin(founders[2].bak_horn), 1050, 40)
	love.graphics.print(math.floor(lengd), 1050, 100)
	love.graphics.print(math.floor(m15), 1050, 200)
	love.graphics.print(math.floor(mark), 1050, 300)
	
	--love.graphics.print(k[1], 1050, 300)
	--love.graphics.print(math.floor(gildi.bak_x), 400, 10)  --Breytan er bak_x er í töflu Lu, þar með lika allar hinar breyturnar.
	--love.graphics.print(math.floor(gildi.bak_y), 475, 10)
	
	pos_x, pos_y = cam:pos()
	--love.graphics.print(pos_x, 900, 10)
	--love.graphics.print(pos_y, 1000, 10)
	
	love.graphics.print(math.floor(love.mouse.getX()), 700, 10)
	love.graphics.print(math.floor(love.mouse.getY()), 800, 10)
	love.graphics.setColor(255, 255, 255)
	
	cam:attach()
	
	for lykill, gildi in pairs(founders) do
	    love.graphics.draw(regnh, gildi.bak_x - 120, gildi.bak_y - 120, gildi.bak_horn + 3.14, 0.50, 0.50)
		love.graphics.draw(regnh, gildi.bak_x + 120, gildi.bak_y + 120, gildi.bak_horn + 3.14, 0.50, 0.50)
		love.graphics.draw(regnh, gildi.bak_x + 120, gildi.bak_y - 120, gildi.bak_horn + 3.14, 0.50, 0.50)
		love.graphics.draw(regnh, gildi.bak_x - 120, gildi.bak_y + 120, gildi.bak_horn + 3.14, 0.50, 0.50)
		
		love.graphics.setColor(gildi.red, gildi.green, gildi.blue)
	    love.graphics.draw(bakteria, gildi.bak_x, gildi.bak_y, 0, 2, 2, 150, 150)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print(gildi.nafn, gildi.bak_x - 150, gildi.bak_y - 300, 0, 2, 2)
		
	end
	
	
	cam:detach()
end

function love.mousepressed(x, y, button)

    if button == "wu" and das_zoom < 2 then
	    das_zoom = das_zoom + 0.1
		cam_x, cam_y = cam:mousepos() --Með Þvi að nota þetta í cam-safninu þá getur það soomað allstaðar, en ekki bara 1200x800 gluggi ef maður notar bara cam_x = love.mouse.getX()...
	end
	if button == "wd" and das_zoom > 0.06 then  --Seinnna er svo að zoomið fari ekki í minus tölu, annars hvolfast allt :S Enda lika nægilegt zoom.
	    das_zoom = das_zoom - 0.1
		cam_x = 0  --Endurstaðsetur kameruna í miðjuna, ef það væri ekki þá týnist maður bara, þar sem maður getur farið endalust með kameruna til hliðar og up/niður.
		cam_y = 0
		das_zoom = 0.05
	end
	
	if button == "l" and x > 1090 and y > 690 and y < 740 and paused == true then
	    paused = false
		love.audio.play(start)
	else if button == "l" and x > 1090 and y > 690 and y < 740 and paused == false then
	    paused = true
		love.audio.play(stop)
	  end
	end
	
	if button == "r" then 
	    founders[2].bak_horn = founders[2].bak_horn + 0.3
	end
		
end

function founders()
     
	founders = { 
	
	{nafn = "Lu", bak_x = math.random(-5000, 5000), bak_y = math.random(-5000, 5000),  bak_horn = math.random(0.0, 6.14), bak_speed = math.random(500, 2000), lif = 0, red = math.random(0, 255), green = math.random(0, 255), blue = math.random(0, 255)},  --Bakteria 1
	
	{nafn = "Du", bak_x = math.random(-5000, 5000), bak_y = math.random(-5000, 5000),  bak_horn = math.random(0.0, 6.14), bak_speed = math.random(500, 2000), lif = 0, red = math.random(0, 255), green = math.random(0, 255), blue = math.random(0, 255)},
	
	{nafn = "Sol", bak_x = math.random(-5000, 5000), bak_y = math.random(-5000, 5000),  bak_horn = math.random(0.0, 6.14), bak_speed = math.random(500, 2000), lif = 0, red = math.random(0, 255), green = math.random(0, 255), blue = math.random(0, 255)},
	
	{nafn = "Vu", bak_x = math.random(-5000, 5000), bak_y = math.random(-5000, 5000),  bak_horn = math.random(0.0, 6.14), bak_speed = math.random(500, 2000), lif = 0, red = math.random(0, 255), green = math.random(0, 255), blue = math.random(0, 255)},
	
	{nafn = "Ro", bak_x = math.random(-5000, 5000), bak_y = math.random(-5000, 5000),  bak_horn = math.random(0.0, 6.14), bak_speed = math.random(500, 2000), lif = 0, red = math.random(0, 255), green = math.random(0, 255), blue = math.random(0, 255)}
	
	}
	
	


end

function boltar()

end

function collision()
    
	for lykill, gildi in pairs(founders) do
	    if gildi.bak_x < -11900 then    
	        gildi.bak_horn = gildi.bak_horn + 6
		end
		if gildi.bak_y < -7900 then
	        gildi.bak_horn = gildi.bak_horn - 6
	    end
	    if gildi.bak_x > 11900 then                 --Þegar búið er að zooma alveg út er gamesvæðið circa 24000x16000
	        gildi.bak_horn = gildi.bak_horn + 6
	    end
	    if gildi.bak_y > 7900 then
	        gildi.bak_horn = gildi.bak_horn - 6
	    end
	end
		
		m12 = pyth(founders[1].bak_x, founders[2].bak_x, founders[1].bak_y, founders[2].bak_y)
	    m13 = pyth(founders[1].bak_x, founders[3].bak_x, founders[1].bak_y, founders[3].bak_y)
	    m14 = pyth(founders[1].bak_x, founders[4].bak_x, founders[1].bak_y, founders[4].bak_y)
	    m15 = pyth(founders[1].bak_x, founders[5].bak_x, founders[1].bak_y, founders[5].bak_y)
		
		m22 = pyth(founders[2].bak_x, founders[2].bak_x, founders[2].bak_y, founders[2].bak_y)
		m23 = pyth(founders[2].bak_x, founders[3].bak_x, founders[2].bak_y, founders[3].bak_y)
		m24 = pyth(founders[2].bak_x, founders[4].bak_x, founders[2].bak_y, founders[4].bak_y)
		m25 = pyth(founders[2].bak_x, founders[5].bak_x, founders[2].bak_y, founders[5].bak_y)
		
		
		m33 = pyth(founders[3].bak_x, founders[3].bak_x, founders[3].bak_y, founders[3].bak_y)
		m34 = pyth(founders[3].bak_x, founders[4].bak_x, founders[3].bak_y, founders[4].bak_y)
		m35 = pyth(founders[3].bak_x, founders[5].bak_x, founders[3].bak_y, founders[5].bak_y)
		
		m44 = pyth(founders[4].bak_x, founders[4].bak_x, founders[4].bak_y, founders[4].bak_y)
		m45 = pyth(founders[4].bak_x, founders[5].bak_x, founders[4].bak_y, founders[5].bak_y)
		
		m55 = pyth(founders[5].bak_x, founders[5].bak_x, founders[5].bak_y, founders[5].bak_y)
		
	if m12 < 300 then
	    founders[1].bak_horn = founders[1].bak_horn + 3.14
		founders[2].bak_horn = founders[2].bak_horn + 3.14
	end
	if m13 < 300 then
	    founders[1].bak_horn = founders[1].bak_horn + 3.14
		founders[3].bak_horn = founders[3].bak_horn + 3.14
	end
	if m14 < 300 then
	    founders[1].bak_horn = founders[1].bak_horn + 3.14
		founders[4].bak_horn = founders[4].bak_horn + 3.14
	end
	if m15 < 300 then
	    founders[1].bak_horn = founders[1].bak_horn + 3.14
		founders[5].bak_horn = founders[5].bak_horn + 3.14
	end
	
        	
		
		
		
		
		
    
	
	

end

function baby()




end

function regn()

    
   regn = love.graphics.newImage("regn.png")
   regnh = love.graphics.newParticleSystem(regn, 100000)
   regnh:setEmissionRate(20)
   regnh:setSpeed(300, 310)
   regnh:setParticleLife(3)
   regnh:setDirection(0)
   regnh:setSpread(2)
   regnh:setSpin(0, 3, 0.8)
   
   --regnh:setSizes(0.5, 1, 2)
   --regnh:setGravity(30, 35)
   --regnh:setTangentialAcceleration(300, 301)  --Setur hraðann á particleinu eftir að hann er kominn út, ss í gagnstæða átt.
   regnh:setRadialAcceleration(300, 301) --Eykur hraðann á particleinu um 300 á hverri sekúndu eftir að hann er kominn út.

  
end

function pyth(x1, x2, y1, y2)  --Pýþagóras functionið, get þá gert hvar sem er pyth(x-hnit hlutars 1, x-hnit hlutars 2, y-hnit hlutars 1, y-hnit hlutars 2) og fengið út lengdina á mili þeirra!
    return math.sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2))
end
