extends CharacterBody3D

var dir: Vector3 = Vector3.ZERO
@export var speed: float = 88.0
@export var damage: int = 1
var timer_life: float = 0.5

func _physics_process(delta: float) -> void:
	timer_life -= delta
	if timer_life <= 0:
		queue_free()
		return

	var collision = move_and_collide(dir * speed * delta)
	
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("take_damage"):
			collider.take_damage(damage)
		queue_free()
	pass
