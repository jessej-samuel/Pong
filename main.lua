require("player")
require("ball")
require('enemy')

function love.load()
	Player:load()
	Enemy:load()
	Ball:load()
end

function love.update(dt)
	Player:update(dt)
	Enemy:update(dt)
	Ball:update(dt)
end

function love.draw()
	Player:draw()
	Enemy:draw()
	Ball:draw()
end

function _G.collision(a, b)
	if a.x + a.width >= b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y <= b.y + b.height then
		return true
	end
	return false
end
