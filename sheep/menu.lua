-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn
local menuMusicChannel
-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	audio.fadeOut( { channel=menuMusicChannel, time=700 } )
	--audio.fade( { channel = menuMusicChannel, time = 700, volume = 0 } )
	composer.gotoScene( "select", "fade", 500 )
	--composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	--local menuMusic = audio.loadSound( "welcome/Mary_Had_A_Little_Lamb_(vocal).mp3"  )
	menuMusicChannel = audio.play( menuMusic, { loops = -1 } )
	--audio.setVolume( audio.getVolume(), { channel = menuMusicChannel } )

	-- display a background image
	local background = display.newImageRect( "welcome/background.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "welcome/logo.png", 264, 70 )
	titleLogo.x = display.contentWidth * 0.5
	titleLogo.y = 200
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		label="點一下開始遊戲",
		labelColor = { default={255}, over={128} },
		textOnly = true,
		width=display.contentWidth, height=display.contentHeight*1.55,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentWidth*0.5
	playBtn.y = display.contentHeight*0.75
	--local begin = display.newText("點一下開始遊戲", display.contentWidth*0.5, display.contentHeight*0.75, native.systemFont, 20, right)
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
	--sceneGroup:insert( begin )
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
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene