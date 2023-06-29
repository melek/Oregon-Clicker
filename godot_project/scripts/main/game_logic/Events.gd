extends Container

# Event manager code goes here o7

func _ready():
	pass
		# DEBUG: Sample log entries
#	for i in range(10):
#		await get_tree().create_timer(0.5).timeout
#		$EventLog.add_event("Test %d!" % i)

func newLog(event):
	$EventLog.add_event(event)

func _physics_process(delta):
	for event in State.game.progressEvents:
		if (event.value < State.game.totalMiles) and (event.active):
			event.active = false
			newLog(event.log)
			
	for event in State.game.speedEvents:
		if (event.value < State.game.moveStats.baseSpeed) and (event.active):
			event.active = false
			newLog(event.log)
			await get_tree().create_timer(1).timeout
	
	for event in State.game.oregonEvents:
		if (event.value < State.game.oregons) and (event.active):
			event.active = false
			newLog(event.log)
			await get_tree().create_timer(1).timeout

			
			
