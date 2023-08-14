Enemies = {}

function Enemies:spawnEnemy()
    local Enemy = {}
    Enemy.x = math.random(0, love.graphics.getWidth())
    Enemy.y = math.random(0, love.graphics.getHeight())
    Enemy.speed = 120
    Enemy.dead = false
    table.insert(Enemies, Enemy)
end

function Enemies:update(dt)
    Enemies:movementAndPlayerCollisions(dt)
    Enemies:bulletCollisions()

    for i=#Enemies,1,-1 do
        local enemyNum = Enemies[i]
        if enemyNum.dead == true then
            table.remove(Enemies, i)
        end
    end
end

function Enemies:bulletCollisions()
    for i,enemyNum in ipairs(Enemies) do
        for j,bulletNum in ipairs(Bullets) do
            if Enemies:distanceBetween(enemyNum.x, enemyNum.y, bulletNum.x, bulletNum.y) < 40 then
                enemyNum.dead = true
                bulletNum.dead = true
            end
        end
    end
end

function Enemies:movementAndPlayerCollisions(dt)
    for i,enemyNum in ipairs(Enemies) do
        enemyNum.x = enemyNum.x + math.cos(Enemies:enemyPlayerAngle(enemyNum)) * enemyNum.speed * dt
        enemyNum.y = enemyNum.y + math.sin(Enemies:enemyPlayerAngle(enemyNum)) * enemyNum.speed * dt
        if Enemies:distanceBetween(enemyNum.x, enemyNum.y, Player.x, Player.y) < 28 then
            for i,enemyNum in ipairs(Enemies) do
                Enemies[i] = nil
            end
        end
    end
end

function Enemies:enemyPlayerAngle(enemy)
    return math.atan2(Player.y - enemy.y, Player.x - enemy.x)
end

function Enemies:distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function Enemies:draw()
    for i,enemyNum in ipairs(Enemies) do
        love.graphics.draw(Sprites.enemy, enemyNum.x, enemyNum.y, Enemies:enemyPlayerAngle(enemyNum) + 3 * math.pi / 2, nil, nil, Sprites.enemy:getWidth() / 2, Sprites.enemy:getWidth() / 2)
    end
end