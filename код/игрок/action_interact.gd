extends ActionState

func enter():
	var obj = parent.current_interactable
	if obj.lock_control:
		parent.block(BlockFlags.FlagType.ALL)
	obj.connect("finished", transit, CONNECT_ONE_SHOT)
	obj.interact(parent)
	pass

func transit():
	parent.unblock(BlockFlags.FlagType.ALL)
	ms.exit_action()
	pass
	
func can_enter():
	return (
		parent.current_interactable 
		and not parent.is_blocked(BlockFlags.FlagType.INTERACT)
		)
