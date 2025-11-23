class_name ReadPlayerInput 
extends Helper

var keystroke_out: Keystroke

func read_input(_input: String, _active: bool) -> Keystroke:
	return find_input(Keystroke.new(_input), _active)

func find_input(_keystroke_in: Keystroke, _active: bool) -> Keystroke:
	keystroke_out = _keystroke_in
	if _active:
		keystroke_out.just_pressed = Input.is_action_just_pressed(_keystroke_in.input_name)
		keystroke_out.just_released = Input.is_action_just_released(_keystroke_in.input_name)
		keystroke_out.currently_pressed = Input.is_action_pressed(_keystroke_in.input_name)
	else:
		keystroke_out.just_pressed = false
		keystroke_out.just_released = false
		keystroke_out.currently_pressed = false
	return keystroke_out
