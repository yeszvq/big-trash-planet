extends State

func _ready() -> void:
	set_process(false)
	pass
	
func enter() -> void:
	parent.current_weapon.reload()
	set_process(true)
	pass

func exit() -> void:
	set_process(false)
	pass

func _process(delta: float) -> void:
	parent.current_weapon.update(delta)
	if not parent.current_weapon.is_reloading:
		transit()
	pass

func transit() -> void:
	ms.change_state("Idle")
	pass
