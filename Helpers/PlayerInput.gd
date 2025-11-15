class_name PlayerInput extends Helper

var up: Keystroke = Keystroke.new(Global.UP)
var down: Keystroke = Keystroke.new(Global.DOWN)
var right: Keystroke = Keystroke.new(Global.RIGHT)
var left: Keystroke = Keystroke.new(Global.LEFT)
var enter: Keystroke = Keystroke.new(Global.ENTER)

var any_valid_input: bool = false

func read_input() -> void:
	up = find_input(Keystroke.new(Global.UP))
	down = find_input(Keystroke.new(Global.DOWN))
	right = find_input(Keystroke.new(Global.RIGHT))
	left = find_input(Keystroke.new(Global.LEFT))
	enter = find_input(Keystroke.new(Global.ENTER))
	
	any_valid_input = (right or left) or (up or down)

func find_input(_keystroke_in: Keystroke) -> Keystroke:
	var _keystroke_out: Keystroke = _keystroke_in
	_keystroke_out.just_pressed = Input.is_action_just_pressed(_keystroke_in.type)
	_keystroke_out.just_released = Input.is_action_just_released(_keystroke_in.type)
	_keystroke_out.currently_pressed = Input.is_action_pressed(_keystroke_in.type)
	return _keystroke_out
