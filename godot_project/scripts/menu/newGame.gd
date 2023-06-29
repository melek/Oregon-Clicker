extends Label

@export var main_scene: PackedScene

func mouseHover():
	text = "- " + text + " -"

func mouseAway():
	text = "New Game"

func onInput(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_packed(main_scene)
