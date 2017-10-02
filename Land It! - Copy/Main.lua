require("AnAL")

function love.load()
    love.graphics.setBackgroundColor(100, 149, 237, 255)
	ferjah = love.graphics.newImage("ferjah.png")
	ferja = love.graphics.newImage("ferja.png")
    mynd = love.graphics.newImage("flugv.png")
	grant = love.graphics.newImage("grant.png")
	sky = love.graphics.newImage("sky.png")
    myndh = newAnimation(mynd, 300, 60, 0.5, 0)
	myndh:setMode("loop")
	
	ferja_x = 10
	ferja_y = 10
	ferja_rot = 0
	ferja_hradi = 75
end

function love.update(dt)
   -- Updates the animation. (Enables frame changes)
    myndh:update(dt)
	ferja_x = ferja_x + ferja_hradi * dt
	ferja_rot = 0
	
	dx = ferja_x - love.mouse.getX()
	dy = ferja_y - love.mouse.getY()
	
	--ferja_rot = math.atan(dy/dx)
	
	if ferja_x > 450 and ferja_x < 750 and ferja_y > 500 then
	    ferja_hradi = 0
	end
	
	if love.keyboard.isDown("down") then
	    ferja_y = ferja_y + 50 * dt
		--ferja_rot = 0.7
	end
	if love.keyboard.isDown("up") then
	    ferja_y = ferja_y - 50 * dt
		--ferja_rot = - 0.7
	end
end


function love.draw()
    love.graphics.draw(grant, 0, 450)
	love.graphics.draw(sky, 75, 20)
	love.graphics.draw(sky, 575, 0, 0.5)
	--myndh:draw(450, 500)
	if ferja_hradi < 0 then -- Ef ferjan er ad fara til vinstri
       love.graphics.draw(ferjah, ferja_x, ferja_y, ferja_rot)
    else
       love.graphics.draw(ferja, ferja_x, ferja_y, ferja_rot)
    end
end

function love.keypressed(key)   -- we do not need the unicode, so we can leave it out
    if key == " " then -- " " = SPACE takkin
	    love.graphics.draw(ferjah, ferja_x, ferja_y)
        ferja_hradi = -ferja_hradi
	end
end




 
 
