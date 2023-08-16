Bullets = {}

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
end

function love.mousepressed(x, y, button)
    if button == 1 and Gamemanager.gamestate == 2 then
        Bullets:spawnBullet()
    elseif button == 1 and Gamemanager.gamestate == 1 then
        Gamemanager.gamestate = 2
        EnemySpawner.timeBetweenSpawns = 0.7
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