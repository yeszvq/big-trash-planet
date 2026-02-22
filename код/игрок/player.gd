extends CharacterBody3D
class_name Player
signal scrap_changed(amount)

enum ActionType {
	ALL,
	MOVE,
	HEAL,
	SHOOT,
	RELOAD,
	INTERACT,
	AIM
}


@onready var visualBody: Node3D = $visualBody
@onready var camera: Camera3D = $Camera3D
var mouse_pos_last: Vector3
var vector_mouse_pos_last: Vector3
var ground_plane = Plane(Vector3.UP, 1.0)
var aim: bool = false

var shoot_pressed: bool = false
var want_shoot: bool = false

var want_reload: bool = false
var want_heal: bool = false
var control_locked: int = 0

var current_interactable: Node = null
var want_interact: bool = false

var scrap: int = 0

var current_weapon: Weapon
var flags: BlockFlags

var hp: int = 10

func _ready() -> void:
	flags = BlockFlags.new()
	current_weapon = Weapon.new(load("res://ассеты/ресурсы/оружие/шмаляло.tres"))
	Events.connect("change_level_started", change_level_start)
	Events.connect("change_level_finished", change_level_finished)
	GlobalVar.player = self
	Events.emit_signal("player_ready")
	pass

func _process(delta: float) -> void:
	current_weapon.update(delta)
	$ActionManager.update(delta)
	if aim:
		get_mouse_position()
		rotate_to_mouse()
	pass

func get_mouse_position():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_target = camera.project_ray_normal(mouse_pos) * 50

	var intersec = ground_plane.intersects_ray(ray_origin, ray_target)
	mouse_pos_last = Vector3(intersec.x, self.position.y, intersec.z)
	
	vector_mouse_pos_last = (mouse_pos_last - global_position).normalized()
	return mouse_pos_last

func rotate_to_mouse():
	var look_target = mouse_pos_last
	look_target.y = global_position.y
	visualBody.look_at(look_target, Vector3.UP)
	pass

func _input(event: InputEvent):
	if is_blocked(BlockFlags.FlagType.ALL):
		return
	if event.is_action_pressed("rm"):
		aim = true
	if event.is_action_released("rm"):
		aim = false
	if event.is_action_pressed("lm"): 
		want_shoot = true
		shoot_pressed = true
	if event.is_action_released("lm"):
		shoot_pressed = false
	if event.is_action_released("r"): 
		want_reload = true
	if event.is_action_released("space"): 
		want_heal = true
	if event.is_action_released("e"):
		want_interact = true
	pass

func interact_object_detected(body: Node3D):
	current_interactable = body
	pass # Replace with function body.

func interact_object_undetected(body: Node3D):
	if current_interactable == body:
		current_interactable = null

func add_scrap(amount):
	scrap += amount
	emit_signal("scrap_changed", scrap)

func change_level_start():
	block(BlockFlags.FlagType.ALL)
	pass
	
func change_level_finished():
	unblock(BlockFlags.FlagType.ALL)
	pass

func is_blocked(flag_to_check) -> bool:
	return flags.is_blocked(flag_to_check)

func block(flag: BlockFlags.FlagType):
	flags.add(flag)
	
func unblock(flag: BlockFlags.FlagType):
	flags.release(flag)

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		die()

func die():
	Events.emit_signal("try_change_level", AssetData.Level.HUB)
	pass

func get_aim_direction():
	return -visualBody.global_transform.basis.z
