extends Node
class_name ActionManager

@onready var parent: CharacterBody3D = get_parent()
var current_action: ActionState = null

func update(delta):

	pass

func can_action():
	return current_action == null

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
