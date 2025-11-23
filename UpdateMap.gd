class_name UpdateMap 
extends Helper

var current_state: StateMachine.INPUT_STATE
var find_first_helper: FindFirstFromMapManager
var input: PlayerInput
var delete_add_map_helper: DeleteAndAddMap

func update(_initial_state: StateMachine.INPUT_STATE) -> void:
	current_state = _initial_state

func _init(_initial_state: StateMachine.INPUT_STATE) -> void:
	input = PlayerInput.new(current_state)
	update(_initial_state)

func update_map_with_user_input(_map_manager_array: Array[MapManager], _state: StateMachine.INPUT_STATE, _data: MapData) -> void:
	if current_state == StateMachine.INPUT_STATE.ACTIVE:
		if input.any_just_pressed:
			find_first_helper = FindFirstFromMapManager.new(_map_manager_array)
			delete_add_map_helper = DeleteAndAddMap.new()
			if !input.enter.just_pressed:
				var map_data: MapData = MapData.new(_data)
				map_data.size = find_first_helper.size() + Global.CHANGE_RATE * input.find_direction_vector()
				delete_add_map_helper.regenerate_map(map_data, find_first_helper.map_array(), find_first_helper.map_manager())
			else:
				delete_add_map_helper.delete_map(DeleteAndAddMap.DELETE_MODE.ALL, find_first_helper.map_array(), null)
