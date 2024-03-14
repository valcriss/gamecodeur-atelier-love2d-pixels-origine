-- Class TiledBackground Definition
TiledBackground = {}

function TiledBackground:new(assetPath)
    tb = {
        assetPath = assetPath,
        positionX = 0,
        positionY = 0,
        tileWidth = 0,
        tileHeight = 0,
        image = nil,
        imageWidth = 0,
        imageHeight = 0,
        imageXCount = 0,
        imageYCount = 0
    }
    setmetatable(tb, self)
    self.__index = self

    function tb:init(x, y, width, height)
        tb.positionX = x
        tb.positionY = y
        tb.tileWidth = width
        tb.tileHeight = height
        tb.image = love.graphics.newImage(tb.assetPath)
        tb.imageWidth = tb.image:getWidth()
        tb.imageHeight = tb.image:getHeight()
    end

    function tb:draw(screenHelper)
        local scaledImageStartPositionX = screenHelper:positionScaleX(tb.positionX)
        local scaledImageStartPositionY = screenHelper:positionScaleY(tb.positionY)
        local scaledImageWidth = screenHelper:positionScaleX(tb.imageWidth)
        local scaledImageHeight = screenHelper:positionScaleY(tb.imageHeight)
        local scaledImageCountX = math.ceil(love.graphics.getWidth() / scaledImageWidth)
        local scaledImageCountY = math.ceil(love.graphics.getHeight() / scaledImageHeight)

        for x = 0, scaledImageCountX do
            for y = 0, scaledImageCountY do
                local imageX = scaledImageStartPositionX + (x * scaledImageWidth)
                local imageY = scaledImageStartPositionY + (y * scaledImageHeight)
                love.graphics.draw(tb.image, imageX, imageY, 0, screenHelper:getScaleX(), screenHelper:getScaleY())
            end
        end
    end

    return tb
end

return TiledBackground
