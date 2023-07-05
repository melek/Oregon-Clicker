@icon("icons/IdleCurrencyRatePair_icon.png")
class_name IdleCurrencyRatePair
extends IdleResource
## A pair of a currency and a float representing a generator rate.

@export var currency: IdleCurrency
@export var rate: float

func _init(	new_currency	:=	IdleCurrency.new(),
			new_rate		:=	1.0):
	currency = new_currency
	rate = new_rate

func get_currency() -> IdleCurrency:
	return currency
	
func get_rate() -> float:
	return rate

func dict() -> Dictionary:
	return {
		"currency": currency.get_label(),
		"rate": rate
	}
