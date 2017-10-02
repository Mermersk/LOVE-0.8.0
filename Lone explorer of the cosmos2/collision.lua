    
function collision()
	if lulu_x < 280 then
	    cam:lookAt(280, lulu_y)
	else
	    cam:lookAt(lulu_x, lulu_y)  -- Vinstri hlið mappsins, kamera og collision. X-ás.
	end
	if lulu_x < 20 then
	    lulu_x = 20
	end
	
	
	if lulu_x > 1370 then
	    cam:lookAt(1370, lulu_y)   -- Hægri hlið mappsins, kamera og collision. X-ás.
	end
	if lulu_x > 1630 then
	    lulu_x = 1630
	end
	
	if lulu_y < 190 then
	    cam:lookAt(lulu_x, 190)   -- efri hlið mappsins, kamera og collision. Y-ás.
	end
	if lulu_y < 20 then
	    lulu_y = 20
	end
	
	if lulu_y > 950 then
	    cam:lookAt(lulu_x, 950)
	end
	if lulu_y > 1128 then
	    lulu_y = 1128
	end
	
	--HORNIN
	if lulu_x < 281 and lulu_y < 191 then  --Efra vinstra hornið, ef ég geri þeta ekki þá sést alltaf svartar rendur því að textinn fyrir ofan virkar bara þegar maður er í miðju mappi.
	    cam:lookAt(281, 191)
	end
	
	if lulu_x > 1369 and lulu_y > 949 then  --Neðra hægra hornið
	   cam:lookAt(1369, 949)
	end
	
	if lulu_x > 1369 and lulu_y < 191 then  --Efra hægra horn
	   cam:lookAt(1369, 191)
	end
	
	if lulu_x < 281 and lulu_y > 949 then  --Neðra vinstra horn
	   cam:lookAt(281, 949)
	end
	
	
end
