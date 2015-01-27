local composer = require( "composer" )
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local background = display.newImageRect( sceneGroup, "pic/level_select.png", display.contentWidth, display.contentHeight )
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

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
			defaultFile = "pic/level_" .. level_name[i] .. ".png",
			-- overFile = "button-over.png",
			x = display.contentWidth/2,
			y = display.contentHeight*i/6,
			onRelease = function() return onBtnRelease(level_name[i]) end
		}
		btn.width, btn.height = 500, 130
		sceneGroup:insert( btn )
	end
end

function scene:show( event )
	if event.phase == "will" then
		local function onKeyEvent( event )
			if ( event.keyName == "back" ) then
				Runtime:removeEventListener( "key", onKeyEvent )
				composer.gotoScene( "menu", "fade", 500 )
				return true
			end
			return false
		end
		Runtime:addEventListener( "key", onKeyEvent )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	for i=1, #sceneGroup do 
		sceneGroup[i]:removeSelf()
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )
return scene