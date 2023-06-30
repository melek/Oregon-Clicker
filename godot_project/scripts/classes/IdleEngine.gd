@icon("res://assets/resources/IdleState_icon.png")
class_name IdleEngine
extends Node2D
## Node for handling Idle game mechanics.

@export var Idle: IdleState

func update(delta):
	for g in Idle.generators:		
		var old_value = Idle.currencies[g.currency].get_value()
		Idle.currencies[g.currency].set_value(old_value + (g.quantity * g.rate * delta))

func print_currencies():
	for c in Idle.currencies:
		print("%s: %10.3f" % [c.get_label(), c.get_value()])
		
func print_generators():
	for g in Idle.generators:
		var c = Idle.currencies[g.currency]
		print("%s (%s): %10.3f x %d" % [g.get_label(), c.get_label(), g.get_rate(), g.get_quantity()])
