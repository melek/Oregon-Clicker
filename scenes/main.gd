extends Node2D

func _physics_process(delta):	
	if Input.is_action_just_pressed("DEBUG_100"):
		State.game.remaining -= 100
