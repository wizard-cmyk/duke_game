class_name CellCommand 
extends Command

var position: Vector2
var map: Map

func _init(_position: Vector2, _map: Map) -> void:
	position = _position
	map = _map
