Gamemanager = {}

function Gamemanager:load() 
    Gamemanager.gamestate = 1
    Gamemanager.score = 0
    
    myFont = love.graphics.newFont(30)
end

function Gamemanager:draw()
    if Gamemanager.gamestate == 1 then
        love.graphics.setFont(myFont)
        love.graphics.printf("Click Anywhere to Begin!", 0, 50, love.graphics.getWidth(), "center")
    end

    love.graphics.printf("Score: " .. Gamemanager.score, 0, 0, love.graphics.getWidth(), "center")
end