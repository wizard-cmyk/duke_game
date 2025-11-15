class_name GenerateCellInstance extends CellCommand

const NAME: String = "Generate Cell Instance"

var current_map_cell: CellInstance

var data_in: CellData

func _init(_data_in: CellData, _map: MapObject) -> void:
	name = NAME
	
	data_in = _data_in
	map = _map
	

func _execute_helper() -> void:
	current_map_cell = CellInstance.new(data_in) ## Important
	
	result = current_map_cell
