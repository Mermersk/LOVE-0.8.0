require "AnAL"
function love.load()
    bakg = love.graphics.setBackgroundColor(0, 100, 0)
	
    ond = love.graphics.newImage("ond.jpg")
	planki = love.graphics.newImage("planki.jpg")
	hreyfiplanki = newAnimation(planki, 100, 65, 0.2, 0)
    tond = love.graphics.newImage("tond.jpg")
    htond = newAnimation(tond, 116, 88, 0.1, 0)	
	
	ond_x = 300
	ond_y = 400
	
	A = "dusska"
	B = "Tuusska"
	C = B
	
end

function love.update(dt)
   hreyfiplanki:update(dt)
   htond:update(dt)
   
   
end

function love.draw()
    love.graphics.print(C, 100, 100)

    love.graphics.draw(ond, ond_x, ond_y, snuningur)
	if love.mouse.isDown("l") == true then
	    mx, my = love.mouse.getPosition()
		    if ond_x < mx then
			ond_x = ond_x + 5
			end
			if ond_x > mx then
            ond_x = ond_x - 5
            end
            if ond_y < my then
			ond_y = ond_y + 5
            end
            if ond_y > my then
            ond_y = ond_y - 5
            end
         snuningur = math.atan2( ond_y - my, ond_x - mx )	
         C = A
        
		 
	end
	
	love.graphics.circle("fill", 200, 200, 30)
	if ond_x > 170 and ond_x < 230 and
	   ond_y > 170 and ond_y < 230 then
	       love.graphics.print("You found the LIGHT", 100, 100)
	end
	
	love.graphics.print("hnit mx og my", 400, 2)
	
	
	hreyfiplanki:draw(10, 10)
	htond:draw(200, 200)
	
	--if ond_y == love.graphics.getColor(bakg)  then
       --love.graphics.print("hohohohhahaha", 400, 400)
	--end
	r, g, b, a = love.graphics.getColor(ond_y)
	love.graphics.print(r, 400, 200)
	love.graphics.print(g, 430, 200)
	love.graphics.print(b, 460, 200)
	love.graphics.print(a, 490, 200)
	
     
end
	