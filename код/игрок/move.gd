extends State

const SPEED = 5.0
@export var camera: Camera3D = null

func update(delta):
	var input_dir = ms.move_input
	var iso_angle = deg_to_rad(-45)
	var direction = Vector3(
		cos(iso_angle) * input_dir.x - sin(iso_angle) * input_dir.y,
		0,
		sin(iso_angle) * input_dir.x + cos(iso_angle) * input_dir.y
	).normalized()
	if direction:
		parent.velocity.x = direction.x * SPEED
		parent.velocity.z = direction.z * SPEED
		if (!parent.aim): parent.vector_mouse_pos_last = direction
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		parent.velocity.z = move_toward(parent.velocity.z, 0, SPEED)
		ms.change_state("Idle")
	parent.move_and_slide()
	pass
