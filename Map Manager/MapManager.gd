class_name MapManager extends Node2D

# Array that holds MapObjects, this is what the MapManager exists to contain
var map_array: Array[MapObject] 

func _init(_initial_map_array: Array[MapObject], _data: MapData) -> void:
	map_array = _initial_map_array
	MapObjectManagementHelper.new().add_map(_data, map_array, self)
