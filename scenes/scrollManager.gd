extends Node2D

signal updateLength(amount)

@onready var anims = [
	$Environment/Background/AnimationPlayer,
	$Environment/Foreground/AnimationPlayer, 
	$Environment/Party/wagon/AnimationPlayer, 
	$Environment/Party/oxen/AnimationPlayer
]

@onready var label = $speedLabel

var UPDATE_RATE = 60
var baseSpeed = 0
var clickSpeed = 5

var length = 2170
var remaining = 2170
var clickTime = 0
var actualSpeed = 0

func _physics_process(delta):
	checkClickSpeed()
	setAnimSpeed()
	updateLabel()
	calculateLength()


func updateLabel():
	label.text = "Speed " + str(baseSpeed)

func onButtonInput(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		clickTime = 5

func checkClickSpeed():
	if clickTime > 0: 
		actualSpeed = baseSpeed + clickSpeed
		clickTime -= 1
	else:
		actualSpeed = baseSpeed
		
func setAnimSpeed():
	for anim in anims:
		anim.speed_scale = actualSpeed / 5
		
func calculateLength():
	remaining -= (actualSpeed / 5) * 0.000568182
	emit_signal("updateLength", remaining)
