Gamemanager = {}

function Gamemanager:load() 
    Gamemanager.gamestate = 1
    
    myFont = love.graphics.newFont(30)
end

function Gamemanager:draw()
    if Gamemanager.gamestate == 1 then
        love.graphics.setFont(myFont)
        love.graphics.printf("Click Anywhere to Begin!", 0, 50, love.graphics.getWidth(), "center")
    end
end