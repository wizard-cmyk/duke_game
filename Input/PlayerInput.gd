class_name PlayerInput 
extends Helper

const POSITIVE_DIRECTION: int = 1
const NEGATIVE_DIRECTION: int = -(POSITIVE_DIRECTION)
const NO_DIRECTION: int = 0

var direction_vector: Vector2i

var up: Keystroke:
	get:
		return _read_input(Global.UP)
var down: Keystroke:
	get:
		return _read_input(Global.DOWN)
var right: Keystroke:
	get:
		return _read_input(Global.RIGHT)
var left: Keystroke:
	get:
		return _read_input(Global.LEFT)
var enter: Keystroke:
	get:
		return _read_input(Global.ENTER)
var any_just_pressed: bool:
	get:
		return (right.just_pressed or left.just_pressed or up.just_pressed or down.just_pressed or enter.just_pressed) and (is_active())
var current_state: StateMachine.INPUT_STATE:
	get:
		return state_machine.current_state

var state_machine: StateMachine 
var player_input: ReadPlayerInput

func _read_input(_input_string: String, _input_object: ReadPlayerInput = player_input, _is_active: bool = is_active()) -> Keystroke:
	return _input_object.read_input(_input_string, _is_active)

func find_direction_vector() -> Vector2i:
	if left.just_pressed and !right.just_pressed:
		direction_vector.x = NEGATIVE_DIRECTION
	elif right.just_pressed and !left.just_pressed:
		direction_vector.x = POSITIVE_DIRECTION
	else:
		direction_vector.x = NO_DIRECTION
	
	if up.just_pressed and !down.just_pressed:
		direction_vector.y = NEGATIVE_DIRECTION
	elif down.just_pressed and !up.just_pressed:
		direction_vector.y = POSITIVE_DIRECTION
	else:
		direction_vector.y = NO_DIRECTION
	
	return direction_vector

func is_active(_current_state: StateMachine.INPUT_STATE = current_state) -> bool:
	return (_current_state == StateMachine.INPUT_STATE.ACTIVE)

func _init(_initial_state: StateMachine.INPUT_STATE) -> void:
	state_machine = StateMachine.new(StateMachine.INPUT_STATE.ACTIVE)
	player_input = ReadPlayerInput.new()
	state_machine.switch_state(_initial_state)
