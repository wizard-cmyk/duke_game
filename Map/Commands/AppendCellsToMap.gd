class_name AppendCellsToMap 
extends MapCommand

var cell_instance_array: Array[CellInstance]
var cell_data_array: Array[CellData]

func _init(_map: Map) -> void:
	map = _map

func _execute_helper() -> void:
	cell_instance_array = map.cell_instance_array 
	GenerateCellInstancesBulk.new(cell_instance_array, map)
