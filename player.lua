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
    if Gamemanager.gamestate == 2 then
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

function Player:playerMouseAngle()
    return math.atan2(Player.y - love.mouse.getY(), Player.x - love.mouse.getX()) + 3 * math.pi / 2
end

function Player:draw()
    love.graphics.draw(Sprites.idlePlayer, Player.x, Player.y, Player:playerMouseAngle(), nil, nil, Sprites.idlePlayer:getWidth() / 2, Sprites.idlePlayer:getHeight() * 8 / 13)
end

