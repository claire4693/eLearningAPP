
-----------------------------------------------------------------------------------------
--
-- select.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local selectMusicChannel, reading, listening
local btnGroup = display.newGroup()
local modeGroup = display.newGroup()
local classBtn = {}
local rankBtn = {}
local modeBtn = {}

local function onModeRelesae( event )
	if event.target:getLabel() == "Listening" then
		TEXT = false
	else
		TEXT = true
	end

	audio.fadeOut( { channel = selectMusicChannel, time = 700} )
	transition.to(soundGroup, {time = 500, alpha = 0})
	transition.to(btnGroup, {delay = 700, time = 0, alpha = 1})
	transition.to(modeGroup, {delay = 700, time = 0, alpha = 0})
	composer.gotoScene( "game", "fade", 500 )
end

local function onBtnRelease( event )
	class = event.target:getLabel()
	backgroundMusic = gameMusic[class]
	vocNum = vocNumTable[class]

	transition.to(btnGroup, {time = 500, alpha = 0})
	
	modeGroup.alpha = 0

	modeBtn = widget.newButton{
		label = "Reading",
		labelColor = { default={255}, over={128} },
		defaultFile = "select/button.png",
		overFile = "select/button-over.png",
		width = 154, height = 40,
		onRelease = onModeRelesae	-- event listener function
	}
	modeBtn.x = display.contentWidth*0.7
	modeBtn.y = display.contentHeight*0.55
	modeGroup:insert( modeBtn )

	reading = display.newImage("select/reading.png")
	reading.xScale, reading.yScale = .6, .6
	reading.x, reading.y = display.contentWidth*0.7, display.contentHeight*0.37
	modeGroup:insert( reading )

	modeBtn = widget.newButton{
		label = "Listening",
		labelColor = { default={255}, over={128} },
		defaultFile = "select/button.png",
		overFile = "select/button-over.png",
		width = 154, height = 40,
		onRelease = onModeRelesae	-- event listener function
	}
	modeBtn.x = display.contentWidth*0.3
	modeBtn.y = display.contentHeight*0.55
	modeGroup:insert( modeBtn )

	listening = display.newImage("select/listening.png")
	listening.xScale, listening.yScale = .6, .6
	listening.x, listening.y = display.contentWidth*0.3, display.contentHeight*0.37
	modeGroup:insert( listening )

	transition.to(modeGroup, {delay = 300, time = 500, alpha = 1})
	return true	-- indicates successful touch
end

local function onRankRelease( event )
	transition.to(soundGroup, {time = 500, alpha = 0})
	transition.to(soundGroup, {time = 500, delay = 500, alpha = 1})
	composer.gotoScene( "rank_select", "fade", 500 )
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "select/background.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0

	-- display "select level" logo
	local titleLogo = display.newImageRect( "select/title.png", 264, 70 )
	titleLogo.xScale = 0.7
	titleLogo.yScale = 0.7
	titleLogo.x = display.contentWidth * 0.5
	titleLogo.y = 30
	
	-- create a widget button (which will loads level1.lua on release)
	for i = 1, classNum do
		classBtn = widget.newButton{
			label = class[i],
			labelColor = { default={255}, over={128} },
			defaultFile = "select/button.png",
			overFile = "select/button-over.png",
			width = 154, height = 40,
			onRelease = onBtnRelease	-- event listener function
		}
		classBtn.x = display.contentWidth*0.5
		classBtn.y = display.contentHeight*(0.12 + i * 0.11)
		btnGroup:insert( classBtn )
	end

	rankBtn = widget.newButton{
		defaultFile = "select/rank.png",
		width = 50, height = 30.3,
		onRelease = onRankRelease	-- event listener function
	}
	rankBtn.x = display.contentWidth*0.85
	rankBtn.y = display.contentHeight*0.9
	btnGroup:insert( rankBtn )

	username = ""
	userscore = 0
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( btnGroup )
	sceneGroup:insert( modeGroup )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	selectMusicChannel = audio.play( selectMusic, { loops = -1 } )	
	audio.setVolume( 0, { channel = selectMusicChannel } )
	currentChannel = selectMusicChannel
	if (stopFlag == false) then
		audio.fade( { channel = selectMusicChannel, time = 800, volume = 0.5 } )
	end

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