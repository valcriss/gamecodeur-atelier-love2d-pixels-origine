local AngleHelper = require "helpers.AngleHelper"

-- Class TextHelper Definition
local TextHelper = {}
TextHelper.__index = TextHelper

function TextHelper:__call(tab)
    self.tab = tab or {}
    setmetatable({}, TextHelper)
    return self
end

-- Class TextHelper Methods

-- Creates a text object
function TextHelper.createText(content)
    font = love.graphics.getFont()
    text = love.graphics.newText(font, content)
    return text
end

function TextHelper.draw(screenHelper --[[required]], content --[[required]], x --[[required]], y --[[required]], alignmentX --[[optional]], alignmentY --[[optional]], rotation --[[optional]], scale --[[optional]])
    alignmentX = alignmentX or "left"
    alignmentY = alignmentY or "left"
    rotation = rotation or 0
    scale = scale or 1
    text = TextHelper.createText(content)
    originX = 0
    originY = 0

    if alignmentX == "center" then
        originX = 0.5
    end
    if alignmentY == "center" then
        originY = 0.5
    end
    if alignmentX == "right" then
        originX = 1
    end
    if alignmentY == "right" then
        originY = 1
    end
    love.graphics.draw(text, screenHelper:positionScaleX(x), screenHelper:positionScaleY(y), AngleHelper.degToRad(rotation), scale * screenHelper:getScaleX(), scale * screenHelper:getScaleY(), originX, originY)
end

-- Gets the width of the text
function TextHelper.getTextWidth(text)
    return text.getWidth(text)
end

-- Gets the height of the text
function TextHelper.getTextHeight(text)
    return text.getHeight(text)
end

-- Centers the text horizontally
function TextHelper.centerTextPointX(text, x)
    return x - (TextHelper.getTextWidth(text) / 2)
end

-- Centers the text vertically
function TextHelper.centerTextPointY(text, y)
    return y - (TextHelper.getTextHeight(text) / 2)
end

function TextHelper.rightTextPointX(text, x)
    return x - (TextHelper.getTextWidth(text))
end

-- Centers the text vertically
function TextHelper.rightTextPointY(text, y)
    return y - (TextHelper.getTextHeight(text))
end

return TextHelper
