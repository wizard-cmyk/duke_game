class_name MapManagerSetUp 
extends Helper

var _default_array: Array[Map] = []

func _init(_manager_array: Array[MapManager], _data: MapData, _parent: Node2D) -> void:
	_manager_array.append(MapManager.new(_default_array, _data))
	for manager in _manager_array:
		_parent.add_child(manager)
