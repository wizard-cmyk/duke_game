class_name PlayerInput extends Helper

const UP: String = G.UP
const DOWN: String = G.DOWN
const ENTER: String = G.ENTER

const ERROR: String = "ERROR!"

var up: Keystroke = Keystroke.new(UP)
var down: Keystroke = Keystroke.new(DOWN)
var enter: Keystroke = Keystroke.new(ENTER)

func read_input() -> void:
	up = find_input(Keystroke.new(UP))
	down = find_input(Keystroke.new(DOWN))
	enter = find_input(Keystroke.new(ENTER))
	

func find_input(_keystroke_in: Keystroke = Keystroke.new(ERROR)) -> Keystroke:
	var _keystroke_out: Keystroke = _keystroke_in
	_keystroke_out.just_pressed = Input.is_action_just_pressed(_keystroke_in.type)
	_keystroke_out.just_released = Input.is_action_just_released(_keystroke_in.type)
	_keystroke_out.currently_pressed = Input.is_action_pressed(_keystroke_in.type)
	return _keystroke_out
