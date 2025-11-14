class_name Command extends RefCounted

var result
var name: String = "Default Command"

func _init() -> void:
	pass

func execute() -> void:
	if is_safe():
		_execute_helper()
		_print()

func _execute_helper() -> void:
	pass

func is_safe() -> bool:
	return true

func _print() -> void:
	print("Executing: " + name)

func undo() -> void:
	pass
