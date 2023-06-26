extends Node2D

func _physics_process(delta):
	$cash.text = "$" + "%.2-f" % (State.game.cash)
	
	for item in $Items.get_children():
		var itemName = item.get_name()
		var basePrice = State.game.store[itemName].basePrice
		var multiplier = State.game.store[itemName].costMultiplier
		var amount = State.game.units[itemName].amount
		
		var title = item.get_node("title")
		var stateAmount = State.game.units[itemName].amount
		var crewCap = State.game.units.wagon.amount * 8
		var oxenCap = State.game.units.wagon.amount * 4
		
		if itemName == "crew":
			if stateAmount >= crewCap:
				title.set("theme_override_colors/font_color", Color(255, 0, 0))
			else:
				title.set("theme_override_colors/font_color", Color(255, 255, 255))
				
		elif itemName == "oxen":
			if stateAmount >= oxenCap:
				title.set("theme_override_colors/font_color", Color(255, 0, 0))
			else:
				title.set("theme_override_colors/font_color", Color(255, 255, 255))
		
		
		var newPrice = basePrice * (multiplier**amount)
		
		item.get_node("PriceButton").price = newPrice
