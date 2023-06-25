extends Label

const length = 2170

func _physics_process(delta):
	# Test code just to test the main progress tracker
	var progress = get_parent().get_parent().get_node("Map/progressBar").value
	text = "%8.1-f" % (length-(progress / 100 * length))
	
	# Test code just to test the percentage thing
	get_parent().get_parent().get_node("Map/progressPercent").text = "Progress " + str((float(text) / length)*100) + ".0%"
