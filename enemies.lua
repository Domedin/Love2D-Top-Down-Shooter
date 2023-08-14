Enemies = {}

function Enemies:spawnEnemy()
    local Enemy = {}
    Enemy.x = math.random(0, love.graphics.getWidth())
    Enemy.y = math.random(0, love.graphics.getHeight())
    Enemy.speed = 100
    table.insert(Enemies, Enemy)
end

function Enemies:enemyPlayerAngle(enemy)
    return math.atan2(Player.y - enemy.y, Player.x - enemy.x)  + 3 * math.pi / 2
end

function Enemies:draw()
    for i,enemyNum in ipairs(Enemies) do
        love.graphics.draw(Sprites.enemy, enemyNum.x, enemyNum.y, Enemies:enemyPlayerAngle(enemyNum), nil, nil, Sprites.enemy:getWidth() / 2, Sprites.enemy:getWidth() / 2)
    end
end