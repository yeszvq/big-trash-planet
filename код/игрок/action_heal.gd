extends ActionState

var timer: float = 0

func enter():
	timer = 2.0
	pass
	
func update(delta):
	timer -= delta
	if timer <= 0:
		print("Вылечился")
		ms.exit_action()
	pass
	
func exit():
	
	pass
	

func can_interrupt():
	return true
	
func on_interrupt():
	ms.exit_action()
	pass

func can_enter():
	return not parent.is_blocked(BlockFlags.FlagType.HEAL)
