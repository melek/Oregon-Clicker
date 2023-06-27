extends Node2D

func _physics_process(delta):	
	if Input.is_action_pressed("DEBUG_100"):
		State.game.remaining -= 100
	if Input.is_action_pressed("DEBUG_CASH_100"):
		State.game.cash += 1000
	if Input.is_action_pressed("DEBUG_CASH_1000"):
		State.game.cash += 10000
