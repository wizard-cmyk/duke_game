class_name InputHelper extends Helper

var state_machine: StateMachine = StateMachine.new(StateMachine.INPUT_STATE.ACTIVE)
var player_input: PlayerInput = PlayerInput.new()

var current_state:
	get:
		return state_machine.current_state
var up: bool:
	get:
		return player_input.up.just_pressed
var down: bool:
	get:
		return player_input.down.just_pressed
var right: bool:
	get:
		return player_input.right.just_pressed
var left: bool:
	get:
		return player_input.left.just_pressed
var enter: bool:
	get:
		return player_input.enter.just_pressed
var any: bool:
	get:
		return player_input.any_valid_input

func read_input() -> void:
	player_input.read_input()
