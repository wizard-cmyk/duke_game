class_name CellInstance extends Node2D

var data: CellData

var grid_sprite: CellSprite = CellSprite.new(Texture2D.new())
var monster_sprite: CellSprite = CellSprite.new(Texture2D.new())
var has_monster: bool = false
var has_grid: bool = false

var cell_data_in: CellData = G.cell_default

func _init(_cell_data_in: CellData = cell_data_in) -> void:
	
	cell_data_in = _cell_data_in
	
	data = CellData.new()
	data.copy_data(cell_data_in)
	
	if data.has_grid:
		grid_sprite = CellSprite.new(SpriteInfo.grid_resource)
		add_child(grid_sprite)
	
	if data.has_monster:
		monster_sprite = CellSprite.new(SpriteInfo.monster_resource)
		add_child(monster_sprite)
