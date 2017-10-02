-- Fire emitter
ex = love.graphics.newImage("ex.png")
exe = love.graphics.newParticleSystem(ex, 300)
exe:setEmissionRate(40)
exe:setParticleLife(2)
exe:setDirection(1.57)
exe:setSpeed(30, 40)
exe:setSizes(1, 1.2, 0.8)
exe:setSpread(0.5)
--exe:setColors(255, 0, 0, 220, 50, 200, 0, 200)
exe:setColors(250, 0, 0, 255, 0, 0, 250, 255)
exe:setSpin(0, 3, 1)




