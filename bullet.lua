Bullets = {}

function Bullets:load()
    coolDown = 0
end

function Bullets:spawnBullet()
    local bullet = {}
    bullet.x = Player.x
    bullet.y = Player.y
    bullet.speed = 500
    bullet.dead = false
    bullet.direction = Player:playerMouseAngle() + 3 * math.pi / 2
    table.insert(Bullets, bullet)
end

function Bullets:update(dt)
    Bullets:moveBullets(dt)
    Bullets:outOfBounds()
    Bullets:removeBullets()
    
    if coolDown > 0 then
        coolDown = math.max(0, coolDown - dt)
    end
    if Gamemanager.gamestate == 2 then
        if love.mouse.isDown(1)==true then
            if coolDown <= 0 then
                Bullets:spawnBullet()
                coolDown = 0.1
            end
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 and Gamemanager.gamestate == 1 then
        Gamemanager.gamestate = 2
        EnemySpawner.timeBetweenSpawns = 0.7
        Gamemanager.score = 0
    end
end

function Bullets:moveBullets(dt)
    for i,bulletNum in ipairs(Bullets) do
        bulletNum.x = bulletNum.x + math.cos(bulletNum.direction) * bulletNum.speed * dt
        bulletNum.y = bulletNum.y + math.sin(bulletNum.direction) * bulletNum.speed * dt
    end
end

function Bullets:outOfBounds()
    for i=#Bullets, 1, -1 do
        local bulletNum = Bullets[i]
        if bulletNum.x < 0 or bulletNum.y < 0 or bulletNum.x > love.graphics.getWidth() or bulletNum.y > love.graphics.getHeight() then
            table.remove(Bullets, i)
        end
    end
end

function Bullets:removeBullets()
    for i=#Bullets,1,-1 do
        local bulletNum = Bullets[i]
        if bulletNum.dead == true then
            table.remove(Bullets, i)
        end
    end
end

function Bullets:draw()
    for i,bulletNum in ipairs(Bullets) do
        love.graphics.draw(Sprites.bullet, bulletNum.x, bulletNum.y, bulletNum.direction + math.pi/2, nil, nil, Sprites.bullet:getWidth() / 2, Sprites.bullet:getHeight() / 2)
    end
end