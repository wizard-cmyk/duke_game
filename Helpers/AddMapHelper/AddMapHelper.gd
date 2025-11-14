class_name AddMapHelper extends Helper

var array: Array[MapObject]
var parent_reference: MapManager
var new_map: MapObject

var data: MapData
var create_map: CreateMap

func _init(_data: MapData, _array: Array[MapObject], _parent_reference: MapManager) -> void:
	data = _data
	array = _array
	parent_reference = _parent_reference
	create_map = CreateMap.new(data)

func add_map_to_array() -> void:
	create_map.execute()
	new_map = create_map.result
	array.append(new_map)

func add_maps_from_array_as_children() -> void:
	for _map in array:
		parent_reference.add_child(_map)
