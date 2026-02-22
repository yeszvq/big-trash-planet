extends RefCounted
class_name Weapon

var data: WeaponData
var ammo: int
var fire_timer: float = 0
var is_reloading: bool = false
var reload_timer: float = 0
#var has_shot_this_press: bool = false

var burst_active: bool = false
var burst_shot_amount: int = 0
var burst_dir: Vector3
var burst_origin: Vector3
var burst_world: Node
var current_fire_mode: WeaponData.FireMode


func _init(_data: WeaponData) -> void:
	data = _data
	ammo = data.magazine_size
	current_fire_mode = data.default_fire_mode
	pass

func update(delta: float):
	if reload_timer > 0:
		reload_timer -= delta
		if reload_timer <= 0:
			is_reloading = false
			ammo = data.magazine_size
	if fire_timer > 0:
		fire_timer -= delta
	if burst_active:
		if ammo <= 0:
			stop_burst()
			return
		if fire_timer <= 0:
			spawn_bullet(burst_origin, burst_dir, burst_world)
			burst_shot_amount -= 1
			if burst_shot_amount <= 0:
				stop_burst()
	pass

func shoot_press(origin: Vector3, dir: Vector3, world: Node):
	if not can_shoot():
		return
	match current_fire_mode:
		data.FireMode.SEMI:
			spawn_bullet(origin, dir, world)
		data.FireMode.AUTO:
			spawn_bullet(origin, dir, world)
		data.FireMode.BURST:
			if not burst_active:
				burst(origin, dir, world)

func shoot_hold(origin: Vector3, dir: Vector3, world: Node):
	if current_fire_mode == data.FireMode.AUTO and can_shoot():
		spawn_bullet(origin, dir, world)
	pass

func shoot_realese():
	
	pass

func burst(origin: Vector3, dir: Vector3, world: Node):
	burst_active = true
	burst_shot_amount = 3
	burst_origin = origin
	burst_dir = dir
	burst_world = world
	spawn_bullet(origin, dir, world)
	pass

func spawn_bullet(origin: Vector3, dir: Vector3, world: Node):
	var final_dir = dir
	if data.spread > 0:
		var max_angle = data.spread * 0.2
		var random_angle = randf_range(-max_angle, max_angle)
		final_dir = dir.rotated(Vector3.UP, random_angle).normalized()

	var bullet = data.bullet_scene.instantiate()
	bullet.global_position = origin	
	bullet.dir = final_dir
	world.add_child(bullet)
	fire_timer = data.fire_rate
	ammo -= 1
	print("выстрел ", str(ammo))
	pass

func can_shoot():
	return (
		not is_reloading 
		and fire_timer <= 0 
		and ammo > 0
	)

func reload():
	if not is_reloading:
		is_reloading = true
		reload_timer = data.reload_time
		stop_burst()
	pass

#func set_trigger(press: bool):
#	has_shot_this_press = press
#	pass
	
func stop_burst():
	burst_active = false
	burst_shot_amount = 0
	pass

func switch_fire_mode():
	var i = data.supported_fire_mode.find(current_fire_mode)
	i = (i + 1) % data.supported_fire_mode.size()
	current_fire_mode = data.supported_fire_mode[i]
	stop_burst()
	pass
