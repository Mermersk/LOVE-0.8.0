    
function collision()
	if lulu_x < 280 then
	    cam:lookAt(280, lulu_y)
	else
	    cam:lookAt(lulu_x, lulu_y)  -- Vinstri hli� mappsins, kamera og collision. X-�s.
	end
	if lulu_x < 20 then
	    lulu_x = 20
	end
	
	
	if lulu_x > 1370 then
	    cam:lookAt(1370, lulu_y)   -- H�gri hli� mappsins, kamera og collision. X-�s.
	end
	if lulu_x > 1630 then
	    lulu_x = 1630
	end
	
	if lulu_y < 190 then
	    cam:lookAt(lulu_x, 190)   -- efri hli� mappsins, kamera og collision. Y-�s.
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
	if lulu_x < 281 and lulu_y < 191 then  --Efra vinstra horni�, ef �g geri �eta ekki �� s�st alltaf svartar rendur �v� a� textinn fyrir ofan virkar bara �egar ma�ur er � mi�ju mappi.
	    cam:lookAt(281, 191)
	end
	
	if lulu_x > 1369 and lulu_y > 949 then  --Ne�ra h�gra horni�
	   cam:lookAt(1369, 949)
	end
	
	if lulu_x > 1369 and lulu_y < 191 then  --Efra h�gra horn
	   cam:lookAt(1369, 191)
	end
	
	if lulu_x < 281 and lulu_y > 949 then  --Ne�ra vinstra horn
	   cam:lookAt(281, 949)
	end
	
	
end
