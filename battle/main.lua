display.setStatusBar (display.HiddenStatusBar)
--> Hides the status bar

local mainGroup = display.newGroup()
--> Creates a main group

name = "None"
math.randomseed( os.time() )
local composer = require "composer"
composer.gotoScene( "start" )


words = {
"answer",
"art",
"ask",
"blackboard",
"book",
"chalk",
"Chinese",
"class",
"classmate",
"classroom",
"dictionary",
"draw",
"Elementary school",
"English",
"eraser",
"example",
"exercise",
"friend",
"grade",
"History",
"homework",
"Junior high school",
"language",
"leader",
"learn",
"lesson",
"letter",
"library",
"listen",
"map",
"mark",
"Math",
"music",
"notebook",
"novel",
"page",
"paper",
"pass",
"PE",
"pen",
"pencil",
"photo",
"Physics",
"piano",
"picture",
"playground",
"postcard",
"practice",
"prepare",
"present",
"problem",
"professor",
"program",
"question",
"race",
"read",
"repeat",
"report",
"rule",
"ruler",
"say",
"school",
"seat",
"Senior high school",
"sentence",
"speak",
"spell",
"sport",
"stationery",
"story",
"student",
"study",
"subject",
"swim",
"talk",
"teach",
"teacher",
"test",
"understand",
"uniform",
"workbook",
"write"
}

--> Starts our app