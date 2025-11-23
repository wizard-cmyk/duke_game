class_name Keystroke extends RefCounted

var input_name: String

var just_pressed: bool
var just_released: bool
var currently_pressed: bool

func _init(_input_name: String) -> void:
	input_name = _input_name
