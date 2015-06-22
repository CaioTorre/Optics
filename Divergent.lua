Divergent = class()

function Divergent:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.title = "Lente divergente"
end

function Divergent:setup()
    
end

function Divergent:draw()
    -- Codea does not automatically call this method
    drawBaseLines(true, true)
    
    stroke(0, 0, 0, 255)
    line(w-20, h/2, w+20, h/2)
    line(w-20, 3*h/2, w+20, 3*h/2)
    
    line(midwayH, 3*midwayV/2-20, midwayH-20, 3*midwayV/2)
    line(midwayH, 3*midwayV/2-20, midwayH+20, 3*midwayV/2)
    line(midwayH, midwayV/2+20, midwayH-20, midwayV/2)
    line(midwayH, midwayV/2+20, midwayH+20, midwayV/2)
    
    drawObject()
    
    stroke(255, 218, 0, 255)
    line(0, objY2, midwayH, objY2)
    supP1 = (midwayH/3)*(2*midwayV/3)/(midwayV/3)
    line(midwayH, 4*midwayV/3, supP1+midwayH, HEIGHT)
    ali = (midwayV/3)*(2*midwayH/3)/(midwayH-X+(2*midwayH/3))
    line(objX2, objY2, midwayH, ali+midwayV)
    bli = (5/2)*ali
    cli = midwayH*(ali-bli)/(midwayH-X)
    line(midwayH, midwayV+ali, WIDTH, bli+midwayV)
    
    stroke(255, 136, 0, 255)
    line(midwayH, midwayV+ali, 0, midwayV-(bli/5))
    line(midwayH, 4*midwayV/3, 0, midwayV/3)
    --line(objX2, objY2, midwayH, midwayV)
    --supP2 = (midwayV/3)*(midwayH)/(midwayH-X)
    --line(midwayH, midwayV, 0, midwayV-supP2)
    --supLineY2 = midwayV-((midwayV/3)*midwayH/(midwayH-X))
    --line(objX2, objY2, WIDTH, supLineY2)
    encX = ((4*h*w)-(3*ali*w))/((6*h)-(9*ali))
    encY = (h*encX/w)+(h/3)
    stroke(255, 136, 0, 180)
    line(5*midwayH/3, midwayV, midwayH, midwayV+ali)
            --line(xE, h, xE, yE)
    stroke(0, 193, 255, 255)
    line(encX, midwayV, encX, encY)
end

function Divergent:touched(touch)
    -- Codea does not automatically call this method
end
