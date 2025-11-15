class_name Command extends RefCounted

@export var ignore_print: bool = false

var result
var name: String = "Default Command"

func _init() -> void:
	pass

func execute() -> void:
	if is_safe():
		_execute_helper()
		_print_success()
	else:
		_print_fail()

func _execute_helper() -> void:
	pass

func is_safe() -> bool:
	return true

func _print_success() -> void:
	if !ignore_print:
		print("Executing " + name)

func _print_fail() -> void:
	if !ignore_print:
		print("Failed to execute " + name)

func undo() -> void:
	pass
