extends Container

# Event manager code goes here o7

func _ready():
		# DEBUG: Sample log entries
	for i in range(10):
		await get_tree().create_timer(0.5).timeout
		$EventLog.add_event("Test %d!" % i)
