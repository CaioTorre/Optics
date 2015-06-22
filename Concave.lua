Concave = class()

function Concave:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.title = "Espelho côncavo"
    self.limit = 3*WIDTH/5
end

function Concave:setup()
    
end

function Concave:draw()
    background(255, 255, 255, 255)
    drawBaseLines(true, false)
    stroke(0, 0, 0, 255)
    line(midwayH, midwayV/2, midwayH-30, (midwayV/2)-30)
    line(midwayH, 3*midwayV/2, midwayH-30, (3*midwayV/2)+30)
    --line(0, HEIGHT/2, WIDTH, HEIGHT/2)
    --line(3*WIDTH/5, HEIGHT/4, 3*WIDTH/5, 3*HEIGHT/4)
    --line(3*WIDTH/5, 3*HEIGHT/4, (3*WIDTH/5)-30, (3*HEIGHT/4)+30)
    --line(midwayH, midwayV, (3*WIDTH/5)-30, (HEIGHT/4)-30)
    --stroke(255, 10, 0, 255)
    --line(X, midwayV, X, 8*midwayV/6)
    --objX1 = X
    --objY1 = midwayV
    --objX2 = X
    --objY2 = 4*midwayV/3
    --line(objX1, objY1, objX2, objY2)
    
    drawObject()
    
    stroke(255, 218, 0, 255)
    line(0, objY2, midwayH, objY2)
    supP1 = (midwayV/3)*(2*midwayH/3)/(midwayH/3)
    line(midwayH, 4*midwayV/3, 0, midwayV-supP1)
    line(objX2, objY2, midwayH, midwayV)
    supP2 = (midwayV/3)*(midwayH)/(midwayH-X)
    line(midwayH, midwayV, 0, midwayV-supP2)
    if X > 2*midwayH/3
    then
        stroke(255, 136, 0, 255)
        supP3 = (midwayH/3)*(2*midwayV/3)/(midwayV/3)
        line(midwayH, 4*midwayV/3, midwayV+supP3, HEIGHT)
        supP4 = (midwayV)*(midwayH-X)/(midwayV/3)
        line(midwayH, midwayV, midwayH+supP4, HEIGHT)
    end
    ans = calculateBaseInt()
            --line(xE, h, xE, yE)
    stroke(0, 193, 255, 255)
    line(WIDTH-ans[1], ans[2], WIDTH-ans[3], ans[4])
end

function Concave:touched(touch)
    -- Codea does not automatically call this method
end
