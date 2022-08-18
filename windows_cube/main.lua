function love.load()
    Ball:load()
end

function love.update(dt)
    Ball:update(dt)
end

function love.draw()
    Ball:draw()
end

Ball = {}
function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 40
    self.height = 40
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = -self.speed
end

function Ball:update(dt)
    self:move(dt)
    self:checkBoundaries("vertical")
    self:checkBoundaries("horizontal")
end

function Ball:checkBoundaries(direction)
    if direction == "vertical" then
        if self.y < 0 then
            self.y = 0
            self.yVel = -self.yVel
        elseif self.y + self.height > love.graphics.getHeight() then
            self.y = love.graphics.getHeight() - self.height
            self.yVel =  -self.yVel
        end
    elseif direction == "horizontal" then
        if self.x < 0 then
            self.x = 0
            self.xVel = -self.xVel
        elseif self.x + self.width > love.graphics.getWidth() then
            self.x = love.graphics.getWidth() - self.width
            self.xVel =  -self.xVel
        end
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end