@icon("res://assets/resources/IdleGenerator_icon.png")
class_name IdleGenerator
extends Resource
## Generator resource for use in IdleEngine.

# Singular and Plural strings
@export var label_singular: String
@export var label_plural: String

# Index of the currency in the IdleState's currency resource array
@export var currency: int

# How many generators and their rate of generation per second
@export var quantity: int
@export var rate: float

func _init(	new_label_singular:	String	= "",
			new_label_plural:	String	= "",
			new_currency:		int		= 0,
			new_quantity:		int		= 0,			
			new_rate:			float	= 0.0):
	set_label(new_label_singular, new_label_plural)
	set_currency(new_currency)
	set_quantity(new_quantity)
	set_rate(new_rate)

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

func set_currency(new_currency: int):
	currency = new_currency
	
func get_currency():
	return currency

func set_quantity(new_quantity: int):
	quantity = new_quantity

func get_quantity(as_string: bool = false):
	if as_string: return str(quantity)
	return quantity

func set_rate(new_rate: float):
	rate = new_rate

func get_rate():
	return rate
