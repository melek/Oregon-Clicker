@icon("res://assets/resources/IdleState_icon.png")
class_name IdleState
extends Resource
## Total State resource for use in IdleEngine.

@export var currencies: Array[IdleCurrency]
@export var generators: Array[IdleGenerator]

func _init(	custom_c : Array[IdleCurrency]  = [IdleCurrency.new()], 
			custom_g : Array[IdleGenerator] = [IdleGenerator.new()]):
	currencies = custom_c
	generators = custom_g
