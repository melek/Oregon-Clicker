extends Node2D

@onready var idle: IdleEngine = get_node("IdleEngine")

var running: bool = true

func _ready():
	populate($GeneratorList/GridContainer, idle.get_generators())
	populate($MultiplierList/GridContainer, idle.get_multipliers())	
	
func _process(delta):
	if running: idle.update(delta)
	populate($CurrencyList/GridContainer, idle.get_currencies())
	updateGenRows($GeneratorList/GridContainer, idle.get_generators())
	updateMultRows($MultiplierList/GridContainer, idle.get_multipliers())
	

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			idle.print_generators()
			idle.print_currencies()
			idle.print_multipliers()
		elif event.keycode == KEY_ESCAPE:
			get_tree().quit()


func populate(grid: GridContainer, arr: Array):
	for child in grid.get_children(): child.queue_free()
	addColumnHeaders(grid, arr)
	addCells(grid, arr)

func addColumnHeaders(grid: GridContainer, arr: Array):
	grid.add_child(newGridLabel("Label"))
	
	if arr is Array[IdleCurrency]:
		grid.add_child(newGridLabel("Amount"))
		grid.add_child(newGridLabel("Prod/s"))		
		
	elif arr is Array[IdleGenerator]:
		grid.add_child(newGridLabel("Currency Rates"))
		grid.add_child(newGridLabel("Qty"))
		grid.add_child(newGridLabel("Cost"))
		grid.add_child(newGridLabel("Buy"))

	elif arr is Array[IdleMultiplier]:
		grid.add_child(newGridLabel("Generator Factors"))
		grid.add_child(newGridLabel("Qty"))
		grid.add_child(newGridLabel("Cost Props"))
		grid.add_child(newGridLabel("Buy"))
		
func addCells(grid: GridContainer, arr: Array):
	for e in arr:
		grid.add_child(newGridLabel(e.get_label()))
		
		if arr is Array[IdleCurrency]:
			grid.add_child(newGridLabel("%6.2f" % e.get_amount()))
			grid.add_child(newGridLabel(str(idle.get_production(e))))
			
		elif arr is Array[IdleGenerator]:
			grid.add_child(newGridLabel(pairLabel(e.get_currency_rates())))
			grid.add_child(newGridLabel(str(e.get_quantity())))
			grid.add_child(newGridLabel(pairLabel(e.get_costs(), e.get_quantity(), e.get_cost_value())))
			grid.add_child(newGridButton("Buy 1", e))
						
		elif arr is Array[IdleMultiplier]:
			grid.add_child(newGridLabel(pairLabel(e.get_generator_factors())))
			grid.add_child(newGridLabel(str(e.get_quantity())))
			grid.add_child(newGridLabel(pairLabel(e.get_costs(), e.get_quantity(), e.get_cost_value())))
			grid.add_child(newGridButton("Buy 1", e))

func pairLabel(arr: Array, parent_qty = null, parent_value = null):
	var pairLabels: PackedStringArray = []
	for e in arr:
		if arr is Array[IdleCost]:
			var this_cost = e.get_cost(parent_qty, parent_value)
			pairLabels.append("%s: %6.1f (%3.1f^%3.1f)" % [e.get_currency().get_label(), this_cost, e.get_base_cost(), e.get_exponent()])
		elif arr is Array[IdleCurrencyRatePair]:
			pairLabels.append("%s: %6.1f" % [e.get_currency().get_label(), e.get_rate()])
		elif arr is Array[IdleGeneratorFactorPair]:
			pairLabels.append("%s: %6.1f" % [e.get_generator().get_label(), e.get_factor()])
	
	return "\n".join(pairLabels)

func newGridLabel(new_text: String):
	var label = Label.new()
	
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	label.text = new_text
	
	return label

func newGridButton(new_text: String, e):
	var button = Button.new()
	
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	button.text = new_text
	
	if !e.is_purchasable(): 
		button.disabled = true
	
	button.pressed.connect(func(): e.buy())
	return button

func updateGenRows(grid: GridContainer, generators: Array[IdleGenerator]):
	var index = 5 # First cell of first row after headers
	for g in generators:
		grid.get_child(index).text = g.get_label()
		grid.get_child(index + 1).text = pairLabel(g.get_currency_rates())
		grid.get_child(index + 2).text = str(g.get_quantity())
		grid.get_child(index + 3).text = pairLabel(g.get_costs(), g.get_quantity(), g.get_cost_value())
		grid.get_child(index + 4).disabled = !g.is_purchasable()
		index += 5

func updateMultRows(grid: GridContainer, multipliers: Array[IdleMultiplier]):
	var index = 5 # First cell of first row after headers
	for m in multipliers:
		grid.get_child(index).text = m.get_label()
		grid.get_child(index + 1).text = pairLabel(m.get_generator_factors())
		grid.get_child(index + 2).text = str(m.get_quantity())
		grid.get_child(index + 3).text = pairLabel(m.get_costs(), m.get_quantity(), m.get_cost_value())
		if grid.get_child(index + 4).disabled != !m.is_purchasable():
			grid.get_child(index + 4).disabled = !m.is_purchasable()
		index += 5
