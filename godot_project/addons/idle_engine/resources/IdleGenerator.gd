@icon("icons/IdleGenerator_icon.png")
class_name IdleGenerator
extends IdleResource
## Generator resource for use in IdleEngine.

# Singular and Plural strings
@export var label_singular: String
@export var label_plural: String

# Array of currency-rate pairs generated
@export var currency_rates: Array[IdleCurrencyRatePair]

# Array of costs for this generator
@export var costs: Array[IdleCost]

# How many generators
@export var quantity: int

func _init(	new_label_singular:	String				= "",
			new_label_plural:	String				= "",
			new_currency_rates:	Array[IdleCurrencyRatePair]	= [],
			new_costs:			Array[IdleCost]		= [],
			new_quantity:		int					= 0):
	set_label(new_label_singular, new_label_plural)
	set_currency_rates(new_currency_rates)
	set_costs(new_costs)
	set_quantity(new_quantity)
	
func set_label(singular: String, plural: String):
	label_singular = singular
	label_plural = plural

func get_label(pluralize: bool = false, force_plural: bool = false) -> String:
	if pluralize:
		if quantity == 1 and !force_plural:
			return label_singular
		else:
			return label_plural
	return label_singular

func set_currency_rates(new_currency_rates: Array[IdleCurrencyRatePair]):
	currency_rates = new_currency_rates
	
func get_currency_rates() -> Array[IdleCurrencyRatePair]:
	return currency_rates

func set_costs(new_costs: Array[IdleCost]):
	costs = new_costs

func get_costs() -> Array[IdleCost]:
	return costs

func get_cost_value() -> float:
	var total := 0.0
	for cr in currency_rates:
		total += cr.get_rate()
	return total
	
func is_purchasable(num_to_buy: int = 1) -> bool:
	for cost in costs:
		if cost.currency.get_amount() < cost.get_cost(quantity, get_cost_value(), num_to_buy):
			return false
	return true
	
func buy(num_to_buy: int = 1):
	if is_purchasable(num_to_buy): 
		for cost in costs:
			var this_price = cost.get_cost(quantity, get_cost_value(), num_to_buy)
			cost.currency.subtract_amount(this_price)
	quantity += num_to_buy	

func get_price(c: IdleCurrency):
	var price: float = 0.0
	for cost in get_costs():
		if cost.get_currency() == c: price += cost.get_cost(quantity, get_cost_value())
	return price 

func set_quantity(new_quantity: int):
	quantity = new_quantity

func get_quantity() -> int:
	return quantity

func dict() -> Dictionary:
	var cr_array := []
	var costs_array := []
	
	for cr in currency_rates:
		cr_array.append(cr.dict())
	for cost in costs:
		costs_array.append(cost.dict())
	
	return {
		"label_singular": label_singular,
		"label_plural": label_plural,
		"currency_rates": cr_array,
		"costs": costs_array,
		"quantity": quantity,
	}
