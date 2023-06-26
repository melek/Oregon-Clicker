extends Node2D

const game = {
	"gameName": "Oregon Clicker",
	"journeyLength": 2170,
	"stride": 0.000568182,
	"statUnits": { 
		"mainStat" : ["Miles to Oregon", "Oregons Discovered"]
	},
	"upgrades": {
		"speed" : {
			"names" : [
				"Reinforced Harness",
				"High-Speed Bearings",
				"Wagon Streamlining",
				"Carbon Fiber Wagon", 
				"Wagon Thrust Vectoring"
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
