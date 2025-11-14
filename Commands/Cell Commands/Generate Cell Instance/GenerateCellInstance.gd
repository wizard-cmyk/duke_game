class_name GenerateCellInstance extends CellCommand

const NAME: String = "Generate Cell"

var find_coord_cmd: FindMapCoordinates
var current_map_cell: CellInstance = null
var has_monster: bool = false

func _init(_current_position: float, _has_monster: bool, _map: MapObject) -> void:
	name = NAME
	
	current_position = _current_position
	map = _map
	
	has_monster = _has_monster

func _execute_helper() -> void:
	current_map_cell = CellInstance.new(G.cell_default) ## Important
	
	find_coord_cmd = FindMapCoordinates.new(current_position, map)
	find_coord_cmd.execute()
	
	current_map_cell.data.cell_position = find_coord_cmd.result
	
	result = current_map_cell
