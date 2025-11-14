class_name MapManager extends Node2D

const ALL: G.DELETE_MODE = G.DELETE_MODE.ALL
const NEXT: G.DELETE_MODE = G.DELETE_MODE.NEXT
const DIRECT: G.DELETE_MODE = G.DELETE_MODE.DIRECT
const DEFAULT_MODE: G.DELETE_MODE = G.DELETE_MODE.DIRECT 

const DEFAULT_WIDTH: = float(G.DEFAULT_MAP_WIDTH)
const ACTIVE: StateMachine.INPUT_STATE = StateMachine.INPUT_STATE.ACTIVE
const INACTIVE: StateMachine.INPUT_STATE = StateMachine.INPUT_STATE.INACTIVE

##

var map_array: Array[MapObject]
var this_manager: MapManager

var state_machine: StateMachine
var player_input: PlayerInput

var data: MapData

##

var add_helper: AddMapHelper
func set_up_map(_data: MapData, _array: Array[MapObject] = [], 
_manager: MapManager = null) -> void:
	add_helper = AddMapHelper.new(_data, _array, _manager)
	add_helper.add_map_to_array()
	add_helper.add_maps_from_array_as_children()

var delete_map_helper: DeleteMapHelper
func _delete_map(_mode: G.DELETE_MODE = DEFAULT_MODE, _map: MapObject = null, _array: Array[MapObject] = []) -> void:
	delete_map_helper = DeleteMapHelper.new(_array)
	match _mode:
		ALL:
			delete_map_helper.delete_all_maps()
		NEXT:
			delete_map_helper.delete_next_map()
		DIRECT:
			delete_map_helper.delete_map(_map)

func regenerate_map() -> void:
	_delete_map(ALL, null, map_array)
	set_up_map(data, map_array, this_manager)

func create_map_data(_width: float) -> MapData:
	var _data = MapData.new(_width)
	return _data
##

func _init(_width: float = DEFAULT_WIDTH, _array: Array[MapObject] = [], 
_state_machine: StateMachine = StateMachine.new(ACTIVE), _player_input: PlayerInput = PlayerInput.new()) -> void:
	map_array = _array
	this_manager = self
	
	state_machine = _state_machine
	player_input = _player_input
	
	data = create_map_data(_width)

func _ready() -> void:
	set_up_map(data, map_array, this_manager)
 
func _process(_delta: float) -> void:
	player_input.read_input()
	
	match state_machine.current_state:
		ACTIVE:
			
			var up: bool = player_input.up.just_pressed
			var down: bool = player_input.down.just_pressed
			var enter: bool = player_input.enter.just_pressed
			var change_width: bool = false
			
			if up and !down:
				data = create_map_data(data.width+G.CHANGE_RATE) 
				change_width = true
			if down and !up:
				data = create_map_data(data.width-G.CHANGE_RATE) 
				change_width = true
			if ((change_width) and (!up or !down)):
				regenerate_map()
				change_width = false
			if enter:
				_delete_map(ALL, null, map_array)
		INACTIVE:
			pass

##
