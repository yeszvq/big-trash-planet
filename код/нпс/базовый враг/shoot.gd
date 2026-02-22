extends ActionState

var fire_rate: float = 0.6
var timer_rate: float = 0

func enter():
	timer_rate = fire_rate
	var dir = (parent.player.global_position - parent.global_position).normalized()
	parent.current_weapon.shoot_press(
		parent.global_position + dir * 1, 
		dir,
		get_tree().current_scene,
	)
	if parent.current_weapon.ammo <= 0:
		parent.want_reload = true
		ms.exit_action()
	pass

func update(delta):
	timer_rate -= delta
	if timer_rate <= 0:
		ms.exit_action()
	pass
