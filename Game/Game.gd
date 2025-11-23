class_name Game 
extends Node2D

@export var current_state: StateMachine.INPUT_STATE = StateMachine.INPUT_STATE.ACTIVE:
	set(new_state): 
		current_state = new_state
		update_map_helper.update(current_state)

var map_manager_array: Array[MapManager] 
var update_map_helper: UpdateMap

var map_manager: MapManager
var create: AppendToMapArray

func add_map_to_manager(_map_manager_array_index: int, _data: MapData, _map_manager_array: Array[MapManager]) -> void:
	map_manager = _map_manager_array.get(_map_manager_array_index)
	create = AppendToMapArray.new(_data, map_manager.map_array, map_manager)
	create.execute()

func _init() -> void:
	update_map_helper = UpdateMap.new(current_state)
	MapManagerSetUp.new(map_manager_array, MapData.new(), self)
	add_map_to_manager(0, MapData.new(), map_manager_array)

func _process(_delta: float) -> void:
	update_map_helper.update_map_with_user_input(map_manager_array, current_state, MapData.new())
