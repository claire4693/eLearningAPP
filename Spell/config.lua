application = {
	content = {
		width = 320,
		height = 480, 
		scale = "letterBox",
		fps = 60,
		
		
        imageSuffix = {
		    ["-small"] = 0.375,
			["@2x"] = 1.5
		}
		
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}