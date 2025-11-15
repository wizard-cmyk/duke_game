class_name CellData extends Data

func _init(_cell_position: Vector2, _has_monster: bool, _has_grid: bool) -> void:
	dict.cell_position = _cell_position
	dict.has_monster = _has_monster
	dict.has_grid = _has_grid
