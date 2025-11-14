class_name CopyCell extends CellCommand

const NAME: String = "Copy Cell"

var copy_cell: CellInstance = null
var map_cell_array: Array[CellInstance] = map.map_cell_array

func _init(_current_position: float = 0.0, _map: MapObject = MapObject.new()) -> void:
	name = NAME
	
	current_position = _current_position
	map = _map

func _execute_helper() -> void:
	copy_cell = map_cell_array.get(int(current_position))
	map_cell_array = map.map_cell_array
	result = copy_cell
