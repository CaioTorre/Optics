Convex = class()

function Convex:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.title = "Espelho convexo"
end

function Convex:setup()
    
end

function Convex:draw()
    -- Codea does not automatically call this method
    drawBaseLines(false, true)
    
    stroke(0, 0, 0, 255)
    line(midwayH, midwayV/2, midwayH+30, (midwayV/2)-30)
    line(midwayH, 3*midwayV/2, midwayH+30, (3*midwayV/2)+30)
    
    drawObject()
    
    stroke(255, 218, 0, 255)
    line(0, 4*midwayV/3, midwayH, 4*midwayV/3)
    supA = ((5*w/3)*(2*w/3))/((2*w/3)+(w-X))
    supB = ((h/3)*(2*w/3))/((2*w/3)+(w-X))
    line(X, 4*midwayV/3, midwayH, supB+midwayV)
    
    stroke(255, 136, 0, 255)
    line(midwayH, 8*midwayV/6, WIDTH, midwayV/3)
    line(midwayH, supB+midwayV, WIDTH, midwayV-(supB/2))
    
    ali = (midwayV/3)*(2*midwayH/3)/(midwayH-X+(2*midwayH/3))
    encX = ((4*h*w)-(3*ali*w))/((6*h)-(9*ali))
    encY = (h*encX/w)+(h/3)
    
    stroke(255, 218, 0, 255)
    sup1 = (5/2)*ali
    line(0, sup1+h, X, 4*h/3)
    
    stroke(0, 193, 255, 255)
    line(encX+(2*(w-encX)), midwayV, encX+(2*(w-encX)), encY)
end

function Convex:touched(touch)
    -- Codea does not automatically call this method
end
