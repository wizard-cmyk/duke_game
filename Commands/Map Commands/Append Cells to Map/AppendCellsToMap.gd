class_name AppendCellsToMap extends MapCommand

const NAME: String = "Append Cells to Map"

var map_size: float = 0.0
var generate_cell_cmd: GenerateCellInstance = null
var array: Array[CellInstance] = []

var grid_setting: CellInstance = null

var new_cell: CellInstance = CellInstance.new()

func _init(_map: MapObject) -> void:
	name = NAME
	
	map = _map


func _execute_helper() -> void:
	array = map.data.cell_array
	map_size =  map.data.size
	
	for current_cell in int(map_size):
		
		new_cell = CellInstance.new()
		
		generate_cell_cmd = GenerateCellInstance.new(float(current_cell), false, map)  ## Important
		generate_cell_cmd.execute()
		
		new_cell = generate_cell_cmd.result
		array.append(new_cell)
