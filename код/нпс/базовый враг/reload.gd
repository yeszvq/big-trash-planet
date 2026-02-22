extends ActionState

func enter():
	parent.current_weapon.reload()
	pass
	
func update(delta):
	if not parent.current_weapon.is_reloading:
		ms.exit_action()
	pass

func exit():
	parent.current_weapon.is_reloading = false
	pass
	
func can_enter():
	return parent.current_weapon
