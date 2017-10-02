function love.load()

    b = 0
end

function love.update(dt)
end

function love.draw()

    love.graphics.print("B er: ", 100, 100)
	love.graphics.print(b, 130, 100)
	love.graphics.print("Yttu a enter til ad sja B staekka", 1, 1)

end

function love.keypressed(key)   -- we do not need the unicode, so we can leave it out
   if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
  end
   if key == "return" then
      b = b + 1
  end
end