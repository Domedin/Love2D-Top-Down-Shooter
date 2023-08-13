require("player")
require("sprites")

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
end