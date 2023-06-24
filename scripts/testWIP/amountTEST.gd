extends Label

const length = 2170

func _physics_process(delta):
	var progress = get_parent().get_parent().get_node("Map/progressBar").value
	text = "%8.1-f" % (length-(progress / 100 * length))

