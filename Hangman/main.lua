--Hangman
 
function love.load()
        love.graphics.setMode(250, 330, false, false, 2)
        love.graphics.setBackgroundColor(189, 183, 107)
        lina = love.graphics.newImage("lina.png")
        bla = love.graphics.newImage("bla.png")
        hilla = love.graphics.newImage("hilla.png")
        lina2 = love.graphics.newImage("lina2.png")
		ding = love.audio.newSource("ding.ogg")
		
       a = 1
	   c = " "
	   i = " "
	   t = " "
	   y = " "
	   
end
 
 

function love.keypressed(key)
    if key == "c" then
	    c = "C"
	end
	 if key == "i" then
	    i = "I"
	end
	 if key == "t" then
	    t = "T"
	end
	 if key == "y" then
	    y = "Y"
	end
       
end
 
 
function love.draw()
        love.graphics.draw(lina, 0, 220)
        love.graphics.draw(bla, 0, 225)
        love.graphics.print("Hello, Welcome to a game of Hangman!", 1, 240)
        love.graphics.print("Choose a letter on your keyboard", 1, 260)
        love.graphics.print("Hint: noun, cluster of humans.", 1, 285)
        love.graphics.draw(hilla, 90, 210)
        love.graphics.draw(hilla, 110, 210)
        love.graphics.draw(hilla, 130, 210)
        love.graphics.draw(hilla, 150, 210)
        love.graphics.draw(lina2, 220, -175)
		
		love.graphics.print(c, 90, 195)
		love.graphics.print(i, 110, 195)
		love.graphics.print(t, 130, 195)
		love.graphics.print(y, 150, 195)
       
        if c == "C" and i == "I" and t == "T" and y == "Y" then
		    ding:setLooping(false)
		    love.audio.play(ding)
		end
end

