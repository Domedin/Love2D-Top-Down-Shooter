require("player")
require("sprites")
require("enemies")
require("bullet")

function love.load()
    Player:load()
    Sprites:load()
end

function love.update(dt)
    Player:update(dt)
    Enemies:update(dt)
    Bullets:update(dt)
end

function love.draw()
    Sprites:draw()
    Player:draw()
    Enemies:draw()
    Bullets:draw()
end

function love.keypressed(key)
    if key == "space" then
        Enemies:spawnEnemy()
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        Bullets:spawnBullet()
    end
end