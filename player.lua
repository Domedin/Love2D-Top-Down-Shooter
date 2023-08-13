Player = {}

function Player:load()
    Player.x = love.graphics.getWidth() / 2
    Player.y = love.graphics.getHeight() / 2
    Player.speed = 180
end

function Player:update(dt)
    Player:movement(dt)
    Player:normalizeMovement()
end

function Player:movement(dt)
    if love.keyboard.isDown("w") then
        Player.y = Player.y - Player.speed * dt
    end
    if love.keyboard.isDown("a") then
        Player.x = Player.x - Player.speed * dt
    end
    if love.keyboard.isDown("s") then
        Player.y = Player.y + Player.speed * dt
    end
    if love.keyboard.isDown("d") then
        Player.x = Player.x + Player.speed * dt
    end
end

function Player:normalizeMovement()
    if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
        Player.speed = 127.278
    elseif love.keyboard.isDown("w") and love.keyboard.isDown("d") then
        Player.speed = 127.278
    elseif love.keyboard.isDown("s") and love.keyboard.isDown("d") then
        Player.speed = 127.278
    elseif love.keyboard.isDown("a") and love.keyboard.isDown("a") then
        Player.speed = 127.278
    else
        Player.speed = 180
    end
end

function Player:draw()
    love.graphics.draw(Sprites.idlePlayer, Player.x, Player.y)
end

