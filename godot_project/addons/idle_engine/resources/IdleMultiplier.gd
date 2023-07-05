@icon("icons/IdleMultiplier_icon.png")
class_name IdleMultiplier
extends IdleResource
## Multiplier resource for use in IdleEngine.

# Singular and Plural strings
@export var label_singular: String
@export var label_plural: String

# The function and value of the modifier
@export var generator_factors: Array[IdleGeneratorFactorPair]

# Costs for this multiplier
@export var costs: Array[IdleCost]

# Quantity and compound type
@export var quantity: int


func _init(	new_label_singular:	String					= "",
			new_label_plural:	String					= "",
			new_generator_factors: Array[IdleGeneratorFactorPair] = [],
			new_costs:			Array[IdleCost]			= [],
			new_quantity:		int						= 1):
	set_label(new_label_singular, new_label_plural)
	set_generator_factors(new_generator_factors)
	set_costs(new_costs)
	set_quantity(new_quantity)

func set_label(singular: String, plural: String):
	label_singular = singular
	label_plural = plural

func get_label(pluralize: bool = false, force_plural: bool = false):
	if pluralize:
		if quantity == 1 and !force_plural:
			return label_singular
		else:
			return label_plural
	return label_singular

func set_generator_factors(new_generator_factors: Array[IdleGeneratorFactorPair]):
	generator_factors = new_generator_factors
	
func get_generator_factors() -> Array[IdleGeneratorFactorPair]:
	return generator_factors

func set_costs(new_costs: Array[IdleCost]):
	costs = new_costs

func get_costs() -> Array[IdleCost]:
	return costs

func get_cost_value() -> float:
	var total := 0.0
	for cr in generator_factors:
		total += cr.get_factor()
	return total
	
func is_purchasable(num_to_buy: int = 1) -> bool:
	for cost in costs:
		if cost.currency.get_amount() < cost.get_cost(quantity, num_to_buy):
			return false
	return true
	
func buy(num_to_buy: int = 1):
	if is_purchasable(num_to_buy): 
		for cost in costs:
			cost.currency.subtract_amount(cost.get_cost(quantity, num_to_buy))
	quantity += num_to_buy	
	
func set_quantity(new_quantity: int):
	quantity = new_quantity

func get_quantity() -> int:
	return quantity
	
func dict() -> Dictionary:
	var gf_array := []
	var costs_array := []
	
	for gf in generator_factors:
		gf_array.append(gf.dict())
	for cost in costs:
		costs_array.append(cost.dict())	
	
	return {
		"label_singular": label_singular,
		"label_plural": label_plural,
		"generator_factors": gf_array,
		"costs": costs_array,
		"quantity": quantity,
	}
