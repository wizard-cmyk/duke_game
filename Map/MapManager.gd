class_name MapManager 
extends Node2D

var map_array: Array[Map] 
var delete_and_add_map_helper: DeleteAndAddMap

func _init(_initial_map_array: Array[Map], _data: MapData) -> void:
	delete_and_add_map_helper = DeleteAndAddMap.new()
	map_array = _initial_map_array
