extends Node2D

var timeSince = 0
var oldOregon = 0
var oregonTrack = 0
var oldPercent = 0

func _ready():
	oldPercent = ( State.game.progress / Constants.game.stepLength) * State.game.oregons

func _physics_process(delta):
	updateMainValue()
	updatePartyStats()
	
func format_main(distance : String) -> String:
	var i : int = distance.length() - 3
	while i > 0:
		distance = distance.insert(i, ",")
		i = i - 3
	return distance
	
func updateMainValue():
	var newPercent = ( State.game.progress / Constants.game.stepLength) * State.game.oregons
	if State.game.oregons < 1:
		$amount.text = format_main("%0.0-f" % (Constants.game.stepLength - State.game.progress))
		$units.text = Constants.game.statUnits.mainStat[0]
	else:	
		$units.text = Constants.game.statUnits.mainStat[1]
		$amount.text = format_main(str(State.game.oregons))
		$milesToNext.visible = true
		$milesToNext/value.text = format_main("%0.0-f" % (Constants.game.stepLength - State.game.progress))
		
#		if timeSince >= 60:
#			$amount.text = format_main("%0.0-f" % (newPercent - oldPercent / 60))
#			timeSince = 0
#			oldPercent = newPercent
#		else: 
#			timeSince += 1
		
		
			
		

func updatePartyStats():
	for child in $PartyStats.get_children():
		var value = child.get_node("value")
		var title = child.get_node("title")
		var valueName = child.get_name()
		var stateAmount = State.game.units[valueName].amount
		var crewCap = State.game.units.wagon.amount * 8
		var oxenCap = State.game.units.wagon.amount * 4
		
		if valueName == "crew":
			value.text = str(stateAmount) + "/" + str(crewCap)
			
			if stateAmount >= crewCap:
				value.set("theme_override_colors/font_color", Color(255, 0, 0))
				title.set("theme_override_colors/font_color", Color(255, 0, 0))
			else:
				value.set("theme_override_colors/font_color", Color(255, 255, 255))
				title.set("theme_override_colors/font_color", Color(255, 255, 255))
				
		elif valueName == "oxen":
			value.text = str(stateAmount) + "/" + str(oxenCap)
			
			if stateAmount >= oxenCap:
				value.set("theme_override_colors/font_color", Color(255, 0, 0))
			else:
				value.set("theme_override_colors/font_color", Color(255, 255, 255))
				
		else:
			value.text = str(stateAmount)
