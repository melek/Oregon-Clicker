extends Node2D

func _physics_process(delta):
	updateResources()
	

func updateResources():
	for child in get_children():
		var value = child.get_node("value")
		var price = child.get_node("PriceButton")
		var valueName = child.get_name()
		if valueName in State.game.resources:
			var stateAmount = str(State.game.resources[valueName].amount)
			var statePrice = State.game.resources[valueName].price
			value.text = stateAmount
			price.price = statePrice
