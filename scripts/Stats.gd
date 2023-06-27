extends Node2D

var time_start = 0
var time_now = 0
var time_passed = 0

func _ready():
	time_start = Time.get_time_dict_from_system().second

func _physics_process(delta):
	
#	Average speed for current time, might implement later
#	getAvgSpeed()
	
	time_now = Time.get_time_dict_from_system().second
	time_passed = time_now - time_start
	
	$Speed/value.text = str(State.game.moveStats.baseSpeed) + " mph"
	
	checkMiles()
	
	checkOregons()
	

func checkMiles():
	if State.game.oregons < 1:
		State.game.totalMiles = State.game.progress * 0.000568182
	else:
		State.game.totalMiles = (State.game.progress * 0.000568182) * State.game.oregons
	
	$Miles/value.text = "%.1-f" % (State.game.totalMiles)

func checkOregons():
	$Oregons/value.text = str(State.game.oregons)
	
	if State.game.oregons > 0:
		$Oregons.visible = true

#func getAvgSpeed():

#
#	time_passed = time_now - time_start
#	if time_passed > 3:
#		time_start = time_now
