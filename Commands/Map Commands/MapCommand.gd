class_name MapCommand extends Command

const _NAME: String = "Map Command"

var map: MapObject

func _init(_map: MapObject) -> void:
	name = _NAME
	
	map = _map
