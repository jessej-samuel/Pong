Enemy = {}

function Enemy:load()
	self.x = love.graphics.getWidth() - 50
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 100
	self.yVel = 500
	self.type = 'enemy'
end

function Enemy:update(dt)
	self:move(dt)
	-- limit Enemy
	if self.y < 0 then self.y = 0 end
	if (self.y > love.graphics.getHeight() - self.height) then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Enemy:move(dt)
	self.y = Ball.y
end

function Enemy:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
