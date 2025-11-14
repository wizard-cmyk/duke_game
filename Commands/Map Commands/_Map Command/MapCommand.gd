class_name MapCommand extends Command

const _NAME: String = "Map Command"

var map: MapObject

func _init(_map: MapObject = MapObject.new(MapData.new(G.DEFAULT_MAP_WIDTH))) -> void:
	name = _NAME
	
	map = _map
