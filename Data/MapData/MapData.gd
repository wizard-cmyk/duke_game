class_name MapData extends Data

var width: float
var length: float
var has_monster: bool

var area: float:
	get:
		return width * length

var cell_array: Array[CellInstance]

var map_in: MapData 

func update(_array: Array[CellInstance], _width: float, _length: float, _monster: bool) -> void:
	cell_array = _array
	width = _width
	length = _length
	has_monster = _monster

func copy_data(_map_in: MapData) -> MapData:
	map_in = _map_in
	update(map_in.cell_array, map_in.width, map_in.length, map_in.has_monster)
	return map_in

func _init(_width: float, _length: float = _width, _monster: bool = false) -> void:
	update([], _width, _length, _monster)
