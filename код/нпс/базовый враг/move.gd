extends ActionState

var speed: float = 2

func update(delta):
	if parent.want_shoot:
		ms.exit_action()
		return
	var dir = (parent.player.global_position - parent.global_position).normalized()
	dir.y = 0
	parent.velocity = dir * speed
	parent.move_and_slide()
	pass
	
func can_enter():
	return true
	
func exit():
	parent.velocity = Vector3.ZERO
	pass
	
