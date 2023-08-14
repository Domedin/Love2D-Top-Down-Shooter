require("player")
require("sprites")
require("enemies")

function love.load()
    Player:load()
    Sprites:load()
end

function love.update(dt)
    Player:update(dt)
end

function love.draw()
    Sprites:draw()
    Player:draw()
    Enemies:draw()
end

function love.keypressed(key)
    if key == "space" then
        Enemies:spawnEnemy()
    end
end