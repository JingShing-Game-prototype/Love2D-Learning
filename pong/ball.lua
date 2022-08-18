Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.or_speed = 200
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
    self.accelerate = true
    self.reset_speed = true
    self.accelerate_speed = 50
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
    self:overBoundaries()
end

function Ball:collide()
    if checkCollision(self, Player) then
        if self.accelerate then
            self.speed = self.speed + self.accelerate_speed
        end
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosion = middleBall - middlePlayer
        self.yVel = collisionPosion * 5
    end

    if checkCollision(self, AI) then
        if self.accelerate then
            self.speed = self.speed + self.accelerate_speed
        end
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosion = middleBall - middleAI
        self.yVel = collisionPosion * 5
    end

    self:checkBoundaries('vertical')
    -- self:checkBoundaries('horizontal')
end

function Ball:checkBoundaries(direction)
    if direction == 'vertical' then
        if self.y < 0 then
            self.y = 0
            self.yVel = -self.yVel
        elseif self.y + self.height > love.graphics.getHeight() then
            self.y = love.graphics.getHeight() - self.height
            self.yVel =  -self.yVel
        end
    elseif direction == 'horizontal' then
        if self.x < 0 then
            self.x = 0
            self.xVel = -self.xVel
        elseif self.x + self.width > love.graphics.getWidth() then
            self.x = love.graphics.getWidth() - self.width
            self.xVel =  -self.xVel
        end
    end
end

function Ball:overBoundaries()
    if self.x < 0 then
        AI.score = AI.score + 1
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        if self.reset_speed then
            self.speed = self.or_speed
        end
        self.xVel = self.speed
    elseif self.x > love.graphics.getWidth() then
        Player.score = Player.score + 1
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        if self.reset_speed then
            self.speed = self.or_speed
        end
        self.xVel = -self.speed
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end