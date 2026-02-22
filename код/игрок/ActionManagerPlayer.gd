extends ActionManager

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
