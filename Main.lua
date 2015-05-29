-- Optics

-- Use this function to perform your initial setup
function setup()
    midwayH = WIDTH/2
    midwayV = HEIGHT/2
    parameter.number("X", 0, WIDTH/2, WIDTH/4 )
    parameter.integer("Test", 1, 4, 1)
    print(WIDTH.."x"..HEIGHT)
    print(midwayH.."x"..midwayV)
    tests = {Convergent(), Concave(), Divergent(), Convex()}
    currentTestIndex = 1
    currentTest = nil
    setTest(currentTestIndex)
    
    --setTest(currentTestIndex)
    
end

function drawObject()
    stroke(255, 10, 0, 255)
    --line(X, midwayV, X, 8*midwayV/6)
    objX1 = X
    objY1 = midwayV
    objX2 = X
    objY2 = 4*midwayV/3
    line(objX1, objY1, objX2, objY2)
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
    line(0, midwayV, WIDTH, midwayV)
    if printLeft
    then
        line(midwayH/3, midwayV-5, midwayH/3, midwayV+5)
        line(2*midwayH/3, midwayV-5, 2*midwayH/3, midwayV+5)
    end
    if printRight
    then
        line(4*midwayH/3, midwayV-5, 4*midwayH/3, midwayV+5)
        line(5*midwayH/3, midwayV-5, 5*midwayH/3, midwayV+5)
    end
    line(midwayH, midwayV/2, midwayH, 3*midwayV/2)
end
