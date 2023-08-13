function love.load()
    Player = {}
    Player.x = love.graphics.getWidth() / 2
    Player.y = love.graphics.getHeight() / 2
    Player.speed = 180
    
    Sprites = {}
    Sprites.idlePlayer = love.graphics.newImage('sprites/IdlePlayer.png')
    Sprites.shootingPlayer = love.graphics.newImage('sprites/IdlePlayer.png')
    Sprites.background = love.graphics.newImage('sprites/Background.png')
    Sprites.bullet = love.graphics.newImage('sprites/Bullet.png')
    Sprites.enemy = love.graphics.newImage('sprites/Enemy.png')
end

function love.update(dt)
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

function love.draw()
    love.graphics.draw(Sprites.background, 0, 0)

    love.graphics.draw(Sprites.idlePlayer, Player.x, Player.y)
end