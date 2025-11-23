class_name Command 
extends RefCounted

var result

func _init() -> void:
	pass

func execute() -> void:
	if is_safe():
		_execute_helper()

func _execute_helper() -> void:
	pass

func is_safe() -> bool:
	return true
