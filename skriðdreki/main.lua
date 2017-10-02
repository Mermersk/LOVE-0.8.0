require("AnAl")
function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
    tank = love.graphics.newImage("tank.jpg")
	krabbi = love.graphics.newImage("Krabbi1.png")
	tankh = newAnimation(tank, 225, 137, 0.2, 0)
	
	Fjoldi = {
	
	{mynd = tank , x = 300, y = 300},  --Skriðdreki 1
	
	{mynd = krabbi ,x = 200, y = 200},   --Krabbi 1
	
	{mynd = tank ,x = 0, y = 0}        --Skriðdreki 3
	
	}
	
	
	
end

function love.update(dt)
    tankh:update(dt)
	
	
end

function love.draw()
    --tankh:draw(10, 10)
	
	for lykill, gildi in pairs(Fjoldi) do
	    love.graphics.draw(gildi.mynd, gildi.x, gildi.y)
	end
	
	
end