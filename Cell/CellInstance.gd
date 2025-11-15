class_name CellInstance extends Node2D

var data: CellData

var grid_sprite: CellSprite = CellSprite.new(Texture2D.new())
var monster_sprite: CellSprite = CellSprite.new(Texture2D.new())

func _init(_data: CellData) -> void:
	
	data = _data
	var dict = data.dict
	
	if dict.has_grid:
		grid_sprite = CellSprite.new(SpriteInfo.grid_resource)
		add_child(grid_sprite)
	
	if dict.has_monster:
		monster_sprite = CellSprite.new(SpriteInfo.monster_resource)
		add_child(monster_sprite)
