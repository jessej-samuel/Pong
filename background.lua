Background = {}

function Background:load()
	self.universe = love.graphics.newImage('assets/universe.png')
	self.planets = love.graphics.newImage('assets/planets.png')
	self.width = self.planets:getWidth()
	self.height = self.planets:getHeight()
	self.rotation = 0
end

function Background:update(dt)
	self.rotation = self.rotation + 0.1 * dt
end

function Background:draw()
	love.graphics.draw(self.universe, 0, 0)
	love.graphics.draw(self.planets, self.width / 2, self.height / 2, self.rotation, 1, 1, self.width / 2,
		self.height / 2)
	love.graphics.setColor(0, 0, 0, 0.6)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(1,1,1)
end
