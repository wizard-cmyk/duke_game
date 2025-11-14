@icon("res://Sprites/Map Icon/MapIcon.png")
class_name MapObject extends Node2D

var data: MapData

func _init(_map_data_in: MapData) -> void:
	data = _map_data_in
