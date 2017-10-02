require("conf")
require("AnAl")
camera = require("camera")
function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
    ond = love.graphics.newImage("tond.png")
	bakg = love.graphics.newImage("tree.jpg")
	hond = newAnimation(ond, 119, 88, 0.1, 0)
	
	hond_x = 2
	hond_y = 2
	
	
	cam = camera:new()
	
end


function love.update(dt)
    hond:update(dt)

	cam:lookAt(200, 200)
end

function love.draw()
    cam:attach()
    
    
	love.graphics.draw(bakg)
	
    hond:draw(hond_x, hond_y, snuningur)
	mx, my = love.mouse.getPosition()
	
	if love.mouse.isDown("l") then
	    if hond_x < mx then
	        hond_x = hond_x + 4
		end
		if hond_x > mx then
		    hond_x = hond_x - 4
		end
		if hond_y < my then
		    hond_y = hond_y + 4
		end
		if hond_y > my then
		    hond_y = hond_y - 4
		end
	snuningur = math.atan2(hond_y - my, hond_x - mx)
	end
	cam:detach()
end

