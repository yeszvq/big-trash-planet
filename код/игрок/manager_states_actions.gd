extends ManagerStates

var tt = null
var control_locked: bool = false

func _ready():
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()
	
func change_state(state):
	current_state.exit()
	current_state = find_child(state) as State
	previous_state = current_state
	current_state.enter()
