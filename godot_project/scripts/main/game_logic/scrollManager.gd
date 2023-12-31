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
var clickSpeed = 1

#var length = 2170
#var remaining = 2170
var clickTimer = 0
var actualSpeed = 0
var lastProgress = 0
var oxenTimer = 0
var clickBonus = 0
var oxenSpeed = 0
@onready var moveStats = State.game.moveStats

func _physics_process(delta):
	calcBaseSpeed()
	setAnimSpeed()
	calcActualSpeed()
	calcIncome()
	
	
	
	#updateLabel()
	#addJitter()

func addJitter():
	var animPlay = true
	if State.game.moveStats.baseSpeed > 80 and animPlay:
		$Environment/Party/AnimationPlayer.play("jitter")
		$Environment/Party/AnimationPlayer.speed_scale = 400
		animPlay = false
		
func calcBaseSpeed():
	var oxenAmount = State.game.units.oxen.amount
	var oxenMultiplier = State.game.units.oxen.statMulti
	
	var speedMultiplier = State.game.units.speedUp.statMulti
	var speedUpAmount = State.game.units.speedUp.amount
	var combinedSpeedMulti = speedMultiplier * speedUpAmount
	
	# Check oxen timer rate
	# CURRENT: .5 sec
	
	if combinedSpeedMulti > 0:
		oxenSpeed = ((oxenAmount * float(oxenMultiplier))/30) * combinedSpeedMulti
		moveStats.baseSpeed = (oxenAmount * oxenMultiplier) * combinedSpeedMulti
	else:
		oxenSpeed = ((oxenAmount * float(oxenMultiplier))/30)
		moveStats.baseSpeed = (oxenAmount * oxenMultiplier)
#	if oxenTimer > 30:
#
#		oxenTimer = 0
#	else:
#		moveStats.baseSpeed = 0
#		oxenTimer += 1
	
func bonusAnimTimer():
	pass

func calcActualSpeed():
	
	
	moveStats.actualSpeed = oxenSpeed + checkClickBonus()
	State.game.progress += moveStats.actualSpeed
	
	if State.game.progress > Constants.game.stepLength:
		var newProgress = State.game.progress - Constants.game.stepLength
		
		State.game.progress = newProgress
		State.game.Remaining = Constants.game.stepLength - newProgress
		State.game.oregons += 1
		lastProgress = State.game.progress + 5
	else:
		State.game.remaining -= moveStats.actualSpeed
	
	
func calcIncome():
	var crewAmount = State.game.units.crew.amount
	var crewMultiplier = State.game.units.crew.statMulti
	
	if State.game.progress - lastProgress > 5:
		State.game.cash += crewAmount * crewMultiplier
		lastProgress = State.game.progress + 5
	

func updateLabel():
	label.text = "Speed " + str(moveStats.actualSpeed)

func onButtonInput(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		var multiplier = State.game.units.clickUp.amount * State.game.units.clickUp.statMulti
		clickBonus = 1 + multiplier
		$MoveButton/moveButton/AnimationPlayer.play("clicked")

func checkClickBonus():
	if clickBonus > 0:
		clickBonus = 0
		return 1
	else:
		return 0

func setAnimSpeed():
	for anim in anims:
		anim.speed_scale = .75 * (State.game.units.oxen.amount + clickBonus)
	

