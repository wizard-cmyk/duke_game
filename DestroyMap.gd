class_name DestroyMap 
extends MapCommand

func _execute_helper() -> void:
	map.delete()

func is_safe() -> bool:
	return (map != null)
