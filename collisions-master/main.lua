
require 'utils'

require 'Circle'
require 'Hole'

function love.load()
   love.graphics.setMode(800, 600)
   love.graphics.setBackgroundColor(100, 100, 140)

   -- circle properties
   white = Circle.new(400, 450, 24, 1.1, {250,250,250})
   red = Circle.new(300, 150, 20, 1.0, {140,50,50})
   green = Circle.new(400, 150, 20, 1.0, {50,140,50})
   blue = Circle.new(500, 150, 20, 1.0, {50,50,140})

   hole = Hole.new(400, 300, 20)

   circles = {white, red, green, blue}
   
   -- interactive flag
   interact = true

end
function love.update(dt)
   love.mouse.setVisible(interact)

   for i, c in ipairs(circles) do
      -- update and check wall collision
      c:update(dt)
      c:collide_wall()
      -- compare all circles with the hole, remove them if they fell in
      dv = hole.p - c.position
      d = dv:len()
      if d < hole.r then
         table.remove(circles, i)
      end
   end

   -- run collide_circle on all pairs of circles
   for i, C in ipairs(combo(circles, 2)) do
      local a, b = unpack(C)
      a:collide_circle(b)
   end
   
   if interact and love.mouse.isDown("l") then
      local click = Vector(love.mouse.getPosition())
      --- Shoot white circle
      r = 3.5
      white.velocity = (white.position - click) * r
      --- No more interaction
      interact = false
   else
      if white.velocity:len() < 0.4 then
         interact = true
      end
   end
end
function love.draw()
   hole:draw()
   for i, c in ipairs(circles) do
      c:draw()
   end
end
