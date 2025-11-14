class_name MapData extends Data

var width: float
var size: float
var cell_array: Array[CellInstance] = []

func _init(_width: float) -> void:
	width = _width
	size = pow(width, G.MAP_SHAPE)
