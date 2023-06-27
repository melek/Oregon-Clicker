extends Node2D

signal updateLength(amount)

@onready var stride = Constants.game.stride


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
var lastProgress = 0

@onready var moveStats = State.game.moveStats

func _physics_process(delta):
	checkSpeed()
	checkClickSpeed()
	checkIncome()
	
	setAnimSpeed()
	updateLabel()
	calculateLength()
	#addJitter()

func addJitter():
	var animPlay = true
	if State.game.moveStats.baseSpeed > 80 and animPlay:
		$Environment/Party/AnimationPlayer.play("jitter")
		$Environment/Party/AnimationPlayer.speed_scale = 400
		animPlay = false
		

		


func checkSpeed():
	var oxenAmount = State.game.units.oxen.amount
	var oxenMultiplier = State.game.units.oxen.statMulti
	moveStats.baseSpeed = oxenAmount * oxenMultiplier

func checkIncome():
	var crewAmount = State.game.units.crew.amount
	var crewMultiplier = State.game.units.crew.statMulti
	
	if State.game.progress - lastProgress > (stride * 5):
		State.game.cash += crewAmount * crewMultiplier
		lastProgress = State.game.progress + (stride * 5)


func updateLabel():
	label.text = "Speed " + str(moveStats.baseSpeed)

func onButtonInput(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		clickTime = 5

func checkClickSpeed():
	if clickTime > 0: 
		moveStats.actualSpeed = moveStats.baseSpeed + clickSpeed
		clickTime -= 1
	else:
		moveStats.actualSpeed = moveStats.baseSpeed
		
func setAnimSpeed():
	for anim in anims:
		anim.speed_scale = moveStats.actualSpeed / 5
		
func calculateLength():
	State.game.remaining -= (moveStats.actualSpeed / 5) * stride
	State.game.progress += (moveStats.actualSpeed / 5) * stride
#	emit_signal("updateLength", State.game.remaining)



