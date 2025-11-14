class_name FindMapCoordinates extends CellCommand

const NAME: String = "Find Map Coordinates"

var _x: float = 0.0
var _y: float = 0.0
var map_width: float = 0.0

func _init(_current_position: float, _map: MapObject) -> void:
	name = NAME
	
	current_position = _current_position
	map = _map

func _execute_helper() -> void:
	map_width = map.data.width
	
	match map_width:
		0.0:
			_y = (current_position - _x)
		_:
			_x = int(current_position) % int(map_width)
			_y = (current_position - _x) / map_width
	
	result = Vector2(_x, _y)
