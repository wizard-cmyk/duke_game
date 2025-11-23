class_name CreateMap 
extends Command

var current_map: Map
var append_cmd: AppendCellsToMap
var add_cells_cmd: AddCellsAsChildren

var data: MapData

func _init(_data: MapData):
	data = _data

func _execute_helper() -> void:
	current_map = Map.new(data, [])
	
	append_cmd = AppendCellsToMap.new(current_map)
	append_cmd.execute()
	
	add_cells_cmd = AddCellsAsChildren.new(current_map)
	add_cells_cmd.execute()
	
	result = current_map
