AI = {}

function AI:load()
    self.score = 0
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 50
    self.y =  love.graphics.getHeight() / 2
    self.yVel = 0
    self.difficuty_mode = 2
    self:difficulty_mode_change()
    self.timer = 0
end

function AI:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        -- make timer to make AI beatable
        self.timer = 0
        self:acquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

function AI:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

function AI:checkBoundaries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function AI:difficulty_mode_change()
    if self.difficuty_mode == 1 then
        self.speed = 700
        self.rate = 0.3
    elseif self.difficuty_mode == 2 then
        self.speed = 1000
        self.rate = 0
    elseif self.difficuty_mode == 0 then
        self.speed = 500
        self.rate = 0.5
    end
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end