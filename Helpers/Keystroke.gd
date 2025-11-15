class_name Keystroke extends RefCounted

var type: String

var just_pressed: bool
var just_released: bool
var currently_pressed: bool

func _init(_type: String) -> void:
	type = _type
