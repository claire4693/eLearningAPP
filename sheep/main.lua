-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

--menuMusic = audio.loadStream("welcome/Mary_Had_A_Little_Lamb_(vocal).mp3")

-- load menu screen
composer.gotoScene( "menu" )

selectMusic = audio.loadStream( "select/Claudio_The_Worm.mp3"  )
gameMusic = {
	["School"] = audio.loadStream( "sounds/music/Bubble_Bath.mp3"  ),
	["Location"] = audio.loadStream( "sounds/music/Bike_Rides.mp3"  ),
	["Transportation"] = audio.loadStream( "sounds/music/Dancing_on_Green_Grass.mp3"  ),
	["Characteristics"] = audio.loadStream( "sounds/music/Itsy_Bitsy_Spider_(instrumental).mp3"  )
}

class = {
	[1] = "School",
	[2] = "Location",
	[3] = "Transportation",
	[4] = "Characteristics",
}

classNum = 4

vocNumTable = {
	["School"] = 82,
	["Location"] = 38,
	["Transportation"] = 30,
	["Characteristics"] = 50
}

question = {
	School = { 
		[00] = "國小",
		[01] = "國中",
		[02] = "高中",
		[03] = "教室",
		[04] = "操場",
		[05] = "圖書館",
		[06] = "班級",
		[07] = "黑板",
		[08] = "書",
		[09] = "粉筆",
		[10] = "字典",
		[11] = "信",
		[12] = "地圖",
		[13] = "筆記本",
		[14] = "橡皮擦",
		[15] = "頁",
		[16] = "紙",
		[17] = "筆",
		[18] = "鉛筆",
		[19] = "圖片",
		[20] = "明信片",
		[21] = "禮物",
		[22] = "尺",
		[23] = "作業本",
		[24] = "美術",
		[25] = "中文",
		[26] = "英文",
		[27] = "歷史",
		[28] = "語言",
		[29] = "數學",
		[30] = "音樂",
		[31] = "體育",
		[32] = "同學",
		[33] = "朋友",
		[34] = "老師",
		[35] = "學生",
		[36] = "答案",
		[37] = "問",
		[38] = "學習",
		[39] = "聽",
		[40] = "做記號",
		[41] = "及格",
		[42] = "練習",
		[43] = "準備",
		[44] = "讀",
		[45] = "重複",
		[46] = "說",
		[47] = "說",
		[48] = "拼字",
		[49] = "研讀",
		[50] = "說話",
		[51] = "教學",
		[52] = "了解",
		[53] = "寫",
		[54] = "畫",
		[55] = "例子",
		[56] = "運動",
		[57] = "成績",
		[58] = "家庭作業",
		[59] = "問題",
		[60] = "問題",
		[61] = "故事",
		[62] = "考試",
		[63] = "課",
		[64] = "領導者",
		[65] = "小說",
		[66] = "物理學",
		[67] = "照片",
		[68] = "鋼琴",
		[69] = "教授",
		[70] = "節目",
		[71] = "競賽",
		[72] = "報告",
		[73] = "規則",
		[74] = "學校",
		[75] = "文具",
		[76] = "座位",
		[77] = "句子",
		[78] = "運動",
		[79] = "學科",
		[80] = "游泳",
		[81] = "制服",
	},
	
	Location = {
		[00] = "這裡",
		[01] = "那裡",
		[02] = "回來",
		[03] = "前面",
		[04] = "向左、左邊",
		[05] = "右邊",
		[06] = "東方",
		[07] = "西方",
		[08] = "南方",
		[09] = "北方",
		[10] = "頂端",
		[11] = "麵包店",
		[12] = "銀行",
		[13] = "沙灘",
		[14] = "書店",
		[15] = "教堂",
		[16] = "百貨公司",
		[17] = "工廠",
		[18] = "醫院",
		[19] = "旅館",
		[20] = "市場",
		[21] = "博物館",
		[22] = "辦公室",
		[23] = "公園",
		[24] = "郵局",
		[25] = "洗手間",
		[26] = "餐廳",
		[27] = "商店",
		[28] = "商店",
		[29] = "超級市場",
		[30] = "戲院",
		[31] = "動物園",
		[32] = "城市",
		[33] = "國家",
		[34] = "農場",
		[35] = "地方",
		[36] = "城鎮",
		[37] = "旁邊",
	},

	Transportation = {
		[00] = "飛機",
		[01] = "腳踏車",
		[02] = "船",
		[03] = "公車",
		[04] = "車子",
		[05] = "機車",
		[06] = "滑板車",
		[07] = "船",
		[08] = "計程車",
		[09] = "貨車 ",
		[10] = "飛機場",
		[11] = "車站",
		[12] = "火車 ",
		[13] = "瓦斯",
		[14] = "街區",
		[15] = "橋樑",
		[16] = "鐵路",
		[17] = "人行道",
		[18] = "交通 ",
		[19] = "到達",
		[20] = "經過",
		[21] = "開車",
		[22] = "飛",
		[23] = "土地",
		[24] = "湖",
		[25] = "騎",
		[26] = "轉向",
		[27] = "快速的",
		[28] = "快速的",
		[29] = "緩慢的",
	},

	Characteristics = {
		[00] = "生氣的",
		[01] = "壞的",
		[02] = "美麗的",
		[03] = "瞎的",
		[04] = "感到無聊的",
		[05] = "無聊的",
		[06] = "忙碌的",
		[07] = "小心的",
		[08] = "涼爽的",
		[09] = "瘋狂的",
		[10] = "可愛的",
		[11] = "活力充沛",
		[12] = "感到興奮的",
		[13] = "令人興奮的",
		[14] = "有名的",
		[15] = "時髦的",
		[16] = "胖的",
		[17] = "友善的",
		[18] = "好笑的",
		[19] = "好的",
		[20] = "英俊的",
		[21] = "快樂的",
		[22] = "勤勉的",
		[23] = "重的",
		[24] = "誠實的",
		[25] = "感興趣的",
		[26] = "和善的",
		[27] = "懶惰的",
		[28] = "寂寞的",
		[29] = "好的",
		[30] = "老的",
		[31] = "有禮貌的",
		[32] = "可憐的",
		[33] = "受歡迎的",
		[34] = "漂亮的",
		[35] = "驕傲的",
		[36] = "安靜的",
		[37] = "有錢的",
		[38] = "悲傷的",
		[39] = "矮的",
		[40] = "害羞的",
		[41] = "熟練的",
		[42] = "聰明的",
		[43] = "笨的",
		[44] = "成功的",
		[45] = "高的",
		[46] = "瘦的",
		[47] = "不快樂的",
		[48] = "明智的",
		[49] = "年輕的",
	},
}

answer = {
	School = { 
		[00] = "Elementary school",
		[01] = "Junior high school",
		[02] = "Senior high school",
		[03] = "classroom",
		[04] = "playground",
		[05] = "library",
		[06] = "class",
		[07] = "blackboard",
		[08] = "book",
		[09] = "chalk",
		[10] = "dictionary",
		[11] = "letter",
		[12] = "map",
		[13] = "notebook",
		[14] = "eraser",
		[15] = "page",
		[16] = "paper",
		[17] = "pen",
		[18] = "pencil",
		[19] = "picture",
		[20] = "postcard",
		[21] = "present",
		[22] = "ruler",
		[23] = "workbook",
		[24] = "art",
		[25] = "Chinese",
		[26] = "English",
		[27] = "History",
		[28] = "language",
		[29] = "Math",
		[30] = "music",
		[31] = "PE",
		[32] = "classmate",
		[33] = "friend",
		[34] = "teacher",
		[35] = "student",
		[36] = "answer",
		[37] = "ask",
		[38] = "learn",
		[39] = "listen",
		[40] = "mark",
		[41] = "pass",
		[42] = "practice",
		[43] = "prepare",
		[44] = "read",
		[45] = "repeat",
		[46] = "say",
		[47] = "speak",
		[48] = "spell",
		[49] = "study",
		[50] = "talk",
		[51] = "teach",
		[52] = "understand",
		[53] = "write",
		[54] = "draw",
		[55] = "example",
		[56] = "exercise",
		[57] = "grade",
		[58] = "homework",
		[59] = "problem",
		[60] = "question",
		[61] = "story",
		[62] = "test",
		[63] = "lesson",
		[64] = "leader",
		[65] = "novel",
		[66] = "Physics",
		[67] = "photo",
		[68] = "piano",
		[69] = "professor",
		[70] = "program",
		[71] = "race",
		[72] = "report",
		[73] = "rule",
		[74] = "school",
		[75] = "stationery",
		[76] = "seat",
		[77] = "sentence",
		[78] = "sport",
		[79] = "subject",
		[80] = "swim",
		[81] = "uniform",
	},
	
	Location = {
		[00] = "here",
		[01] = "there",
		[02] = "back",
		[03] = "front",
		[04] = "left",
		[05] = "right",
		[06] = "east",
		[07] = "west",
		[08] = "south",
		[09] = "north",
		[10] = "top",
		[11] = "bakery",
		[12] = "bank",
		[13] = "beach",
		[14] = "bookstore",
		[15] = "church",
		[16] = "department store",
		[17] = "factory",
		[18] = "hospital",
		[19] = "hotel",
		[20] = "market",
		[21] = "museum",
		[22] = "office",
		[23] = "park",
		[24] = "post office",
		[25] = "restroom",
		[26] = "restaurant",
		[27] = "shop",
		[28] = "store",
		[29] = "supermarket",
		[30] = "theater",
		[31] = "zoo",
		[32] = "city",
		[33] = "country",
		[34] = "farm",
		[35] = "place",
		[36] = "town",
		[37] = "side",
	},

	Transportation = {
		[00] = "airplane",
		[01] = "bicycle",
		[02] = "boat",
		[03] = "bus",
		[04] = "car",
		[05] = "motorcycle",
		[06] = "scooter",
		[07] = "ship",
		[08] = "taxi",
		[09] = "truck",
		[10] = "airport",
		[11] = "station",
		[12] = "train",
		[13] = "gas",
		[14] = "block",
		[15] = "bridge",
		[16] = "railway",
		[17] = "sidewalk",
		[18] = "traffic",
		[19] = "arrive",
		[20] = "cross",
		[21] = "drive",
		[22] = "fly",
		[23] = "land",
		[24] = "lake",
		[25] = "ride",
		[26] = "turn",
		[27] = "fast",
		[28] = "quick",
		[29] = "Slow",
	},

	Characteristics = {
		[00] = "angry",
		[01] = "bad",
		[02] = "beautiful",
		[03] = "blind",
		[04] = "bored",
		[05] = "boring",
		[06] = "busy",
		[07] = "careful",
		[08] = "cool",
		[09] = "crazy",
		[10] = "cute",
		[11] = "energetic",
		[12] = "excited",
		[13] = "exciting",
		[14] = "famous",
		[15] = "fashionable",
		[16] = "fat",
		[17] = "friendly",
		[18] = "funny",
		[19] = "good",
		[20] = "handsome",
		[21] = "happy",
		[22] = "hard-working",
		[23] = "heavy",
		[24] = "honest",
		[25] = "interested",
		[26] = "kind",
		[27] = "lazy",
		[28] = "lonely",
		[29] = "nice",
		[30] = "old",
		[31] = "polite",
		[32] = "poor",
		[33] = "popular",
		[34] = "pretty",
		[35] = "proud",
		[36] = "quiet",
		[37] = "rich",
		[38] = "sad",
		[39] = "short",
		[40] = "shy",
		[41] = "skillful",
		[42] = "smart",
		[43] = "stupid",
		[44] = "successful",
		[45] = "tall",
		[46] = "thin",
		[47] = "unhappy",
		[48] = "wise",
		[49] = "young",
	},
}