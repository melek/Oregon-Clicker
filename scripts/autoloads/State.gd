extends Node2D

var game

func _ready():
	self.new_game()

func new_game():
	game = {
		"progress": 5
	}
