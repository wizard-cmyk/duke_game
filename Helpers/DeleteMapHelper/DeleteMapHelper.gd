class_name DeleteMapHelper extends Helper

var array_to_delete_from: Array[MapObject] 
var destroy_map_cmd: DestroyMap

func _init(_array: Array[MapObject]) -> void:
	array_to_delete_from = _array

func delete_map(_map: MapObject) -> void:
	destroy_map_cmd = DestroyMap.new(_map)
	destroy_map_cmd.execute()

func delete_next_map() -> Array[MapObject]:
	for _map in array_to_delete_from:
		delete_map(_map)
		array_to_delete_from.pop_front()
	return array_to_delete_from

func delete_all_maps() -> void:
	for i in array_to_delete_from.size():
		delete_next_map()
