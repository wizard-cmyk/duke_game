class_name AddMapHelper extends Helper

func _init(_data: MapData, _map_obj_array: Array[MapObject], _parent_reference: MapManager) -> void:
	var create_map: CreateMap = CreateMap.new(_data)
	
	create_map.execute()
	_map_obj_array.append(create_map.result)
	
	for _map in _map_obj_array:
		_parent_reference.add_child(_map)
