@icon("icons/IdleGeneratorFactorPair_icon.png")
class_name IdleGeneratorFactorPair
extends IdleResource
## A pair of a generator and a float representing a multiplier factor.

@export var generator: IdleGenerator
@export var factor: float

func _init(	new_generator	:=	IdleGenerator.new(),
			new_factor		:=	2.0):
	generator = new_generator
	factor = new_factor

func get_generator() -> IdleGenerator:
	return generator
	
func get_factor() -> float:
	return factor
	
func dict() -> Dictionary:
	return {
		"generator": generator.get_label(),
		"factor": factor
	}
