extends ActionState

@export var reloadingIndicator: Node3D
var reloading_time: float = 0
var reloaing_progress: float = 0
func enter():
	reloading_time = parent.current_weapon.data.reload_time
	reloaing_progress = 0
	parent.current_weapon.reload()
	if reloadingIndicator:
		reloadingIndicator.visible = true
	pass
	
func update(delta):
	reloaing_progress += delta
	reloadingIndicator.set_progress(reloaing_progress / reloading_time)
	if not parent.current_weapon.is_reloading:
		ms.exit_action()
	pass
	
func exit():
	reloadingIndicator.visible = false
	parent.current_weapon.is_reloading = false
	pass

func can_enter():
	return parent.current_weapon
