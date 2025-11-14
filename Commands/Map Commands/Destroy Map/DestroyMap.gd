class_name DestroyMap extends MapCommand

const NAME: String = "Destroy Map"

func _init(_map: MapObject) -> void:
	name = NAME
	
	map = _map

func _execute_helper() -> void:
	if map != null:
		map.queue_free()

func is_safe() -> bool:
	match map:
		null:
			return G.FAIL
		MapObject:
			return G.SUCCESS
		_: 
			return G.SUCCESS
