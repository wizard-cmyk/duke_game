class_name DeleteMapFromArray 
extends Helper

var array_to_delete_from: Array[Map] 
var destroy_map_cmd: DestroyMap

func _init(_array: Array[Map]) -> void:
	array_to_delete_from = _array

func _delete_map(_map: Map) -> void:
	destroy_map_cmd = DestroyMap.new(_map)
	destroy_map_cmd.execute()

func delete_map_with_index(_array: Array[Map] = array_to_delete_from, _index: int = 0) -> void:
	if !_array.is_empty():
		_delete_map(array_to_delete_from[_index])
		_array.remove_at(_index)

func delete_all_maps(_array: Array[Map] = array_to_delete_from) -> void:
	while !_array.is_empty():
		delete_map_with_index(_array, 0)
	
