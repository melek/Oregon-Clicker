extends Node2D

func _physics_process(delta):
	var progress = ( State.game.progress / Constants.game.stepLength) * 100 
	$progressPercent.text = "Progress " + "%.2-f" % progress + "%"
	$progressBar.value = progress
