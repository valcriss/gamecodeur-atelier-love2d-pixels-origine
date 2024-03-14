-- Class TextHelper Definition
ScreenHelper = {}

function ScreenHelper:new(referenceWidth --[[optional]], referenceHeight --[[optional]])
    referenceWidth = referenceWidth or 800
    referenceHeight = referenceHeight or 600
    sh = {
        windowWidth = referenceWidth,
        windowHeight = referenceHeight,
        scaleX = 1,
        scaleY = 1
    }
    setmetatable(sh, self)
    self.__index = self

    function sh:init(width, height)
        sh.windowWidth = width
        sh.windowHeight = height
        love.window.setMode(width, height, {resizable = true, vsync = 0, minwidth = 800, minheight = 600})
        sh.calculateScale()
    end

    function sh:resize(width, height)
        sh.calculateScale()
    end

    function sh:calculateScale()
        width = love.graphics.getWidth()
        height = love.graphics.getHeight()
        sh.scaleX = width / sh.windowWidth
        sh.scaleY = height / sh.windowHeight
    end

    function sh:calculateCenterPointX()
        return sh.windowWidth / 2
    end

    function sh:calculateCenterPointY()
        return sh.windowHeight / 2
    end

    function sh:getWindowWidth()
        return sh.windowWidth
    end

    function sh:getWindowHeight()
        return sh.windowHeight
    end

    function sh:getScaleX()
        return sh.scaleX
    end

    function sh:getScaleY()
        return sh.scaleY
    end

    function sh:positionScaleX(x)
        return x * sh.scaleX
    end

    function sh:positionScaleY(y)
        return y * sh.scaleY
    end

    return sh
end

return ScreenHelper
