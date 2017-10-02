--Ork Viktor

function love.load()
    love.graphics.setBackgroundColor(100, 149, 237, 255)
	Success = love.window.setMode(640, 390)
	edru = love.graphics.newImage("viktor.jpg")
	viktor = edru
	sof = love.graphics.newImage("sof.jpg")
	bjorf = love.graphics.newImage("bjor.png")
	bjorb = love.graphics.newImage("bjor0.png")
	bjor = bjorf
	burb = love.audio.newSource("burb.mp3")
	
end

function love.update(dt)


end

function love.draw()
    love.graphics.draw(viktor)
	love.graphics.draw(bjor, 5, 345)
	love.graphics.print("ESCAPE til ad haetta", 500, 370)
	love.graphics.print("Yttu a ENTER til ad fa ter einn kaldann!", 60, 370)
	
	
end

function love.keypressed(key)   -- we do not need the unicode, so we can leave it out

   
end

function love.keypressed(key)   -- we do not need the unicode, so we can leave it out
   if key == "escape" then
      love.event.push("quit")   -- actually causes the app to quit
   end
   if key == "return" then
      viktor = sof
      bjor = bjorb
	  love.audio.play(burb)
   end
end

