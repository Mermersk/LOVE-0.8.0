function love.load()
	T = 32416190071

	
	nei = "Nei."
	ja = "Já!"
	svar = ja
	
	i = 2
	while i < T do
		if T % i == 0 then
			svar = nei
			break
		end
		i = i + 1
	end
   
end

function love.update(dt)
	
end

function love.draw()
    love.graphics.print(svar, 10, 10)
end



