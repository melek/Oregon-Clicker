extends Control

# The 'bullet' character indicating each new log entry
var prefix = "◘ "

# How many log entries can we hold?
var max_log_length: int = 10

# Business logic variables
var feedbox: VBoxContainer
var label_theme: LabelSettings
var label_font: FontFile = load("res://assets/fonts/PrintChar21.ttf")

func _ready():
	# Assign the feedbox where we actually append our events
	feedbox = get_node("ScrollContainer/VBoxContainer")
	
	# Set up our label theme template
	label_theme = LabelSettings.new()	
	label_theme.font = label_font

# Add an event!
func add_event(log_text: String):
	var new_event:Label = Label.new()
	new_event.label_settings = label_theme
	new_event.text = prefix + log_text
	new_event.theme_override_font_sizes.font_size = 16
	new_event.set_autowrap_mode(TextServer.AUTOWRAP_WORD)
	if(feedbox.get_child_count() == max_log_length): feedbox.get_child(feedbox.get_child_count() - 1).queue_free()
	feedbox.add_child(new_event)
	feedbox.move_child(new_event, 0)
	$ScrollContainer.scroll_vertical = 0;
