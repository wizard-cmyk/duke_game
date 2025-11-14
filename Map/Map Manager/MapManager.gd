class_name MapManager extends Node2D

## Setting constants from Global scripts for easier access
# Delete Mode constants for the delete_map function.
const ALL: G.DELETE_MODE = G.DELETE_MODE.ALL 
const NEXT: G.DELETE_MODE = G.DELETE_MODE.NEXT
const DIRECT: G.DELETE_MODE = G.DELETE_MODE.DIRECT

# State Machine constants for the state machine implementation found later.
const ACTIVE: StateMachine.INPUT_STATE = StateMachine.INPUT_STATE.ACTIVE
const INACTIVE: StateMachine.INPUT_STATE = StateMachine.INPUT_STATE.INACTIVE

## Variables 
# Reference to this Manager, used for Commands and Helpers
var this_manager: MapManager 

# Array that holds MapObjects, this is what the MapManager exists to contain
var map_array: Array[MapObject] 

# Reference to data to make maps from, primarily for debugging right now
var map_data: MapData 

# For debugging
var state_machine: StateMachine 

# For debugging
var player_input: PlayerInput 

## Functions
# First, adds a MapObject to this MapManager's MapObject Array. Then, iterates through this
# array, adding each item in the array as a child to the MapManager. Uses AddMapHelper.
func add_map(_data: MapData, _array: Array[MapObject], _manager: MapManager) -> void:
	var _add_helper: AddMapHelper = AddMapHelper.new(_data, _array, _manager)
	_add_helper.add_map_to_array()
	_add_helper.add_maps_from_array_as_children()

# Exists to access functions from the DeleteMapHelper. Has one of three modes, ALL, NEXT, and
# DIRECT. The functions both remove the MapObject from the MapManager's MapObject Array, and also
# removes it as a child of the MapManager.
func delete_map(_mode: G.DELETE_MODE, _map: MapObject, _array: Array[MapObject]) -> void:
	var _delete_map: DeleteMapHelper = DeleteMapHelper.new(_array)
	match _mode:
		ALL:
			_delete_map.delete_all_maps()
		NEXT:
			_delete_map.delete_next_map()
		DIRECT:
			_delete_map.delete_map(_map)

# Function that exists to call the functions delete_map and add_map, allowing the map to be deleted
# then regenerated.
func regenerate_map(_data: MapData, _array: Array[MapObject], _manager: MapManager) -> void:
	delete_map(ALL, null, _array)
	add_map(_data, _array, _manager)

# Function that creates MapData to be passed into a MapObject.
func create_map_data(_width: float, _length: float, _monster: bool) -> MapData:
	return MapData.new(_width, _length, _monster)

## Control flow
# Initializes the MapManager by assigning variables and creating MapData for use later. Also, creates
# new StateMachine and PlayerInput objects. 
func _init(_data: MapData) -> void:
	map_array = []
	this_manager = self
	
	state_machine = StateMachine.new(ACTIVE)
	player_input = PlayerInput.new()
	
	map_data = _data.copy_data(_data)

## This stuff below is mostly for debugging.
# Adds a new MapObject when the script is first ran.
func _ready() -> void:
	add_map(map_data, map_array, this_manager)
 
# Ran every frame, currently used for debugging.
func _process(_delta: float) -> void:
	player_input.read_input()
	
	match state_machine.current_state:
		ACTIVE:
			var up: bool = player_input.up.just_pressed
			var down: bool = player_input.down.just_pressed
			var right: bool = player_input.right.just_pressed
			var left: bool = player_input.left.just_pressed
			var enter: bool = player_input.enter.just_pressed
			
			var any_valid_input_just_pressed: bool = (right or left) or (up or down)
			
			var width: float = map_data.width
			var length: float = map_data.length
			
			if right:
				width = map_data.width + G.CHANGE_RATE
			if left:
				width = map_data.width - G.CHANGE_RATE
			if up:
				length = map_data.length - G.CHANGE_RATE
			if down:
				length = map_data.length + G.CHANGE_RATE
			
			if any_valid_input_just_pressed:
				map_data = create_map_data(width, length, true)
				regenerate_map(map_data, map_array, this_manager)
			
			if enter:
				delete_map(ALL, null, map_array)
			
		INACTIVE:
			pass

##
