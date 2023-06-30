extends Node2D

func _physics_process(delta):
	$IdleEngine.update(delta)
	$IdleEngine.print_generators()
	$IdleEngine.print_currencies()
