local AngleHelper = require "helpers.AngleHelper"
-- Class Ship Definition
Ship = {}

function Ship:new(assetPath)
    ship = {
        assetPath = assetPath,
        positionX = 0,
        positionY = 0,
        heading = 90,
        rotationSpeed = 90,
        altitudeSpeed = 1,
        altitude = 1,
        image = nil
    }
    setmetatable(ship, self)
    self.__index = self

    function ship:init(x, y)
        ship.positionX = x
        ship.positionY = y
        ship.image = love.graphics.newImage(ship.assetPath)
    end

    function ship:draw(screenHelper)
        local imageWidth = ship.image:getWidth()
        local imageHeight = ship.image:getHeight()
        love.graphics.draw(ship.image, screenHelper:positionScaleX(ship.positionX), screenHelper:positionScaleY(ship.positionY), AngleHelper.degToRad(ship.heading - 90), screenHelper:getScaleX() * ship.altitude, screenHelper:getScaleY() * ship.altitude, imageWidth / 2, (imageHeight / 3) * 2)
    end

    function ship:update(dt)
        if love.keyboard.isDown("up") then
            ship.altitude = math.min(2.5, ship.altitude + (ship.altitudeSpeed * dt))
        end
        -- We will decrease the variable by 1/s if any of the wasd keys is pressed.
        if love.keyboard.isDown("down") then
            ship.altitude = math.max(0.5, ship.altitude - (ship.altitudeSpeed * dt))
        end

        if love.keyboard.isDown("right") then
            ship.heading = ship.heading + (ship.rotationSpeed * dt)
            if (ship.heading >= 360) then
                ship.heading = 0
            end
        end
        -- We will decrease the variable by 1/s if any of the wasd keys is pressed.
        if love.keyboard.isDown("left") then
            ship.heading = ship.heading - (ship.rotationSpeed * dt)
            if (ship.heading <= 0) then
                ship.heading = 360
            end
        end
    end

    function ship:getAltitude()
        return ship.altitude
    end

    function ship:getHeading()
        return ship.heading
    end

    return ship
end

return Ship
