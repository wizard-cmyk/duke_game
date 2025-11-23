class_name GenerateCellInstancesBulk
extends Helper

var data_in: CellData
var array: Array[CellInstance]

var generate_cell_instance_cmd: GenerateCellInstance
var cell_position: Vector2
var cell_instance_command_array: Array[GenerateCellInstance]

func _init(_array: Array[CellInstance], _map: Map) -> void:
	generate_cells_in_bulk(_array, _map)

func generate_cells_in_bulk(_array: Array[CellInstance], _map: Map) -> void:
	generate_cell_instances_from_array(_array, assign_cells_to_array(_map.data, _map))

func assign_cells_to_array(_map_data: MapData, _map: Map) -> Array[GenerateCellInstance]:
	cell_instance_command_array.clear()
	for y in _map_data.size.y:
		for x in _map_data.size.x:
			cell_position = Vector2(x, y)
			data_in = CellData.new(cell_position, _map_data.visible)
			generate_cell_instance_cmd = GenerateCellInstance.new(data_in, _map)
			cell_instance_command_array.append(generate_cell_instance_cmd) 
	return cell_instance_command_array

func generate_cell_instances_from_array(_cell_instance_array: Array[CellInstance], _bulk_cmd_array: Array[GenerateCellInstance]) -> void: 
	for gen_cell_cmd in _bulk_cmd_array:
		gen_cell_cmd.execute()
		_cell_instance_array.append(gen_cell_cmd.result)
