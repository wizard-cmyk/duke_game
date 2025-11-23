class_name GenerateCellInstance
extends MapCommand

var current_map_cell: CellInstance
var cell_data: CellData

func _init(_cell_data: CellData, _map: Map) -> void:
	cell_data = _cell_data
	map = _map

func _execute_helper() -> void:
	current_map_cell = CellInstance.new(cell_data)
	result = current_map_cell
