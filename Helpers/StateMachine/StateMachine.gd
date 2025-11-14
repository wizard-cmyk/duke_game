class_name StateMachine extends Helper
enum INPUT_STATE {
ACTIVE,
INACTIVE,
UNSET }

var previous_state: INPUT_STATE = INPUT_STATE.UNSET
var current_state: INPUT_STATE = INPUT_STATE.UNSET

func switch_state(_new_state: INPUT_STATE) -> INPUT_STATE:
	current_state = _new_state
	previous_state = current_state
	return current_state

func _init(initial_state: INPUT_STATE) -> void:
	switch_state(initial_state)
