Bullets = {}

function Bullets:spawnBullet()
    local bullet = {}
    bullet.x = Player.x
    bullet.y = Player.y
    bullet.speed = 500
    bullet.direction = Player:playerMouseAngle() + 3 * math.pi / 2
    table.insert(Bullets, bullet)
end

function Bullets:update(dt)
    for i,bulletNum in ipairs(Bullets) do
        bulletNum.x = bulletNum.x + math.cos(bulletNum.direction) * bulletNum.speed * dt
        bulletNum.y = bulletNum.y + math.sin(bulletNum.direction) * bulletNum.speed * dt
    end
    
    for i=#Bullets, 1, -1 do
        local bulletNum = Bullets[i]
        if bulletNum.x < 0 or bulletNum.y < 0 or bulletNum.x > love.graphics.getWidth() or bulletNum.y > love.graphics.getHeight() then
            table.remove(Bullets, i)
        end
    end
end

function Bullets:draw()
    for i,bulletNum in ipairs(Bullets) do
        love.graphics.draw(Sprites.bullet, bulletNum.x, bulletNum.y, bulletNum.direction + math.pi/2, nil, nil, Sprites.bullet:getWidth() / 2, Sprites.bullet:getHeight() / 2)
    end
end