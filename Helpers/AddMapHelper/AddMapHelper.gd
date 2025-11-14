class_name AddMapHelper extends Helper

var width: float
var array: Array[MapObject]
var parent_reference: MapManager
var create_map_cmd: CreateMap
var _result: MapObject

var data: MapData

func _init(_data: MapData, _array: Array[MapObject], _parent_reference: MapManager) -> void:
	update(_data, _array, _parent_reference)

func update(_d, _a, _p) -> void:
	data = _d
	array = _a
	parent_reference = _p
	create_map_cmd = CreateMap.new(data)

func add_map_to_array() -> void:
	create_map_cmd.execute()
	_result = create_map_cmd.result
	array.append(_result)

func add_maps_from_array_as_children() -> void:
	for _map in array:
		parent_reference.add_child(_map)
