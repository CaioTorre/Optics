-- Optics

-- Use this function to perform your initial setup
function setup()
    midwayH = WIDTH/2
    midwayV = HEIGHT/2
    parameter.number("Pos", 0, WIDTH/2, WIDTH/4 )
    parameter.integer("Test", 1, 4, 1)
    parameter.boolean("DisplayLens", false)
    parameter.boolean("Mirror", false)
    print(WIDTH.."x"..HEIGHT)
    print(midwayH.."x"..midwayV)
    tests = {Convergent(), Concave(), Divergent(), Convex()}
    currentTestIndex = 1
    currentTest = nil
    setTest(currentTestIndex)
    
    hasApplied = false
    --setTest(currentTestIndex)
    
end

function drawObject()
    --line(X, midwayV, X, 8*midwayV/6)
    if CurrentTouch.x <= midwayH and (CurrentTouch.state == BEGAN or CurrentTouch.state == MOVING)
    then
        X = CurrentTouch.x
        Pos = X
        stroke(67, 174, 235, 255)
        fill(67, 174, 235, 100)
        ellipse(CurrentTouch.x, CurrentTouch.y, 50, 50)
        if CurrentTouch.y > 4*midwayV/3
        then
            line(CurrentTouch.x, CurrentTouch.y-25, CurrentTouch.x, 4*midwayV/3)
            fill(0, 0, 0, 255)
            text(midwayH-CurrentTouch.x, CurrentTouch.x, CurrentTouch.y+40)
        else
            line(CurrentTouch.x, CurrentTouch.y+25, CurrentTouch.x, midwayV)
            fill(0, 0, 0, 255)
            if CurrentTouch.y > midwayV
            then
                text(midwayH-CurrentTouch.x, CurrentTouch.x, midwayV-40)
            else
                text(midwayH-CurrentTouch.x, CurrentTouch.x, CurrentTouch.y-60)
            end
        end
        hasApplied = true
    else
        X = Pos
        hasApplied = false
    end
    stroke(255, 10, 0, 255)
    objX1 = X
    objY1 = midwayV
    objX2 = X
    objY2 = 4*midwayV/3
    line(objX1, objY1, objX2, objY2)
    fill(255, 10, 0, 255)
    text(midwayH - X, X, (4*midwayV/3) + 20)
    if X == 250 and (currentTestIndex == 1 or currentTestIndex == 2)
    then
        fill(255, 10, 0, 255)
        text("Imagem imprópria!", midwayH, 80)
    end
    
end

function cleanup()
    output.clear()
end

function setTest()
    --print("T: "..t)
    if currentTest then
        if currentTest.cleanup then
            currentTest:cleanup()
        end
        cleanup()
    end
    
    currentTestIndex = Test
    currentTest = tests[Test]
    currentTest:setup()
    --parameter.number("X", 0, currentTest.limit, WIDTH/4)
end

function findXing(p1l1, p2l1, p1l2, p2l2)
    x11 = p1l1[1]
    y11 = p1l1[2]
    
    x21 = p2l1[1]
    y21 = p2l1[2]
    
    x12 = p1l2[1]
    y12 = p1l2[2]
    
    x22 = p2l2[1]
    y22 = p2l2[2]
    
    m1 = (y21 - y11)/(x21 - x11)
    m2 = (y22 - y12)/(x22 - x12)
    
    b1 = y11-(m1*x11)
    b2 = y12-(m2*x12)
    
    xEnc = (b2 - b1)/(m1 - m2)
    yEnc = (m1*xEnc) + b1
    
    return {xEnc, yEnc}
end

function calculateBaseInt()
    h = HEIGHT/2
    w = WIDTH/2
    pV = 4*h/3
    pH = 4*w/3
    m1 = (pV-h)/(w-pH)
    m2 = (pV-h)/(X-w)
    b1 = pV-(m1*w)
    b2 = h-(m2*w)
    xE = (b2-b1)/(m1-m2)
    yE = (m1*xE) + b1
    return {xE, h, xE, yE}
            --line(xE, h, xE, yE)
end

-- This function gets called once every frame
function draw()
    if Test ~= currentTestIndex
    then
        setTest()
    end
    
    currentTest:draw()
    
    local str = string.format("Teste %d - %s", currentTestIndex, currentTest.title)
    
    font("Vegur-Bold")
    fontSize(22)
    fill(0, 0, 0, 255)
    
    
    text(str, WIDTH/2, HEIGHT - 40)
end

function drawBaseLines(printLeft, printRight)
    background(255, 255, 255, 255)
    strokeWidth(3)
    midwayV = HEIGHT/2
    midwayH = WIDTH/2
    
    stroke(0, 0, 0, 255)
    fill(0, 0, 0, 255)
    line(0, midwayV, WIDTH, midwayV)
    if printLeft
    then
        line(midwayH/3, midwayV-5, midwayH/3, midwayV+5)
        text("C", midwayH/3, midwayV-20)
        line(2*midwayH/3, midwayV-5, 2*midwayH/3, midwayV+5)
        text("F", 2*midwayH/3, midwayV-20)
    end
    if printRight
    then
        line(4*midwayH/3, midwayV-5, 4*midwayH/3, midwayV+5)
        text("F", 4*midwayH/3, midwayV-20)
        line(5*midwayH/3, midwayV-5, 5*midwayH/3, midwayV+5)
        text("C", 5*midwayH/3, midwayV-20)
    end
    line(midwayH, midwayV/2, midwayH, 3*midwayV/2)
end
