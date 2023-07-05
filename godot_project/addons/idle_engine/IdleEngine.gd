@icon("icon.png")
class_name IdleEngine
extends Node2D
## Node for handling Idle game mechanics.

@export var state: IdleState

func update(delta):
	for c in get_currencies():
		c.add_amount(get_production(c) * delta)

func get_production(c: IdleCurrency):
	var production := 0.0
	for g in get_generators():
		for cr in g.currency_rates:
			if(cr.get_currency() == c):
				var g_prod = cr.get_rate() * g.get_quantity()
				var m_prod = get_total_multiplier(g)
				production += g_prod * m_prod
	return production

func get_total_multiplier(g: IdleGenerator) -> float:
	var m_arr: Array[IdleMultiplier]
		
	var total_factor := 0.0
	for m in state.multipliers:
		for gf in m.get_generator_factors():
			if  gf.get_generator() == g:
				total_factor += gf.get_factor() * m.get_quantity()
				if m.get_quantity() != 0 and !m_arr.has(m): m_arr.append(m)
	
	if m_arr.is_empty(): return 1.0
	return total_factor

# Getters
func get_currencies():
	return state.currencies
	
func get_generators():
	return state.generators
	
func get_multipliers():
	return state.multipliers

# Output functions
func print_currencies():
	for c in state.currencies:
		print(c.dict())

func print_generators():
	for g in state.generators:
		print(g.dict())

func print_multipliers():
	for m in state.multipliers:
		print(m.dict())
