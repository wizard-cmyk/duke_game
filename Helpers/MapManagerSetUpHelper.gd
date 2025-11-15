class_name MapManagerSetUpHelper extends Helper

var _default_array: Array[MapObject] = []

func _init(_manager_array: Array[MapManager], _data: MapData, _parent: Game) -> void:
	_manager_array.append(MapManager.new(_default_array, _data))
	for manager in _manager_array:
		_parent.add_child(manager)
