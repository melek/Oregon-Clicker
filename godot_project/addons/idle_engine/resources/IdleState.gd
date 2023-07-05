@icon("icons/IdleState_icon.png")
class_name IdleState
extends IdleResource
## Total State resource for use in IdleEngine.

## Currencies; any kind of unit or counter.
@export var currencies: Array[IdleCurrency]
@export var generators: Array[IdleGenerator]
@export var multipliers:  Array[IdleMultiplier]

func _init(	custom_c : Array[IdleCurrency]  = [], 
			custom_g : Array[IdleGenerator] = [],
			custom_m : Array[IdleMultiplier] = []):
	currencies  = custom_c
	generators  = custom_g
	multipliers = custom_m

func load_from_json(json_string):
	var json = JSON.new()
	var error = json.parse(json_string)
	
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_DICTIONARY:
			print("JSON Received:")
			print(data_received)
		else:
			print("Non-Dictionary JSON data:")
			print(data_received)
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())

func dict() -> Dictionary:
	var all_currencies  := []
	var all_generators  := []
	var all_multipliers := []
	
	for c in currencies:
		all_currencies.append(c.dict())
	for g in generators:
		all_generators.append(g.dict())	
	for m in multipliers:
		all_multipliers.append(m.dict())
	
	return {
			"currencies" : all_currencies,
			"generators" : all_generators,
			"multipliers"  : all_multipliers
		}
	
