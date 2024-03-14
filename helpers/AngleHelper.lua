-- Class AngleHelper Definition
local AngleHelper = {}
AngleHelper.__index = AngleHelper

function AngleHelper:__call(tab)
    self.tab = tab or {}
    setmetatable({}, AngleHelper)
    return self
end

function AngleHelper.degToRad(angle)
    return angle * math.pi / 180
end

return AngleHelper
