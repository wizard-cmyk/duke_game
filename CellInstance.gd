class_name CellInstance 
extends Sprite2D

var data: CellData

func _init(_data: CellData, _resource: Texture2D = SpriteInfo.grid_resource) -> void:
	data = _data
	set_visibility()
	
	centered = false
	texture = _resource

func set_visibility() -> void:
	visible = data.visible
