require('player')
require('enemy')

Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.img = love.graphics.newImage('assets/ball.png')
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.speed = 200
	self.xVel = -self.speed
	self.yVel = 0
	self.particleSystem = love.graphics.newParticleSystem(love.graphics.newImage('assets/light.png'), 2000)
	self.particleSystem:setParticleLifetime(0, 1)
	self.particleSystem:setEmissionRate(100)
	self.particleSystem:setSizeVariation(1)
	self.particleSystem:setColors(1, 1, 1, 1, 1, 1, 1, 0)
	love.audio.play(love.audio.newSource('assets/sounds/game-start.mp3', "static"))
end

function Ball:update(dt)
	self:move(dt)
	self:collidePlayer(dt)
	self:collideEnemy(dt)
	self:updateScore()
	self.particleSystem:setLinearAcceleration(-self.xVel, -self.yVel)
	self.particleSystem:update(dt)
	print(self.xVel, self.yVel)
end

function Ball:move(dt)
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel * dt

	if Ball.y <= 0 or Ball.y + Ball.width >= love.graphics.getHeight() then
		self.yVel = -self.yVel
	end
end

function Ball:collidePlayer(dt)
	if _G.collision(self, Player) then
		Player:addPoint()
		Game_Speed = Game_Speed + Game_Difficulty
		self.xVel = -self.xVel
		self.x = Player.x + Player.width
		if self.yVel == 0 then
			self.yVel = self.speed
		end
	end
end

function Ball:reset()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.speed = 200
	self.yVel = 0
	self.xVel = -self.speed
	Game_Speed = 1
	love.audio.play(love.audio.newSource('assets/sounds/game-start.mp3', "static"))
end

function Ball:collideEnemy(dt)
	if _G.collision(self, Enemy) then
		self.xVel = -self.xVel
		self.x = Enemy.x - self.width
		if self.yVel == 0 then
			self.yVel = self.speed
		end
	end
end

function Ball:updateScore()
	if Ball.x + Ball.width < 0 then
		Enemy.score = Enemy.score + 1
		Ball:reset()
	end
	if Ball.x > love.graphics.getWidth() then
		Player.score = Player.score + 1
		Ball:reset()
	end
end

function Ball:draw()
	love.graphics.draw(self.particleSystem, self.x + self.width / 2, self.y + self.height / 2)
	love.graphics.draw(self.img, self.x, self.y)
end
