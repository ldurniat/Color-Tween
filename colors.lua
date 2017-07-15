local M = {}

function M:tween( target, colorSource, colorDestination, duration, transitionType )
    colorSource = colorSource or { 1, 1, 1 }
    colorDestination = colorDestination or { 0, 0, 0 }
    duration = duration or 1000
    transitionType = transitionType or easing.linear

    local mt = {}
   
    function mt.__index( t, k )
        if k == 'progress' then return t._progress end
    end
    function mt.__newindex( t, k, value )
        if k == 'progress' then
            t._progress = value
            target:setFillColor( unpack( M:lerp( value, colorSource, colorDestination ) ) )
        end
    end

    local progressTable = { _progress=0 }
    setmetatable( progressTable, mt )

    transition.to( progressTable, { progress=1, time=duration, transition=transitionType } ) 
end

function M:lerp( value, colorSource, colorDestination )
    local newColor = {}
    for i=1, 3 do
        newColor[i] = colorSource[i] * ( 1 - value ) + colorDestination[i] * value
    end
    return newColor
end 

return M