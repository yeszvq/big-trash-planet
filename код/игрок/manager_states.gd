extends ManagerStates

signal state_changed(name_state)
var move_input: Vector2 = Vector2.ZERO
var aim_input: bool = false


func _ready():
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()
	
func change_state(state):
	current_state.exit()
	current_state = find_child(state) as State
	previous_state = current_state
	current_state.enter()
	emit_signal("state_changed", state)

func _physics_process(delta: float) -> void:
	if parent.is_blocked(BlockFlags.FlagType.ALL):
		move_input = Vector2.ZERO
		return
	move_input = Input.get_vector("left", "right", "up", "down")
	current_state.update(delta)
	pass
