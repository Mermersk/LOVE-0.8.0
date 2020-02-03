--Ljos
require("AnAL")
require("conf")
function love.load()
    --love.graphics.setMode(1280, 827)
	--Background
    dag = love.graphics.newImage("dag.jpg")
	nott = love.graphics.newImage("nott.jpg")
	ljos = nott
	--font
	font = love.graphics.newFont("GROBOLD.ttf", 25)
	
	--animation
	
	fugl = love.graphics.newImage("fugl.png")
	hreyfifugl = newAnimation(fugl, 50, 40, 0.2, 0)
	hreyfifugl:setMode("loop")
	fuglr = love.graphics.newImage("fuglrisinn.png")
	fuglrhreyfing = newAnimation(fuglr, 40, 100, 2, 0)
	fuglrhreyfing:setMode("loop")
	--Beginning x and y coordinates for duck
	hreyfifugl_x = 10
	hreyfifugl_y = 100
	
	--sound
	ond = love.audio.newSource("duck.mp3", "static")
	on = love.audio.newSource("on.wav", "static")
	
	--Text
	A = "Sometimes the russian way is the best way to fix"
	B = "Press H for help/hint"
	C = B
end

function love.update(dt)
    --Animation
    hreyfifugl:update(dt)
	fuglrhreyfing:update(dt)
	--Quackery sound
	if love.mouse.isDown(2) then
	    love.audio.play(ond)
	end
	
end

function love.draw()
    -- Drawing text, animations and pics
    love.graphics.draw(ljos)
	love.graphics.setFont(font)
	setColor(0, 100, 0) --green
	love.graphics.print(C, 690, 790)
	love.graphics.print("Press ESCAPE key to quit", 2, 2)
	love.graphics.print("Press RIGHT MOUSE-BUTTON to quack", 2, 35)
	love.graphics.print("Objective: Fix the broken street lamp", 2, 70)
	setColor(255, 255, 255) -- white
	
	hreyfifugl:draw(hreyfifugl_x, hreyfifugl_y, snuningur)
	--Movement
	if love.mouse.isDown(1) == true then
	    mx, my = love.mouse.getPosition()
	        if hreyfifugl_x < mx then
			    hreyfifugl_x = hreyfifugl_x + 3
				snuningur = 0
			end
			if hreyfifugl_x > mx then
			    hreyfifugl_x = hreyfifugl_x - 3                      
				snuningur = 3.14                               --circle = 6,28 radians
			end
			if hreyfifugl_y < my then
			    hreyfifugl_y = hreyfifugl_y + 3
				
			end
			if hreyfifugl_y > my then
			    hreyfifugl_y = hreyfifugl_y - 3
				
			end
		--snuningur = mx / 203.82 and my / 131.68
			
	end 
	
	--The box to crash into and events that happens with it
	if hreyfifugl_x > 900 and hreyfifugl_x < 940 and
	   hreyfifugl_y > 527 and hreyfifugl_y < 600 then
	       love.audio.play(on)
	       love.timer.sleep(4.6)
		   hreyfifugl_x = 2000
		   ljos = dag
    end
	-- More events after the crash, had troubles with changing the animation without ruining the next one.
	-- So this was easier
	if ljos == dag then
	    fuglrhreyfing:draw(900, 0)
		setColor(0, 100, 0)
		love.graphics.print("End", 400, 400)
		setColor(255, 255, 255)
	end
		
	
end

--The two keys on the kb you use in this game. That C = A bit is about changing the text, deleting the help message and display the hint.
function love.keypressed(key)   
   if key == "escape" then
      love.event.push("quit")
   end
   if key == "h" then           
       C = A
	end                                          
end


--In löve 0.11 the values for rgba go now from 0 to 1 instead of 0 to 255. But I dont want to rewrite all setColor function in this program so I replace the love.graphics.setColor function with a new one
--which handles the conversion for me
function setColor(r, g, b, a)
	local r_new = r/255 --Divide with 255 to get the same value in 0-1 format
	local g_new = g/255
	local b_new = b/255

	local a_new = 1 --If only rgb values are the input then go full alpha, if given do the calculations beneath
	if a ~= nil then
		a_new = a/255
	end

	love.graphics.setColor(r_new, g_new, b_new, a_new)

end
