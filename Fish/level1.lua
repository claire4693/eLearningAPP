-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	local wave = display.newImageRect( sceneGroup, "wave.png", display.contentWidth, display.contentHeight)
    wave.x, wave.y = display.contentWidth/2, display.contentHeight/2
    wave.ydir = 1
	wave.yspeed = 2

	local function newBall( params )
		local xpos = display.contentWidth*0.5
		local ypos = display.contentHeight*0.5
		local circle = display.newCircle( xpos, ypos, params.radius );
		circle:setFillColor( params.r, params.g, params.b, 255 );
		circle.xdir = params.xdir
		circle.ydir = params.ydir
		circle.xspeed = params.xspeed
		circle.yspeed = params.yspeed
		circle.radius = params.radius

		return circle
	end

	local params = {
		{ radius=20, xdir=1, ydir=1, xspeed=2.8, yspeed=6.1, r=255, g=0, b=0 },
		{ radius=12, xdir=1, ydir=1, xspeed=3.8, yspeed=4.2, r=255, g=255, b=0 },
		{ radius=15, xdir=1, ydir=-1, xspeed=5.8, yspeed=5.5, r=255, g=0, b=255 },
	--	newBall{ radius=10, xdir=-1, ydir=1, xspeed=3.8, yspeed=1.2 }
	}

	local collection = {}

	-- Iterate through params array and add new balls into an array
	for _,item in ipairs( params ) do
		local ball = newBall( item )
		collection[ #collection + 1 ] = ball
	end

	-- Get current edges of visible screen (accounting for the areas cropped by "zoomEven" scaling mode in config.lua)
	local screenTop = display.screenOriginY
	local screenBottom = display.viewableContentHeight + display.screenOriginY
	local screenLeft = display.screenOriginX
	local screenRight = display.viewableContentWidth + display.screenOriginX

	function collection:enterFrame( event )
		for _,ball in ipairs( collection ) do
			local dx = ( ball.xspeed * ball.xdir );
			local dy = ( ball.yspeed * ball.ydir );
			local xNew, yNew = ball.x + dx, ball.y + dy

			local radius = ball.radius
			if ( xNew > screenRight - radius or xNew < screenLeft + radius ) then
				ball.xdir = -ball.xdir
			end
			if ( yNew > screenBottom - radius or yNew < screenTop + radius ) then
				ball.ydir = -ball.ydir
			end

			ball:translate( dx, dy )
		end
	end

	function wave:enterFrame( event )
		local dy = ( wave.yspeed * wave.ydir );
		local yNew = wave.y + dy

		if ( yNew > screenBottom + wave.height / 2 or yNew < screenBottom - wave.height / 2) then
			print(yNew)
			print(screenBottom + wave.height)
			print(screenBottom - 1)
			wave.ydir = -wave.ydir
		end

		wave:translate( 0, dy )
	end

	Runtime:addEventListener( "enterFrame", collection );
	Runtime:addEventListener( "enterFrame", wave );
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.   
		-- physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		-- physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	-- package.loaded[physics] = nil
	-- physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene