class_name MapData extends Data

#var cell_instance_array: Array[CellInstance] ## HUGE ISSUE!!!!!!!! :(
# MapData shouldn't store CellInstance, it should store CellData.

func _init(_instance_array: Array[CellInstance], _data_array: Array[CellData], _size: Vector2, _monster: bool, _grid: bool) -> void:
	dict.cell_instance_array = _instance_array ## HUGE ISSUE!!!!!!!! :(
	dict.cell_data_array = _data_array
	dict.size = _size
	dict.has_monster = _grid
	dict.has_grid = _grid
	
