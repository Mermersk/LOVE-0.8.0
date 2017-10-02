require 'Vector'

Hole = {}
Hole.__index = Hole
function Hole.new(x, y, r)
	local self = setmetatable({}, Hole)
	self.p = Vector(x, y)
	self.r = r or 20
	return self
end
function Hole:draw()
	love.graphics.setColor(0,0,0)
	love.graphics.circle("fill", self.p.x, self.p.y, self.r-1, 36)
	love.graphics.circle("line", self.p.x, self.p.y, self.r, 36)
end

return Hole