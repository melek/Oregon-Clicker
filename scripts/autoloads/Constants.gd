extends Node2D

const game = {
	"gameName": "Oregon Clicker",
	"journeyLength": 2170,
	"stride": 0.000568182,
	"stepLength": 4000000,
	"statUnits": { 
		"mainStat" : ["Steps to Oregon", "Oregons Discovered"]
	},
	
	
	# I might want to make this a dict later if the prices are custom
	"upgrades": {
		"speed" : {
			"names" : [ #These might be too incremental
				"Reinforced Harness",
				"High-Speed Bearings",
				"Wagon Streamlining",
				"Carbon Fiber Wagon", 
				"Wagon Thrust Vectoring"
			],
			"altNames" : [ #If we want something more dramatic. Maybe sprite changes? Mutation?
				"Cars",
				"Rockets",
				"Dragons"
			],
			"multiplier" : 25
		},
		"cash" : {
			"names" : [
				"Skilled Foraging", 
				"Better Barganing", 
				"Resourceful Trading",
				"Investment Strategies", 
				"Wagon Team Sponorships"
			],
			"multiplier" : 25
		},
	}
}
