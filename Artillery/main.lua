-- Artillery Idea
require("AnAL")
function love.load()
    love.graphics.setMode(500, 800)
	love.graphics.setBackgroundColor(255, 255, 255)
    byssa = love.graphics.newImage("byssa2.png")
	base = love.graphics.newImage("base.png")
	kula = love.graphics.newImage("kula.png")
	kulah = newAnimation(kula, 42, 54, 0.1, 0)
	reykur = love.graphics.newImage("reykur.png")
	reykh = newAnimation(reykur, 210, 210, 0.05, 0)
	
	fire = false
	go = false
	
	
    b_snu = 3.45
	byssa_x = 120
	
	k_snu = 1.5
	kula_x = 140
	kula_y = 360
	
	
	
	
end

function love.update(dt)
    mx, my = love.mouse.getPosition()
    if love.keyboard.isDown("down") and b_snu > 3.42 and b_snu < 4.80 then
	    b_snu = b_snu + 0.01 
		byssa_x = byssa_x - 0.5
		    if go == false then   -- Hér er ég að setja annað skilyrði, hin skilyrðin gilda lika en aðgerðir fyrir neðan hér fara eftir go breytunni lika
		    kula_x = kula_x + 68 * dt
		    kula_y = kula_y + 60 * dt
			end
	end
	
	if love.keyboard.isDown("up") and b_snu > 3.44 and b_snu < 4.82 then
	    b_snu = b_snu - 0.01 
		byssa_x = byssa_x + 0.5
		    if go == false then
		    kula_x = kula_x - 68 * dt
		    kula_y = kula_y - 60 * dt
		    end
	end
	
	if go == true then
	    kula_x = kula_x + 100 *dt
		kula_y = kula_y - 5 * dt
		
    end
	
	if kula_x >  1450 then
	    go = false
		fire = false
		kula_x = 140
	    kula_y = 360
	end
	
	
	reykh:update(dt)
    kulah:update(dt)
end

function love.draw()
    love.graphics.setColor(10, 0, 200)
    love.graphics.print(mx, 5, 2)
	love.graphics.print(my, 40, 2)
	love.graphics.print(b_snu, 90, 2)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.draw(byssa, byssa_x, 580, b_snu)
	love.graphics.draw(base, -20, 450, 0, 1.5, 1.5)
	
	love.graphics.setColor(10, 130, 10)
	love.graphics.rectangle("fill", 0, 570, 2000, 500)
	love.graphics.setColor(255, 255, 255)
	
	if fire == true then
	    kulah:draw(kula_x, kula_y, k_snu)
		--reykh:draw(0, 420)
	end
end

function love.keypressed(key)

    if key == " " then
	    fire = true
		go = true
	end
end