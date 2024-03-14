local TextHelper = require "helpers.TextHelper"
local ScreenHelper = require "helpers.ScreenHelper"
local TiledBackground = require "components.TiledBackground"
local Ship = require "components.Ship"

if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf "no"

local screenHelper = ScreenHelper:new()
local background = TiledBackground:new("assets/images/black.png")
local ship = Ship:new("assets/images/playerShip2_orange.png")

function love.load()
    screenHelper:init(1366, 768)
    background:init(0, 0, 1366, 768)
    ship:init(screenHelper:calculateCenterPointX(), screenHelper:calculateCenterPointY())
end

function love.update(dt)
    ship:update(dt)
end

function love.draw()
    background:draw(screenHelper)
    ship:draw(screenHelper)
    TextHelper.draw(screenHelper, "Atelier : Pixels et origine", 10, 10)
    TextHelper.draw(screenHelper, "Screen Scale X : " .. screenHelper:getScaleX(), 10, 30)
    TextHelper.draw(screenHelper, "Screen Scale Y : " .. screenHelper:getScaleY(), 10, 50)
    TextHelper.draw(screenHelper, "Ship Altitude : " .. ship:getAltitude(), 10, 70)
    TextHelper.draw(screenHelper, "Ship Heading : " .. ship:getHeading(), 10, 90)

    TextHelper.draw(screenHelper, "Left/Right : Rotate ship", 10, 130)
    TextHelper.draw(screenHelper, "Up/down : Change altitude of ship", 10, 150)
end

function love.resize(width, height)
    screenHelper:resize(width, height)
end
