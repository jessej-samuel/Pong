require("player")
require("ball")
require('enemy')
require('background')

Game_Speed = 1
Game_Difficulty = 0.1
local ping = love.audio.newSource("assets/sounds/ping.mp3", "static")

function love.load()
	Player:load()
	Enemy:load()
	Ball:load()
	Background:load()
	love.graphics.setFont(love.graphics.newFont(30, "mono"))
end

function love.update(dt)
	dt = dt * Game_Speed
	Player:update(dt)
	Enemy:update(dt)
	Ball:update(dt)
	Background:update(dt)
end

function love.draw()
	Background:draw()
	Player:draw()
	Enemy:draw()
	Ball:draw()

	love.graphics.printf(tostring(Player.score), 0, 20, love.graphics.getWidth(), "center")
end

function _G.collision(a, b)
	if a.x + a.width >= b.x and a.x < b.x + b.width and a.y + a.height >= b.y and a.y < b.y + b.height then
		love.audio.play(ping)
		return true
	end
	return false
end
