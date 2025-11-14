class_name CellData extends Data

var cell_position: Vector2
var has_monster: bool
var has_grid: bool

var cell_in: CellData

func _init(_cell_position: Vector2  = Vector2.ZERO, _has_monster: bool = false, _has_grid: bool = true) -> void:
	cell_position = _cell_position
	has_monster = _has_monster
	has_grid = _has_grid

func copy_data(_cell_in: CellData) -> void:
	
	cell_in = _cell_in
	
	cell_position = cell_in.cell_position
	has_monster = cell_in.has_monster
	has_grid = cell_in.has_grid
