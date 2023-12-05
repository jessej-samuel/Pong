Enemy = {}

function Enemy:load()
	self.x = love.graphics.getWidth() - 50
	self.y = love.graphics.getHeight() / 2
	self.img = love.graphics.newImage('assets/orange_board.png')
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.yVel = 500
	self.type = 'enemy'
	self.score = 0
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
	love.graphics.draw(self.img, self.x, self.y)
end
