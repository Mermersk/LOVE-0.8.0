require 'Vector'

Circle = {}
Circle.__index = Circle
function Circle.new(x, y, r, m, color, dx, dy)
   local self = setmetatable({}, Circle)
   self.position = Vector(x, y)
   self.velocity = Vector(dx or 0, dy or 0)
   self.r = r -- radius
   self.m = m or 1.0 -- mass
   self.color = color

   self.collided = false
   return self
end
function Circle.update(self, dt)
   -- slow down the velocity
   local f = 0.999 / (1+dt)
   self.velocity = self.velocity * f
   -- increment by delta values
   self.position = self.position + (self.velocity * dt)
end
function Circle.draw(self)
   love.graphics.setColor(unpack(self.color))
   love.graphics.circle("fill", self.position.x, self.position.y, self.r-4, 36)

   if self.collided then
      love.graphics.setColor(240, 255, 255)
      self.collided = false
   else
      -- darker outline
      local r, g, b
      r, g, b = unpack(self.color)
      r = r * 0.5
      g = g * 0.5
      b = b * 0.5
      -- thicker
      love.graphics.setLineWidth(4)

      love.graphics.setColor(r, g, b)
   end
   love.graphics.circle("line", self.position.x, self.position.y, self.r-2, 100)
end
function Circle.collide_wall(self)
   bump_slowdown = 0.8
   if self.position.x - self.r <= 0 then
      self.position.x = self.r
      self.velocity.x = -self.velocity.x * bump_slowdown
      self.collided = true
   end
   if self.position.x + self.r >= 800 then
      self.position.x = 800 - self.r
      self.velocity.x = -self.velocity.x * bump_slowdown
      self.collided = true
   end
   if self.position.y - self.r <= 0 then
      self.position.y = self.r
      self.velocity.y = -self.velocity.y * bump_slowdown
      self.collided = true
   end
   if self.position.y + self.r >= 600 then
      self.position.y = 600 - self.r
      self.velocity.y = -self.velocity.y * bump_slowdown
      self.collided = true
   end
end
function Circle.collide_circle(self, other)
   --- Do nothing if they're not colliding
   if self.position:distance(other.position) > (self.r + other.r) then
      return
   end

   self.collided = true
   other.collided = true
   --- http://www.vobarian.com/collisions/2dcollisions2.pdf
   --- 1.
   un = (other.position - self.position):normalized()
   tangent = un:perpendicular()
   --- 3.
   v1n = un:dot(self.velocity)
   v1t = tangent:dot(self.velocity)
   v2n = un:dot(other.velocity)
   v2t = tangent:dot(other.velocity)
   --- 4.
   v_1t = v1t
   v_2t = v2t
   --- 5.
   v_1n = (v1n * (self.m - other.m) + 2 * other.m * v2n) / (self.m + other.m)
   v_2n = (v2n * (self.m - other.m) + 2 * self.m * v1n) / (self.m + other.m)
   --- 6.
   V_1n = un * v_1n
   V_1t = tangent * v_1t
   V_2n = un * v_2n
   V_2t = tangent * v_2t
   --- 7.
   V1 = V_1n + V_1t
   V2 = V_2n + V_2t

   self.velocity = V1
   other.velocity = V2
end

return Circle