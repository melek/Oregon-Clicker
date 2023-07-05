@icon("icons/IdleState_icon.png")
class_name IdleResource
extends Resource
## Base class for IdleEngine resources

func dict() -> Dictionary:
	var prop_dict := {}
	for prop in get_property_list():
		prop_dict[prop.name] = get(prop.name)
	return prop_dict
