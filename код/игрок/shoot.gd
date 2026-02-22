extends State

func _ready() -> void:
	set_process(false)
	pass
	
func enter() -> void:
	set_process(true)
	pass

func exit() -> void:
	set_process(false)
	pass

func _process(delta: float) -> void:
	if parent.shoot_pressed:
		parent.current_weapon.shoot(
			parent.global_position, 
			parent.vector_mouse_pos_last, 
			get_tree().current_scene,
			)
	if not parent.shoot_pressed:
		transit()
	parent.current_weapon.set_trigger(parent.shoot_pressed)
	pass

func transit() -> void:
	ms.change_state("Idle")
	pass
