
require("AnAL")
function love.load()
    krabbi = love.graphics.newImage("krabbi1h.png")
	krabbih = newAnimation(krabbi, 200, 150, 0.3, 0)
    
end

function love.update(dt)

    krabbih:update(dt)
end

function love.draw()

    krabbih:draw(300, 300)  

end
