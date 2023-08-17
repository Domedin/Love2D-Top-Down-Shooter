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
    Enemies:load()
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
    Gamemanager:draw()
end