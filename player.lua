Player = {}

function Player:load()
	self.x = 50
	self.y = love.graphics.getHeight() / 2
	self.img = love.graphics.newImage('assets/blue_board.png')
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.speed = 500
	self.type = 'player'
	self.score = 0
end

function Player:addPoint()
	self.score = self.score + 1
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
	love.graphics.draw(self.img, self.x, self.y)
end
