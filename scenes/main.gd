extends Node2D

const length = 2170

@onready var progressBar = $Map/progressBar
@onready var progressPercent = $Map/progressPercent
@onready var mainAmount = $MainStats/amount

var remaining = 2169.991

func _physics_process(delta):	
	mainAmount.text = "%8.2-f" % (remaining)
	updateMapLabel()
	
# Get current journey progress as percent and update
func updateMapLabel():
	var progress = 100 - ( ( remaining / Constants.game.journeyLength) * 100 )
	progressPercent.text = "Progress " + "%.2-f" % progress + "%"

func onLengthUpdate(newRemaining):
	remaining = newRemaining
