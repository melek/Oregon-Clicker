@icon("res://assets/resources/IdleCurrency_icon.png")
class_name IdleCurrency
extends Resource
## Currency resource for use in IdleEngine.

# Singular and Plural strings
@export var label_singular: String
@export var label_plural: String

# Current value of the currency.
# This is not a relative value, just a quantity.
@export var value: float

func _init(	new_label_singular:	String	= "",
			new_label_plural:	String	= "",
			new_value:			float	= 0.0):
	set_label(new_label_singular, new_label_plural)
	set_value(new_value)

func set_label(singular: String, plural: String):
	label_singular = singular
	label_plural = plural

func get_label(pluralize: bool = false, force_plural: bool = false):
	if pluralize:
		if value == 1 and !force_plural:
			return label_singular
		else:
			return label_plural
	return label_singular

func set_value(new_value: float):
	value = new_value

func get_value(as_string: bool = false):
	if as_string: return str(value)
	return value
