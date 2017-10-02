require("AnAL")
require("emitter")
require("conf")
function love.load()
    --love.graphics.setMode(1154, 663)
    blast = love.audio.newSource("blast2.ogg", "static")
    blast:isLooping(true)
    grann = love.graphics.newImage("grann2.png")
	svart = love.graphics.newImage("svart.png")
	blatt = love.graphics.newImage("blatt.png")
	star = love.graphics.newImage("star.png")
	helpp = love.graphics.newImage("help.png")
	malir = love.graphics.newImage("malir.png")
	jor = love.graphics.newImage("or.png")
	blastjarna = love.graphics.newImage("blastjarna.png")
    cargo2 = love.graphics.newImage("cargo2.png")
	cargo = love.graphics.newImage("cargo.png")
	skip = cargo
	cargoh = newAnimation(skip, 50, 75, 0.5, 0)
	cargo_y = 300
	cargo_dy = 0
	cargo_x	= 200
	cargo_dx = 0
	cargo_rot = 0.1
	jor_rot = 4
	pit = 1
	bakgrunnur = grann
	
	
	stjornur = {}
	for i = 0, 100 do 
	    stjornur[math.random(0, 1154)] = math.random(0, 663)  --Lykill og svo gildi
	end
	
	blastjornur = {}
	for i = 0, 15 do
	    blastjornur[math.random(0, 1154)] = math.random(0, 663)
	end
	
	fjarstjornur = {}
	for i = 0, 200 do
	    fjarstjornur[math.random(0, 1154)] = math.random(0, 663)
	end

	
	stjornukort = {1150, 1151, 1152, 0, -1}  --Set m�rg gildi svo �a� s� alveg �rugggt a� �a� pikkast upp.
	    
end

function love.update(dt)
  
		
	for _, v in pairs(stjornukort) do   -- _, v  = lykill, gildi
	      if v == math.floor(cargo_x) then  --math.floor er svo a� talan er alltaf 15, 16 en EKKI 15,4667 e�a komma eitthva�, alltaf bara heil tala.
		      
	          stjornur = {}
			  for i = 0, 100 do 
	              stjornur[math.random(0, 1154)] = math.random(0, 663)  
	          end
			  
			  blastjornur = {}
	          for i = 0, 15 do
	              blastjornur[math.random(0, 1154)] = math.random(0, 663)   --N�tt stj�rnusustem, nyjar stj�rnur
	          end
	
	          fjarstjornur = {}
	          for i = 0, 200 do
	              fjarstjornur[math.random(0, 1154)] = math.random(0, 663)
	          end
			  if v == (1150 or 1151 or 1152) then  -- Fyrir hvort hann s� a� fara h�gri e�a vinstri
			      cargo_x = 1
		        else
				  cargo_x = 1104
				end
			  
			  bt = math.random(1, 3)  --Handah�fskennt system til a� �kvar�a bakgrunn. Hafa �etta sm� spicy.
			  if bt == 1 then
			      bakgrunnur = grann
			  end
			  if bt == 2 then
			      bakgrunnur = svart
			  end
			  if bt == 3 then
			      bakgrunnur = blatt
			  end
			  
			end
	end
	

	
	if cargo_y > 620 then
	    cargo_dy = -5 * dt
	end
	if cargo_y < 50 then
	    cargo_dy = 5 * dt
	end
	
	cargoh:update(dt)
	ignition = false
	
	cargo_y = cargo_y + cargo_dy * dt
	cargo_x = cargo_x + cargo_dx * dt
	if love.keyboard.isDown("up") and cargo_rot > 0 and cargo_rot < 1.57 and cargo_dx < 65 and cargo_dx > -65  then
	    cargo_dy = cargo_dy - 5* dt
		cargo_dx = cargo_dx + 5* dt
	    ignition = true
	end
	if love.keyboard.isDown("up") and cargo_rot > 1.57 and cargo_rot < 3.14 and cargo_dx < 65 and cargo_dx > -65  then
	    cargo_dy = cargo_dy + 5* dt
		cargo_dx = cargo_dx + 5* dt
		ignition = true
	end
	if love.keyboard.isDown("up") and cargo_rot > 3.14 and cargo_rot < 4.71 and cargo_dx < 65 and cargo_dx > -65  then
	    cargo_dy = cargo_dy + 5* dt
		cargo_dx = cargo_dx - 5* dt
		ignition = true
	end
	if love.keyboard.isDown("up") and cargo_rot > 4.71 and cargo_rot < 6.28 and cargo_dx < 65 and cargo_dx > -65  then
	    cargo_dy = cargo_dy - 5* dt
		cargo_dx = cargo_dx - 5* dt
	    ignition = true
	end
	
	if ignition == true then
	    exe:start()
	else              --Altaf stoppa particle effect en ef skilyr�in uppi eru uppfyllt( �� ignition = true �� fara af sta�!
	    exe:stop()
	end
	
    --cargoh = newAnimation(skip, 50, 75, 0.5, 0)  --Svo a� �a� s� h�gt a� skipta � milli bl�tt og rautt thrusters.
	if love.keyboard.isDown("right") then
	    cargo_rot = cargo_rot + 0.5 * dt
		skip = cargo2
	else if love.keyboard.isDown("left") then
	    cargo_rot = cargo_rot - 0.5 * dt
		skip = cargo2
		else
		skip = cargo  -- Gera bl�tt lj�s � hli�unum, virkar ekki �ar sem a� newAnimation(skip...) keyurist bara einu sinni.
	  end
	end
	
	
	exe:update(dt)
	
	
	if cargo_rot > 6.26 and cargo_rot < 6.35 then  --Annars fer �a� bara endalaust upp
	    cargo_rot = 0   
	end
	if cargo_rot < -0.0001 and cargo_rot > -0.5 then  --Annars k�mi �t minus tala!
	    cargo_rot = 6.25
    end
	
	if love.keyboard.isDown("down") and (cargo_dx > 1 or cargo_dx < -1 or cargo_dy > 1 or cargo_dy < -1) then
	    skip = cargo2
	    if cargo_dx < 1 then
		    cargo_dx = cargo_dx + 10 * dt
		else if cargo_dx > 1 then
		    cargo_dx = cargo_dx - 10 * dt
		  end
		end
		
		if cargo_dy < 1 then
		    cargo_dy = cargo_dy + 10 * dt
		else if cargo_dy > 1 then
		    cargo_dy = cargo_dy - 10 * dt
		  end
		end
	end
	
	if cargo_dx < 5 then 
	    jor_rot = 4
	end
    if cargo_dx > 20 then
	    jor_rot = 5
	end                                          --�egar fari� er � h�gri plust�lur
	if cargo_dx > 40 then
	    jor_rot = 6.14
	end
	if cargo_dx > 60 then
	    jor_rot = 1.54
	end
	
	
	if cargo_dx < -5 then
	    jor_rot = 4
	end
    if cargo_dx < -20 then
	    jor_rot = 5                            --�egar fari� er til vinstri, minust�lur
	end
	if cargo_dx < -40 then
	    jor_rot = 6.14
	end
	if cargo_dx < -60 then
	    jor_rot = 1.54
	end
	
	    
	if (cargo_dx > 1 or cargo_dx < -1) then  --svo a� hlj��i� spilast �egar h�n er kominn sm� af sta�
	    love.audio.play(blast)
	else
	    love.audio.pause(blast)
	end
	
	blast:setPitch(math.abs(cargo_dx/20)) --math.abs breytir �llum t�lum � p�sitifar!
	--pit = math.abs(cargo_dx/18)
	--if cargo_dx < -1 then
	 --   pit = cargo_dx/ -18
	--else
	  --  pit = cargo_dx/18
	--end
	
	
	
end

function love.draw()
    love.graphics.draw(bakgrunnur, 0, 0)

	
	for lykill, gildi in pairs(stjornur) do 
	    love.graphics.draw(star, lykill, gildi)
	end
	for lykill, gildi in pairs(blastjornur) do 
	    love.graphics.draw(blastjarna, lykill, gildi, 0, 0.3, 0.3)
	end
	for lykill, gildi in pairs(fjarstjornur) do
	    love.graphics.point(lykill, gildi)
	end
  	
	
	love.graphics.draw(exe, cargo_x - 1, cargo_y - 3, cargo_rot)  --Teikna eldinn a�eins inn� v�lar�mi�

	love.graphics.print("Press H for help", 10, 1)
	love.graphics.print(cargo_rot, 10, 10)
	love.graphics.print(cargo_x, 100, 10)
	love.graphics.print(cargo_dx, 250, 10)  --top speed: 65
	cargoh:draw(cargo_x, cargo_y, cargo_rot, 1, 1, 27, 60)  -- Seinustu tv�r t�lurnar er til a� stilla �a� �annig a� mi�punkturinn er vi� v�lar�mi skipsins, �� sn�st �a� � �eim punkti! Mj�g mikilv�gt fyrir Eldinn sem kemur �t!
	
	love.graphics.draw(malir, 1070, 580, 0, 0.50, 0.50)
	love.graphics.draw(jor, 1109, 620, jor_rot, 0.55, 0.55, 20, 40)
	
	if love.keyboard.isDown("h") then
	    help()
	end
	
end

function help()
    love.graphics.draw(helpp, 300, 0)
	love.graphics.print("forward thrust", 350, 100)
	love.graphics.print("turn ship", 280, 150)
	love.graphics.print("turn ship", 450, 150)
	love.graphics.print("power down and stabilize", 330, 190)

end