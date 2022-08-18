Player = {}

function Player:load()
    self.score = 0
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 100
    self.speed = 1000
    self.auto = false
end

function Player:update(dt)
    if self.auto then
        self:autoplay(dt)
    end
    self:move(dt)
    if love.mouse.isDown(1) then
        self:mouse_move(dt)
    end
    self:checkBoundaries()
end

function Player:move(dt)
    if love.keyboard.isDown('w') then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown('s') then
        self.y = self.y + self.speed * dt
    end
end

function Player:mouse_move(dt)
    local x, y = love.mouse.getPosition()
    self.y = y
end

function Player:checkBoundaries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:autoplay(dt)
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
    self.y = self.y + self.yVel * dt
end