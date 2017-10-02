-- Mechanica. Stuttur leikur um mechanic's.

function love.load()
    love.graphics.setMode(800, 456, false, false, 2)
	love.graphics.setBackgroundColor(0, 0, 0)
	lag = love.audio.newSource("Adventure.mp3")
    Bakm = love.graphics.newImage("Ice.png")
	mec = love.graphics.newImage("finn.png")
	iceking = love.graphics.newImage("iceking.png")
	Gunter = love.graphics.newImage("gunt.png")
	Gunter_x = 0
	iceking_x = 0
	iceking_y = 0
	iceking_face = 1
	mec_x = 0
	mec_y = 0
	
	gunther_x = 0
	gunther_y = 0
	gunther_rot = 0
	gunther_dx = 0
end



function love.update()
    if love.keyboard.isDown("right") then
		mec_x = mec_x + 2
	end
	if love.keyboard.isDown("left") then
	    mec_x = mec_x - 2
	end
	if love.keyboard.isDown("down") then
	    mec_y = mec_y + 2
	end
	if love.keyboard.isDown("up") then
	    mec_y = mec_y - 2
	end
	
	
	if love.keyboard.isDown("d") then
		iceking_x = iceking_x + 2
		iceking_face = 1
	end
	if love.keyboard.isDown("a") then
	    iceking_x = iceking_x - 2
		iceking_face = -1
	end
	if love.keyboard.isDown("s") then
	    iceking_y = iceking_y + 2
	end
	if love.keyboard.isDown("w") then
	    iceking_y = iceking_y - 2
	end
	
	if not (gunther_dx == 0) then
		gunther_x = gunther_x + gunther_dx
		gunther_rot = gunther_rot + 0.2
		if gunther_x > 800 or gunther_x < 0 then
			gunther_dx = 0
			gunther_rot = 0
		end
	else
		gunther_x = iceking_x
		gunther_y = iceking_y
	end
love.audio.play(lag)
end

function love.draw()
    love.graphics.draw(Bakm, 0, 0, 0, 1, 1)
	love.graphics.draw(mec, mec_x, mec_y)
	love.graphics.draw(iceking, iceking_x, iceking_y, 0, iceking_face, 1)
	love.graphics.draw(Gunter, gunther_x, gunther_y, gunther_rot, 1, 1, 12, 16)
end

function love.keypressed(key)   
   if key == " " then
      gunther_dx = iceking_face * 10
   end
end



--Kannski til brúks seinna
--hringur = love.graphics.circle("fill", 100, 100, 50)
