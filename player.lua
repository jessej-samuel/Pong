Player = {}

function Player:load()
	self.x = 50
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 100
	self.speed = 500
	self.type = 'player'
end

function Player:update(dt)
	self:move(dt)

	-- limit player
	if self.y < 0 then self.y = 0 end
	if (self.y > love.graphics.getHeight() - self.height) then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Player:move(dt)
	if love.keyboard.isDown('w') then
		self.y = self.y - self.speed * dt
	end
	if love.keyboard.isDown('s') then
		self.y = self.y + self.speed * dt
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
