extends Node2D

func _physics_process(delta):
	var progress = 100 - ( ( State.game.remaining / Constants.game.journeyLength) * 100 )
	$progressPercent.text = "Progress " + "%.2-f" % progress + "%"
	$progressBar.value = progress
