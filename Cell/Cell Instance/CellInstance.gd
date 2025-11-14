class_name CellInstance extends Node2D

var data: CellData

var grid_sprite: CellSprite = CellSprite.new(Texture2D.new())
var monster_sprite: CellSprite = CellSprite.new(Texture2D.new())
var has_monster: bool = false
var has_grid: bool = false

func _init(_data: CellData) -> void:
	
	data = _data
	
	if data.has_grid:
		grid_sprite = CellSprite.new(SpriteInfo.grid_resource)
		add_child(grid_sprite)
	
	if data.has_monster:
		monster_sprite = CellSprite.new(SpriteInfo.monster_resource)
		add_child(monster_sprite)
