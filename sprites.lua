Sprites = {}
    
function Sprites:load()
    Sprites.Player = love.graphics.newImage('sprites/IdlePlayer.png')
    Sprites.background = love.graphics.newImage('sprites/Background.png')
    Sprites.bullet = love.graphics.newImage('sprites/Bullet.png')
    Sprites.enemy = love.graphics.newImage('sprites/Enemy.png')
    Sprites.playerIndicator = love.graphics.newPixelEffect( code )
end

function Sprites:draw()
    love.graphics.draw(Sprites.background, 0, 0)
end
