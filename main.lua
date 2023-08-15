require("player")
require("sprites")
require("enemies")
require("bullet")
require("gameManager")
require("enemySpawner")

function love.load()
    Player:load()
    Sprites:load()
    Gamemanager:load()
    EnemySpawner:load()
end

function love.update(dt)
    Player:update(dt)
    Enemies:update(dt)
    Bullets:update(dt)
    EnemySpawner:update(dt)
end

function love.draw()
    Sprites:draw()
    Player:draw()
    Enemies:draw()
    Bullets:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 then
        Bullets:spawnBullet()
    end
end