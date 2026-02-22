extends State

@export var marker: CSGMesh3D

func update(delta):
	if ms.move_input != Vector2.ZERO:
		if not parent.is_blocked(BlockFlags.FlagType.MOVE):
			ms.change_state("Move")	
	pass
