require('player')
require('enemy')

Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 20
	self.speed = 200
	self.xVel = -self.speed
	self.yVel = 0
end

function Ball:update(dt)
	Ball:move(dt)
	Ball:collide()
end

function Ball:move(dt)
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel

	if Ball.y <= 0 or Ball.y + Ball.width >= love.graphics.getHeight() then
		self.yVel = -self.yVel
	end
end

function Ball:collide()
	if _G.collision(self, Player) then
		print('player collide')
		self.xVel = -self.xVel
		self.x = Player.x + Player.width
		if self.yVel == 0 then
			self.yVel = 5
		end
	end

	if _G.collision(self, Enemy) then
		print('enemy collide')
		love.graphics.setColor(1, 1, 0)
		self.xVel = -self.xVel
		self.x = Enemy.x - self.width
		if self.yVel == 0 then
			self.yVel = 5
		end
	end
end

function Ball:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
