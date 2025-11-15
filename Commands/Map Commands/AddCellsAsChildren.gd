class_name AddCellsAsChildren extends MapCommand

const NAME: String = "Add Cells as Children"

const GRID_SIZE: int = int(Global.SPRITE_GRID_SIZE)

var array: Array[CellInstance]
var instance: CellInstance

var d: Dictionary

func _init(_map: MapObject) -> void:
	name = NAME
	map = _map

func _execute_helper() -> void:
	d = map.data.dict
	array = d.cell_instance_array
	for i in array:
		instance = i
		
		d = instance.data.dict
		
		instance.position = (d.cell_position) * GRID_SIZE
		map.add_child(instance)
