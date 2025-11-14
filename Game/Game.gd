class_name Game extends Node2D

const DEFAULT_WIDTH: = float(G.DEFAULT_MAP_WIDTH)
const DEFAULT_LENGTH: = float(G.DEFAULT_MAP_LENGTH)

var map_manager: MapManager

func _init() -> void:
	set_up_map_manager()

var map_in = MapData.new(DEFAULT_WIDTH, DEFAULT_LENGTH, true)

func set_up_map_manager() -> void:
	map_manager = MapManager.new(map_in)
	add_child(map_manager)
