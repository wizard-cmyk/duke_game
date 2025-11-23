class_name DeleteAndAddMap
extends Helper

enum DELETE_MODE { ALL, NEXT, DIRECT }

func add_map(_data: MapData, _array: Array[Map], _manager: MapManager) -> void:
	var _create: = AppendToMapArray.new(_data, _array, _manager)
	_create.execute()

func delete_map(_mode: DELETE_MODE, _array: Array[Map], _map: Map) -> void:
	var _delete: = DeleteMapFromArray.new(_array)
	match _mode:
		DELETE_MODE.ALL:
			_delete.delete_all_maps()
		DELETE_MODE.NEXT:
			_delete.delete_next_map()
		DELETE_MODE.DIRECT:
			_delete.delete_map(_map)

func regenerate_map(_data: MapData, _array: Array[Map], _manager: MapManager) -> void:
	delete_map(DELETE_MODE.ALL, _array, null)
	add_map(_data, _array, _manager)
