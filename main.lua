require("player")
require("ball")
require('enemy')

Game_Speed = 1
Game_Difficulty = 0.5

function love.load()
	Player:load()
	Enemy:load()
	Ball:load()
end

function love.update(dt)
	dt = dt * Game_Speed
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
	if a.x + a.width >= b.x and a.x < b.x + b.width and a.y + a.height >= b.y and a.y < b.y + b.height then
		return true
	end
	return false
end
