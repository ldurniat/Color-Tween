# Color-Tween

*Color-Tween* is simple module for color transition for [Corona SDK](https://coronalabs.com/corona-sdk/) using linear interpolation(lerp function). It uses transitions to work so you can pause/resume/stop it. Color-Tween is designed to work with
display objects.

#### Example:

```
local colors = require( 'colors' )

_W  = display.contentWidth
_H  = display.contentHeight
_CX = display.contentCenterX
_CY = display.contentCenterY

local colorSource = { 116/255, 237/255, 255/255 }
local colorDestination = { 86/255, 178/255, 132/255 }
local duration = 1500
local background = display.newRect( _CX, _CY, _W, _H )

colors:tween( background, colorSource, colorDestination, duration )
```
