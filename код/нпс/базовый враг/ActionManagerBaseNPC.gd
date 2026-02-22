extends ActionManager

func update(delta):
	if current_action:
		current_action.update(delta)
	if parent.want_reload:
		parent.want_reload = false
		start_action("Reload")
	if parent.want_shoot:
		parent.want_shoot = false
		start_action("Shoot")
	if parent.want_move:
		parent.want_move = false
		start_action("Move")
	pass
	
func can_action():
	return current_action == null
