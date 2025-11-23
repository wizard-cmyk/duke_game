class_name AppendToMapArray 
extends Command

var create_map_command: CreateMap 

var data: MapData
var map_obj_array: Array[Map]
var parent_reference: MapManager

func _init(_data: MapData, _map_obj_array: Array[Map], _parent_reference: MapManager) -> void:
	parent_reference = _parent_reference
	data = _data
	map_obj_array = _map_obj_array
	
	for map in _map_obj_array:
		_parent_reference.new(map)

func _execute_helper() -> void:
	create_map_command = CreateMap.new(data)
	create_map_command.execute()
	map_obj_array.append(create_map_command.result)
	
	for map in map_obj_array:
		parent_reference.add_child(map)
