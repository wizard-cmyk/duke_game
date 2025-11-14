class_name AppendCellsToMap extends MapCommand

const NAME: String = "Append Cells to Map"

var length: float
var width: float
var area: float

var generate_cell_instance: GenerateCellInstance
var array: Array[CellInstance]

var new_cell: CellInstance

var gen_in_bulk: Array[GenerateCellInstance]

func _init(_map: MapObject) -> void:
	name = NAME
	
	map = _map
	array = []

class GenerateCellInstancesBulk extends Helper:
	var cell_instance_command_array: Array[GenerateCellInstance]
	var cell_position: Vector2 
	var generate_cell_instance_cmd: GenerateCellInstance
	
	var data_in: CellData
	
	func assign_cmd_to_array(_length: float, _width: float, _map: MapObject) -> Array[GenerateCellInstance]:
		cell_instance_command_array = []
		for y in _length:
			for x in _width:
				cell_position = Vector2(x, y)
				
				data_in = CellData.new(cell_position)
				
				generate_cell_instance_cmd = GenerateCellInstance.new(data_in, _map) ## Important
				
				cell_instance_command_array.append(generate_cell_instance_cmd) 
		return cell_instance_command_array

func _execute_helper() -> void:
	array = map.data.cell_array
	length =  map.data.length
	width = map.data.width
	area = map.data.area
	
	gen_in_bulk = GenerateCellInstancesBulk.new().assign_cmd_to_array(length, width, map)
	
	for cmd in gen_in_bulk:
		cmd.execute()
		array.append(cmd.result)
