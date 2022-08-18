require('player')
require('ball')
require('ai')

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    gameFont = love.graphics.newFont(40)
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    love.graphics.setFont(gameFont)
    love.graphics.print(tostring(Player.score), 20, 0)
    love.graphics.print(table.concat({'Auto_mode:',tostring(Player.auto)}), 20, 50)
    love.graphics.print(tostring(AI.score), love.graphics.getWidth()-50, 0)
    love.graphics.print(table.concat({'difficuty_mode:',tostring(AI.difficuty_mode)}), love.graphics.getWidth()-400, 50)
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end

function love.keypressed(key)
	if key == "return" then
        AI.difficuty_mode = (AI.difficuty_mode + 1) % 3
        AI:difficulty_mode_change()
    elseif key == 'u' then
        Player.auto = (not Player.auto)
	end
end