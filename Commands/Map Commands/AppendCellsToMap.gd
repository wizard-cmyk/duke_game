class_name AppendCellsToMap extends MapCommand

const NAME: String = "Append Cells to Map"

var generate_cells_in_bulk: Array[GenerateCellInstance]
var generate_cell_instance: GenerateCellInstance
var cell_instance_array: Array[CellInstance]
var cell_data_array: Array[CellData]

func _init(_map: MapObject) -> void:
	name = NAME
	map = _map

class GenerateCellInstancesBulk extends Helper:
	var cell_instance_command_array: Array[GenerateCellInstance]
	var generate_cell_instance_cmd: GenerateCellInstance
	
	
	func assign_cmd_to_array(_map_data: MapData, _map: MapObject) -> Array[GenerateCellInstance]:
		cell_instance_command_array = []
		var dict = _map_data.dict
		for y in dict.size.y:
			for x in dict.size.x:
				var cell_position: Vector2  = Vector2(x, y)
				var data_in: CellData = CellData.new(cell_position, dict.has_monster, dict.has_grid)
				generate_cell_instance_cmd = GenerateCellInstance.new(data_in, _map) ## Important
				cell_instance_command_array.append(generate_cell_instance_cmd) 
		return cell_instance_command_array

func data_to_instance(_data_array: Array[CellData]) -> Array[CellInstance]:
	var array: Array[CellInstance]
	for data in _data_array:
		array.append(CellInstance.new(data))
	return array

func _execute_helper() -> void:
	cell_instance_array = map.data.dict.cell_instance_array
	
	generate_cells_in_bulk = GenerateCellInstancesBulk.new().assign_cmd_to_array(map.data, map)
	
	for cmd in generate_cells_in_bulk:
		cmd.execute()
		cell_instance_array.append(cmd.result)
