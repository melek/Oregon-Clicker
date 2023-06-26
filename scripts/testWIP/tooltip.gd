extends Node2D

var areaName = ""

var tips = {
	"wagon" : "Increase crew capacity",
	"crew" : "Increase cash chance",
	"oxen" : "Move automatically",
	"hunter" : "Increase hunt chance",
	"compass" : "Increase luck chance",
	"foodRate" : "Lower food consumption",
	"food" : "Consumed by personnel",
	"ammo" : "Consumed by hunters",
	"parts" : "Consumed by wagons",
	"raft" : "Prevent wagon loss"
}

@onready var sprite = $TooltipBorder
@onready var detectPos = $tooltipDetect
@onready var text = $TooltipBorder/text
@onready var anim = $AnimationPlayer

func _process(delta):
	detectPos.global_position = get_global_mouse_position()
	
	if detectPos.global_position.x < 732 and detectPos.global_position.y < 786:
		sprite.global_position = get_global_mouse_position()
	
	else:
		if detectPos.global_position.x < 732:
			sprite.global_position.y = 786
			sprite.global_position.x = get_global_mouse_position().x
	
		elif detectPos.global_position.y < 786:
			sprite.global_position.x = 732
			sprite.global_position.y = get_global_mouse_position().y



func areaEntered(area):
	areaName = area.get_name()
	if areaName == "tooltipArea":
		#DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CONFINED_HIDDEN)
		#sprite.visible = true
		if tips.has(area.tipName):
			text.text = tips[area.tipName]
		anim.play("hover")
		

func areaExited(area):
	if areaName == area.get_name():
		#DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		#sprite.visible = false
		anim.play("gone")
		
		
		

