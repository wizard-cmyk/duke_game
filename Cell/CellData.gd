class_name CellData 
extends Data

var cell_position: Vector2
var visible: bool

func _init(_cell_position: Vector2, _visible: bool) -> void:
	cell_position = _cell_position
	visible = _visible
