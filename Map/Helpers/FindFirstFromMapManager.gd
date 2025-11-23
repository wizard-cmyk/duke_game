class_name FindFirstFromMapManager 
extends Helper

var map_manager_array: Array[MapManager]

func _init(_map_manager_array: Array[MapManager]) -> void:
	map_manager_array = _map_manager_array
	
func map_manager(_map_manager_array: Array[MapManager] = map_manager_array) -> MapManager:
	if !_map_manager_array.is_empty():
		return _map_manager_array.front()
	else: 
		return null

func map_array(_map_manager_array: Array[MapManager] = map_manager_array) -> Array[Map]:
	var _array: Array[Map] = []
	if (map_manager(_map_manager_array) != null):
		return (map_manager(_map_manager_array).map_array)
	else: 
		return _array 

func map(_map_manager_array: Array[MapManager] = map_manager_array) -> Map:
	if !map_array(_map_manager_array).is_empty():
		return map_array(_map_manager_array).front()
	else: 
		return null

func data(_map_manager_array: Array[MapManager] = map_manager_array) -> MapData:
	if map(_map_manager_array) != null:
		return map(_map_manager_array).data
	else: 
		return null

func size(_map_manager_array: Array[MapManager] = map_manager_array) -> Vector2i: 
	if data(_map_manager_array) != null:
		return data(_map_manager_array).size
	else: 
		return Vector2i.ZERO
