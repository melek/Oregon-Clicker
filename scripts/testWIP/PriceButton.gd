@tool

extends Node2D

@onready var size1 = preload("res://assets/wip/6x scaling/buttons/priceButtons/priceButton1.png")
@onready var size2 = preload("res://assets/wip/6x scaling/buttons/priceButtons/priceButton2.png")
@onready var size3 = preload("res://assets/wip/6x scaling/buttons/priceButtons/priceButton3.png")
@onready var size4 = preload("res://assets/wip/6x scaling/buttons/priceButtons/priceButton4.png")
@onready var size5 = preload("res://assets/wip/6x scaling/buttons/priceButtons/priceButton5.png")

@onready var sprite = $buttonSprite
@onready var clickArea = $clickArea/CollisionShape2D
@onready var value = $value
@export var price = 1

func _ready():
	setLabel()

func _process(delta):
	value.text = "$" + "%.0-f"%(price)
	
	
	setLabel()
	
	if not Engine.is_editor_hint():
		if price > State.game.cash:
			$value.set("theme_override_colors/font_color", Color(255, 0, 0))
		else:
			$value.set("theme_override_colors/font_color", Color(0, 0, 0))


func checkBuy():
	if Input.is_action_just_pressed("click"):
		
		
		var item = get_parent().get_name()
		if item in State.game.store:
			var cash = State.game.cash
			var crewVal = State.game.units.crew.amount
			var oxenVal = State.game.units.oxen.amount
			var crewCap = State.game.units.wagon.amount * 8
			var oxenCap = State.game.units.wagon.amount * 4
			
			if price <= cash:
				if item == "crew":
					if crewVal < crewCap:
						buy("crew")
				elif item == "oxen":
					if oxenVal < oxenCap:
						buy("oxen")
				else:
					buy(item)
	


func onBuyClick(viewport, event, shape_idx):
	checkBuy()
	

func buy(item):
	$AnimationPlayer.play("clicked")
	State.game.cash -= price
	State.game.units[item].amount += 1

func setLabel():
	sprite.texture = size1
	sprite.offset.x = 14
	clickArea.shape.size.x = 40
	clickArea.position.x = 34
	
	if value.text.length() > 2:
		sprite.texture = size2
		sprite.offset.x = 0
		clickArea.shape.size.x = 54
		clickArea.position.x = 27
		
	if value.text.length() > 3:
		sprite.texture = size3
		sprite.offset.x = -14
		clickArea.shape.size.x = 68
		clickArea.position.x = 20
		
	if value.text.length() > 4:
		sprite.texture = size4
		sprite.offset.x = -28
		clickArea.shape.size.x = 82
		clickArea.position.x = 13
	
	if value.text.length() > 5:
		sprite.texture = size5
		sprite.offset.x = -42
		clickArea.shape.size.x = 96
		clickArea.position.x = 6
