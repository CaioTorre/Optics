Convergent = class()

function Convergent:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.title = "Lente convergente"
    self.limit = WIDTH/2
end

function Convergent:setup()
end

function Convergent:draw()
    -- Codea does not automatically call this method
    drawBaseLines(true, true)
    DisplayLens = false
    if DisplayLens == true
    then
        fill(152, 197, 223, 100)
        stroke(152, 197, 223, 100)
        ellipse(midwayH, midwayV, 100, midwayV)
    end
    
     if TestNumber ~= currentTestIndex then
        setTest(TestNumber)
    end
    stroke(0, 0, 0, 255)
    line(midwayH-20, midwayV/2+20, midwayH+20, midwayV/2+20)
    line(midwayH-20, 3*midwayV/2-20, midwayH+20, 3*midwayV/2-20)
    
    line(midwayH-20, 3*midwayV/2-20, midwayH, 3*midwayV/2)
    line(midwayH+20, 3*midwayV/2-20, midwayH, 3*midwayV/2)
    line(midwayH-20, midwayV/2+20, midwayH, midwayV/2)
    line(midwayH+20, midwayV/2+20, midwayH, midwayV/2)
    --stroke(255, 10, 0, 255)
    --line(X, midwayV, X, 8*midwayV/6)
    --objX1 = X
    --objY1 = midwayV
    --objX2 = X
    --objY2 = 4*midwayV/3
    --line(objX1, objY1, objX2, objY2)
    drawObject()
    
    -- Light
    stroke(255, 218, 0, 255)
    line(0, 8*midwayV/6, midwayH, 8*midwayV/6)
    line(midwayH, 8*midwayV/6, WIDTH, midwayV/3)
    
    --line(X, 4*midwayV/3, WIDTH, midwayV-((midwayV/3)*midwayH/(midwayH-X)))
    supLineY2 = midwayV-((midwayV/3)*midwayH/(midwayH-X))
    line(objX2, objY2, WIDTH, supLineY2)
    --line(X, 4*midwayV/3, WIDTH, 40)
    
    if (X < 2*midwayH/3) 
    then
        stroke(0, 193, 255, 255)
        if (X <= 4*midwayH/3)
        then
            w = midwayH/2
            h = midwayV/2
            --encX = 6.5*midwayH/3-X
            --encY = 
            --Static line: y=7-x
            --Moving line: y=((3*X*midwayV)+(midwayV*midwayH)-(midwayV*x))/(3*X)
            --Encounter X: x=((3*X*midwayV)+(midwayV*midwayH)-(21*X))/(midwayV-(3*X))
            --Encounter Y: y=7-Ex
            
            h = HEIGHT/2
            w = WIDTH/2
            pV = 4*h/3
            pH = 4*w/3
            pts = findXing({X, pV}, {w, h}, {w, pV}, {pH, h})
            --m1 = (pV-h)/(w-pH)
            --m2 = (pV-h)/(X-w)
            --b1 = pV-(m1*w)
            --b2 = h-(m2*w)
            --xE = (b2-b1)/(m1-m2)
            --yE = (m1*xE) + b1
            --line(xE, h, xE, yE)
            line(pts[1], h, pts[1], pts[2])
            
        else
            
        end
    else
        --line((midwayH-(midwayH*HEIGHT/midwayV)), HEIGHT, midwayH, 4*midwayV/3)
        prol1X2 = midwayH - ((midwayH/3)*HEIGHT/(midwayV/3))
        stroke(255, 136, 0, 255)
        line(midwayH, 4*midwayV/3, 1*midwayH/3, 6*midwayV/3)
        prol2X2 = midwayH-((midwayH-X)*midwayV/(midwayV/3))
        line(objX1, objY2, prol2X2, HEIGHT)
        stroke(0, 193, 255, 255)
            --h = HEIGHT/2
            --w = WIDTH/2
            --pV = 4*h/3
            --pH = 4*w/3
            --m1 = (pV-h)/(w-pH)
            --m2 = (pV-h)/(X-w)
            --b1 = pV-(m1*w)
            --b2 = h-(m2*w)
            --xE = (b2-b1)/(m1-m2)
            --yE = (m1*xE) + b1
        ans = calculateBaseInt()
            --line(xE, h, xE, yE)
        line(ans[1], ans[2], ans[3], ans[4])
    end
    ans = calculateBaseInt()
    fill(72, 66, 168, 255)
            --print(ans[4]..", "..h)
            if (ans[4] > h) 
            then
                --print("this")
                text(w - ans[1], ans[1], ans[4] + 20)
            else
                --print("that")
                text(w - ans[1], ans[1], ans[4] - 20)
            end
end

function Convergent:touched(touch)
    -- Codea does not automatically call this method
end
