 function combo(lst, n)      --Eitthvað fall sem Tumi fann af Lau vefsiðunni
        local a, number, select, newlist
        newlist = {}
        number = #lst
        select = n
        a = {}
            for i=1,select do
                a[#a+1] = i
            end
    newthing = {}
        while(1) do
            local newrow = {}
                for i = 1,select do
                     newrow[#newrow + 1] = lst[a[i]]
                end
      newlist[#newlist + 1] = newrow
      i=select
    while(a[i] == (number - select + i)) do
        i = i - 1
    end
    if(i < 1) then break end
        a[i] = a[i] + 1
    for j=i, select do
        a[j] = a[i] + j - i
    end
  end
  return newlist  
end


    for i, C in ipairs(combo(founders, 2)) do
        local a, b = unpack(C)
        print("Lengd milli " .. a.nafn .. " og " .. b.nafn .. " er " .. pyth(a.bak_x, b.bak_x, b.bak_y, b.bak_y));
    end