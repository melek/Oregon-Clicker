extends Node2D

var save

var game = {
		"progress" : 0,
		"remaining" : 4000000,
		"remainingOld" : 2170,
		"cash" : 0,
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
		}
	}

func _ready():
	self.new_game()

func new_game():
	save = game
