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
        if love.keyboard.isDown("w") and Player.y > 0 then
            Player.y = Player.y - Player.speed * dt
        end
        if love.keyboard.isDown("a") and Player.x > 0 then
            Player.x = Player.x - Player.speed * dt
        end
        if love.keyboard.isDown("s") and Player.y < love.graphics.getHeight() then
            Player.y = Player.y + Player.speed * dt
        end
        if love.keyboard.isDown("d") and Player.x < love.graphics.getWidth() then
            Player.x = Player.x + Player.speed * dt
        end
    end
end

function Player:normalizeMovement()
    

    if love.keyboard.isDown("w") and love.keyboard.isDown("a") or
       love.keyboard.isDown("w") and love.keyboard.isDown("d") or
       love.keyboard.isDown("s") and love.keyboard.isDown("d") or
       love.keyboard.isDown("s") and love.keyboard.isDown("a") then
        Player.speed = 127.278
    else
        Player.speed = 180
    end
end

function Player:playerMouseAngle()
    local angleOffset = 3 * math.pi / 2
    return math.atan2(Player.y - love.mouse.getY(), Player.x - love.mouse.getX()) + angleOffset
end

function Player:draw()
    love.graphics.draw(Sprites.Player, Player.x, Player.y, Player:playerMouseAngle(), nil, nil, Sprites.Player:getWidth() / 2, Sprites.Player:getHeight() * 9 / 13)
end