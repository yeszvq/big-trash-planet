extends Node
@onready var parent: Player = get_parent()
var current_action: ActionState = null

func update(delta):
	if current_action:
		current_action.update(delta)
		return
	if parent.want_shoot:
		parent.want_shoot = false
		start_action("Shoot")
		return
	if parent.want_reload:
		parent.want_reload = false
		start_action("Reload")
		return
	if parent.want_heal:
		parent.want_heal = false
		start_action("Heal")
		return
	if parent.want_interact:
		parent.want_interact = false
		start_action("Interact")
		return
	pass

func can_action():
	return current_action == null and not parent.is_blocked(BlockFlags.FlagType.ALL)

func start_action(action: String):
	if not can_action():
		return
	
	var state = find_child(action) as ActionState
	if not state.can_enter():
		return
	
	current_action = state 
	current_action.enter()
	pass
	
func interrupt_action():
	if not current_action:
		return
	
	if current_action.can_interrupt():
		current_action.on_interrupt()
	pass

func exit_action():
	current_action.exit()
	current_action = null
	pass
