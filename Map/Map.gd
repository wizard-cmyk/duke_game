class_name Map 
extends Node2D

var data: MapData
var cell_instance_array: Array[CellInstance] 

func delete() -> void:
	queue_free()

func _init(_map_data_in: MapData, _instance_array: Array[CellInstance]) -> void:
	data = _map_data_in
	cell_instance_array = _instance_array
