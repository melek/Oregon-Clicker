extends Node2D

var save

var game = {
		"progress" : 0,
		"remaining" : 4000000,
#		"remainingOld" : 2170,
		"cash" : 0,
		"totalMiles" : 0,
		"oregons" : 0,
		"moveStats" : {
			"actualSpeed": 0,
			"clickSpeed" : 5,
			"travelTime" : 0,
			"baseSpeed" : 0
		},
		"store" : {
			"wagon" : {
				"basePrice" : 20,
				"costMultiplier" : 1.07},
			"crew" : {
				"basePrice" : 5,
				"costMultiplier" : 1.05},
			"oxen" : {
				"basePrice" : 7,
				"costMultiplier" : 1.01},
			"hunter" : {
				"basePrice" : 10,
				"costMultiplier" : 1.07},
			"compass" : {
				"basePrice" : 30,
				"costMultiplier" : 1.17},
			"speedUp" : {
				"basePrice" : 9000,
				"costMultiplier" : 1.9,
				"threshold" : 20000
			},
			"clickUp" : {
				"basePrice" : 500,
				"costMultiplier" : 1.9,
				"threshold" : 1000
			}
		},
		"units" : {
			"wagon" : {
				"amount" : 1,
				"statMulti" : 1,
				"consumeMulti" : .05 # Part consumption
			},
			"crew" : {
				"amount" : 1,
				"statMulti" : .50,
				"consumeMulti" : .1  # Food consumption
			},
			"oxen" : {
				"amount" : 1,
				"statMulti" : 3,
				"consumeMulti" : .1 # Food consumption
			},
			"hunter" : {
				"amount" : 1,
				"statMulti" : .2,
				"consumeMulti" : 1 # Ammo consumption
			},
			"compass" : {
				"amount" : 1,
				"statMulti" : .10
			},
			"speedUp" : {
				"amount" : 0,
				"statMulti" : 25
			},
			"clickUp" : {
				"amount" : 0,
				"statMulti" : 100
			}
		},
		"resources" : {
			"food" : {
				"amount" : 5,
				"price" : 1
			},
			"ammo" : {
				"amount" : 10,
				"price" : 3
			},
			"parts" : {
				"amount" : 5,
				"price" : 5
			},
			"rafts" : {
				"amount" : 2,
				"price" : 8
			}
		},
		"oregonEvents": [
			{
				"value": 1,
				"log" : "You have made it to Oregon!",
				"effects" : null,
				"active" : true
			},
			{
				"value": 2,
				"log" : "The Oregon colonies are confused to see you back so soon.",
				"effects" : null,
				"active" : true
			},
			{
				"value": 1000 ,
				"log" : "The Oregons merge together and create Super Oregon.",
				"effects" : null,
				"active" : true
			}
		],
		"progressEvents": [
			{
				"value": 1,
				"log" : "You have traveled 1 mile!",
				"effects" : null,
				"active" : true
			},
			{
				"value": 1000 ,
				"log" : "You have traveled 1000 miles!",
				"effects" : null,
				"active" : true
			}
		],
		"speedEvents": [
			{
				"value": 794,
				"log" : "You have reached supersonic speeds.",
				"effects" : null,
				"active" : true
			},
			{
				"value": 3308,
				"log" : "You have reached hypersonic speeds.",
				"effects" : null,
				"active" : true
			},
			{
				"value": 6615,
				"log" : "You are approaching high hypersonic speeds.",
				"effects" : null,
				"active" : true
			},
			{
				"value": 8000,
				"log" : "You are approaching ludicrous speeds!",
				"effects" : null,
				"active" : true
			},
		],
		"randomEvents" : {
			"random" : {
				324 : {
					"minRange" : 100,
					"maxRange" : 400,
					"log" : "You were robbed by bandits.",
					"effect" : ["cash", -10]
				}
			},
			"oregons" : {
				15840  : {
					"log" : "You made it to Oregon!",
					"effects" : null,
					"active" : true
			}
		}
	}
}

func _ready():
	self.new_game()

func new_game():
	save = game
