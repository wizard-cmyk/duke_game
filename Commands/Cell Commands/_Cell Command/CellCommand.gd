class_name CellCommand extends MapCommand

const __NAME: String = "Cell Command"

var current_position: Vector2

func _init(_current_position: Vector2, _map: MapObject = MapObject.new(MapData.new(G.DEFAULT_MAP_WIDTH))) -> void:
	name = __NAME
	
	current_position = _current_position
	map = _map
