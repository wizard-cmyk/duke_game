class_name MapData 
extends Data

var cell_data_array: Array[CellData]
var size: Vector2i
var visible: bool

func _init(_data = null,
 _data_array: Array[CellData] = [], 
_size: Vector2i = Global.DEFAULT_MAP_SIZE,
_visible: bool = true
) -> void:
	if _data == null:
		cell_data_array = _data_array
		size = _size
		visible = _visible
	else:
		cell_data_array = _data.cell_data_array
		size = _data.size
		visible = _data.visible
	
