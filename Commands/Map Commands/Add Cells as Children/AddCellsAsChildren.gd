class_name AddCellsAsChildren extends MapCommand

const NAME: String = "Add Cells as Children"

const GRID_SIZE: int = int(G.SPRITE_GRID_SIZE)

var array: Array[CellInstance]
var instance: CellInstance

func _init(_map: MapObject) -> void:
	name = NAME
	map = _map

func _execute_helper() -> void:
	array = map.data.cell_array
	for i in array:
		instance = i
		
		instance.position = instance.data.cell_position * GRID_SIZE
		map.add_child(instance)
