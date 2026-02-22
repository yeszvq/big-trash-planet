extends ActionState

func enter():
	var vector_dir = parent.get_aim_direction()
	parent.current_weapon.shoot_press(
		parent.global_position + vector_dir * 1, 
		vector_dir, 
		get_tree().current_scene,
	)
	pass

func update(delta):
	if not parent.shoot_pressed:
		ms.exit_action()
		return

	var vector_dir = parent.get_aim_direction()
	parent.current_weapon.shoot_press(
		parent.global_position + vector_dir * 1, 
		vector_dir, 
		get_tree().current_scene,
	)
	pass
	
func can_enter():
	return (
		parent.current_weapon 
		and not parent.is_blocked(BlockFlags.FlagType.SHOOT)
	)
