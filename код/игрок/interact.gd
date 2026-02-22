extends State

func _ready() -> void:
	set_process(false)
	pass
	
func enter() -> void:
	var obj = parent.current_interactable
	if obj.lock_control:
		parent.lock_control()
	obj.connect("finished", transit, CONNECT_ONE_SHOT)
	obj.interact(parent)
	pass

func exit() -> void:
	
	pass

func transit() -> void:
	parent.unlock_control()
	ms.change_state("Idle")
	pass
