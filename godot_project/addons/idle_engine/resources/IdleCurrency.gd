@icon("icons/IdleCurrency_icon.png")
class_name IdleCurrency
extends IdleResource
## Currency resource for use in IdleEngine.

# Singular and Plural strings
@export var label_singular: String
@export var label_plural: String

# Current amount of the currency.
@export var amount: float

func _init(	new_label_singular:	String	= "",
			new_label_plural:	String	= "",
			new_amount:			float	= 0.0):
	set_label(new_label_singular, new_label_plural)
	set_amount(new_amount)

func set_label(singular: String, plural: String):
	label_singular = singular
	label_plural = plural

func get_label(pluralize: bool = false, force_plural: bool = false) -> String:
	if pluralize:
		if amount == 1.0 and !force_plural:
			return label_singular
		else:
			return label_plural
	return label_singular

func set_amount(new_amount: float):
	amount = new_amount

func add_amount(x: float):
	amount += x
	
func subtract_amount(x: float):
	amount -= x

func get_amount() -> float:
	return amount

func dict() -> Dictionary:
	return {
		"label_singular": label_singular,
		"label_plural": label_plural,
		"amount": amount
	}
