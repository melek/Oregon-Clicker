@tool

extends Node2D

@onready var large = preload("res://assets/wip/6x scaling/buttons/priceButtonLarge.png")
@onready var small = preload("res://assets/wip/6x scaling/buttons/priceButtonSmall.png")

@onready var sprite = $buttonSprite
@onready var value = $value

@export var price = "1"

func _process(delta):
	
	value.text = "$" + price
	
	if value.text.length() > 2:
		sprite.texture = large
		sprite.offset.x = 0
	else:
		sprite.texture = small
		sprite.offset.x = 14

