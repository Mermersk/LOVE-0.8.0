
function love.load()
    love.graphics.setBackgroundColor(255, 215, 0, 255)
	bla = love.graphics.newImage("bla.png")
	rautt = love.graphics.newImage("rautt.png")
	start = love.graphics.newImage("start.png")
	veri = love.audio.newSource("veri.mp3", "stream")
	una = love.audio.newSource("una.mp3", "stream")
	gus = love.audio.newSource("gus.mp3", "stream")
end

function love.draw()
    love.graphics.print("Daft Punk - Veridis Quo", 280, 60, 0, 2, 2)
    love.graphics.draw(bla, 0, 180)
    love.graphics.draw(rautt, 0, 400)
	love.graphics.print("Ludovico Einaudi - Una Mattina", 250, 250, 0, 2, 2)
	love.graphics.print("GusGus - Arabian Horse", 280, 460, 0, 2, 2)
	love.graphics.print("Veldu Lag:", 0, 275, 0, 2, 2)
	
	if current_song == (gus)
	    then love.graphics.draw(start, 210, 450)
    end
	
	if current_song == (una)
	    then love.graphics.draw(start, 180, 240)
	end
	
	if current_song == (veri)
	    then love.graphics.draw(start, 200, 50)
	end
end



function love.mousepressed(x, y, button)
   if button == "l" then
      if y > 400 then
          love.audio.play(gus)
		  current_song = (gus)
		  love.audio.pause(veri)
		  love.audio.pause(una)
      elseif y > 180 then
          love.audio.play(una)
		  current_song = (una)
		  love.audio.pause(gus)
		  love.audio.pause(veri)
      else
          love.audio.play(veri)
		  current_song = (veri)
		  love.audio.pause(gus)
		  love.audio.pause(una)
      end
   end
end


