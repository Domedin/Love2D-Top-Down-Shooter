Enemies = {}

function Enemies:load()
    math.randomseed(os.time())
end

function Enemies:spawnEnemy()
    local Enemy = {}
    Enemy.x = 0
    Enemy.y = 0
    Enemy.speed = 120
    Enemy.dead = false
    table.insert(Enemies, Enemy)

    local side = math.random(1, 4)

    if side == 1 then
        Enemy.x = -30
        Enemy.y = math.random(0, love.graphics.getHeight())
    elseif side == 2 then
        Enemy.x = love.graphics.getWidth() + 30
        Enemy.y = math.random(0, love.graphics.getHeight())
    elseif side == 3 then
        Enemy.x = math.random(0, love.graphics.getWidth())
        Enemy.y = -30
    elseif side == 4 then
        Enemy.x = math.random(0, love.graphics.getWidth())
        Enemy.y = love.graphics.getHeight() + 30
    end
end

function Enemies:update(dt)
    Enemies:movementAndPlayerCollisions(dt)
    Enemies:bulletCollisions()
    Enemies:checkDead()
end

function Enemies:checkDead()
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
                Gamemanager.score = Gamemanager.score + 1
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
                Gamemanager.gamestate = 1
                Player.x = love.graphics.getWidth() / 2
                Player.y = love.graphics.getHeight() / 2
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