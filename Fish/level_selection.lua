local composer = require( "composer" )
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local background = display.newImageRect( "pic/level_select.png", display.contentWidth, display.contentHeight )
	background.x, background.y = display.contentWidth / 2, display.contentHeight / 2
	sceneGroup:insert( background )

	level_name = {"school", "place_location", "transportation", "personal_characteristics", "time"}

	local function onBtnRelease(level)
		local options = {
		    effect = "fade",
		    time = 500,
		    params = {word = level}
		}
		composer.gotoScene( "game", options )
		return true	-- indicates successful touch
	end

	for i=1, #level_name do 
		local btn = widget.newButton{
			-- basedir = "pic",
			defaultFile = "pic/level_" .. level_name[i] .. ".png",
			-- overFile = "button-over.png",
			x = display.contentWidth/2,
			y = display.contentHeight - 480 + 80*i,
			onRelease = function() return onBtnRelease(level_name[i]) end
		}
		btn.width, btn.height = 220, 40
		sceneGroup:insert( btn )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	for i=1, #sceneGroup do 
		sceneGroup[i]:removeSelf()
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
return scene