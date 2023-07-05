@icon("icons/IdleCost_icon.png")
class_name IdleCost
extends IdleResource
## A currency-float pair representing a generic base cost and growth rate.

@export var currency: IdleCurrency
@export var base_cost: float
@export var exponent: float

func _init(	new_currency	=	IdleCurrency.new(),
			new_base_cost	=	1.0,
			new_exponent	=	2.0):
	currency = new_currency
	base_cost = new_base_cost
	exponent = new_exponent

func get_currency() -> IdleCurrency:
	return currency
	
func get_base_cost() -> float:
	return base_cost
	
func get_exponent() -> float:
	return exponent
	
# Value is a generic float for parameters such as generator rate.
func get_cost(num_owned: int, value: float, num_to_buy: int = 1) -> float:
	if num_to_buy > 1: 
		return base_cost * (exponent ** num_owned) * (exponent ** num_to_buy - 1) / (exponent - 1)
	return (base_cost * value) ** num_owned
	
func dict() -> Dictionary:
	return {
		"currency": currency.get_label(),
		"base_cost": base_cost,
		"exponent": exponent
	}
