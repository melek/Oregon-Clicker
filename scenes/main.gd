extends Node2D

const length = 2170

@onready var progressBar = $Map/progressBar
@onready var progressPercent = $Map/progressPercent
@onready var mainAmount = $MainStats/amount


var remaining = 2169.991

func _physics_process(delta):
	
	mainAmount.text = "%8.2-f" % (remaining)
	
	progressPercent.text = "Progress " + "%.2-f" % (100-((remaining/length)*100)) + "%"


func onLengthUpdate(newRemaining):
	remaining = newRemaining
	print(remaining)
