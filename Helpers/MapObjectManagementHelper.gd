class_name MapObjectManagementHelper extends Helper

enum DELETE_MODE { ALL, NEXT, DIRECT }

func add_map(_data: MapData, _array: Array[MapObject], _manager: MapManager) -> void:
	AddMapHelper.new(_data, _array, _manager)

func delete_map(_mode: DELETE_MODE, _array: Array[MapObject], _map: MapObject = null) -> void:
	match _mode:
		DELETE_MODE.ALL:
			DeleteMapHelper.new(_array).delete_all_maps()
		DELETE_MODE.NEXT:
			DeleteMapHelper.new(_array).delete_next_map()
		DELETE_MODE.DIRECT:
			DeleteMapHelper.new(_array).delete_map(_map)

func regenerate_map(_data: MapData, _array: Array[MapObject], _manager: MapManager) -> void:
	delete_map(DELETE_MODE.ALL, _array, null)
	add_map(_data, _array, _manager)
