-- combo({a,b,c},2) ==> a,b a,c b,c
-- http://lua-users.org/wiki/TableUtils
function combo(lst, n)
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