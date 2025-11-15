class_name Game extends Node2D

# Stores all map managers, but there will likely only be one map manager. :)
var map_manager_array: Array[MapManager] 

# Uses a helper function to create a MapManager
func set_up_map_manager(_manager_array: Array[MapManager]) -> void:
	MapManagerSetUpHelper.new(map_manager_array, Global.default_map_data, self)

func _ready() -> void:
	set_up_map_manager(map_manager_array)

var input: InputHelper

func _process(_delta: float) -> void:
	
	input = InputHelper.new()
	input.read_input()
	
	match input.state_machine.current_state:
		StateMachine.INPUT_STATE.ACTIVE:
			
			var size: Vector2
			
			var map_data_to_regen: MapData
			
			var manager: MapManager = map_manager_array.front()
			var map_array: Array[MapObject] = manager.map_array
			
			var first_map: MapObject = map_array.front()
			var dict: Dictionary
			if first_map != null:
				dict = first_map.data.dict
				size = dict.size
			
			const NEGATIVE: int = -1
			const POSITIVE: int = 1
			
			var horizontal_direction: int = 0
			var vertical_direction: int = 0
			
			var direction_vec: Vector2 = Vector2(horizontal_direction, vertical_direction)
			var change_rate: Vector2 = Vector2(Global.CHANGE_RATE, Global.CHANGE_RATE)
			
			if input.left:
				direction_vec.x = NEGATIVE
			if input.right:
				direction_vec.x = POSITIVE
			if input.up:
				direction_vec.y = NEGATIVE
			if input.down:
				direction_vec.y = POSITIVE
			if !input.any:
				direction_vec = Vector2.ZERO
			
			size += change_rate * direction_vec
			
			if input.any:
				map_data_to_regen = MapData.new([], [], size, false, true)
				MapObjectManagementHelper.new().regenerate_map(map_data_to_regen, map_array, map_manager_array.front())
			
			if input.enter:
				MapObjectManagementHelper.new().delete_map(MapObjectManagementHelper.DELETE_MODE.ALL, map_array, null)
			
		StateMachine.INPUT_STATE.INACTIVE:
			pass

##
