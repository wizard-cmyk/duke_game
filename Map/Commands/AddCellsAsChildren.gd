class_name AddCellsAsChildren 
extends MapCommand

var cell_array: Array[CellInstance]

func _init(_map: Map) -> void:
	map = _map

func _execute_helper() -> void:
	for cell in map.cell_instance_array:
		cell.position = (cell.data.cell_position) * Global.SPRITE_GRID_SIZE
		map.add_child(cell)
