class_name CopyCellVec2 extends CellCommand

const NAME: String = "Copy Cell (Vector2)"

var current_position_vec: Vector2 = Vector2.ZERO

func _init(_current_pos_vec: Vector2, _map: MapObject):
	name = NAME
	
	current_position_vec = _current_pos_vec
	map = _map

func _execute_helper() -> void:
	var _sum_of_map_position_vector: float = 0.0
	var _map_width: float = float(map.map_object_width)
	_sum_of_map_position_vector = current_position_vec.x + (current_position_vec.y * _map_width)
	var copy_cell_command: CopyCell = CopyCell.new(_sum_of_map_position_vector, map)
	copy_cell_command.execute()
	result = copy_cell_command.result
