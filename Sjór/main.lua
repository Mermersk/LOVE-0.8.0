

function love.load()
   
   dropi = love.graphics.newImage("dropi.png")
   dropih = love.graphics.newParticleSystem(dropi, 10000)
   dropih:setEmissionRate(20)
   dropih:setParticleLife(100)
   dropih:setSpeed(30, 35)
   dropih:setDirection(3.14)
   dropih:setSpread(6.14)
   dropih:setGravity(0)
   
  
end

function love.update(dt)

	
	dropih:update(dt)
	dropih:start()
	

end

function love.draw()

	
	love.graphics.draw(dropih, 200, 200, 0, 0.20, 0.20)
	love.graphics.draw(dropih, 400, 200, 0, 0.20, 0.20)
	love.graphics.draw(dropih, 600, 200, 0, 0.20, 0.20)
	
	love.graphics.draw(dropih, 200, 400, 0, 0.20, 0.20)
	love.graphics.draw(dropih, 400, 400, 0, 0.20, 0.20)
	love.graphics.draw(dropih, 600, 400, 0, 0.20, 0.20)
	

end

