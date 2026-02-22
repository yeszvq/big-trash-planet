extends CharacterBody3D
@export var player: CharacterBody3D
var distance_see: float = 20
var distance_atack: float = 6

var want_move: bool = false
var want_shoot: bool = false
var want_reload: bool = false

var current_weapon: Weapon
var hp: int = 10
var loot: PackedScene = preload("res://сцены/crap.tscn")

func _ready() -> void:
	player = GlobalVar.player
	current_weapon = Weapon.new(load("res://ассеты/ресурсы/оружие/шмаляло.tres"))
	distance_see = distance_see * distance_see
	distance_atack = distance_atack * distance_atack
	set_physics_process(true)
	pass

func _physics_process(delta: float) -> void:
	current_weapon.update(delta)
	want_move = false
	want_shoot = false
	if not player:
		return
	var vector = global_position - player.global_position
	vector.y = 0
	var distance = vector.length_squared()
	if distance <= distance_atack:
		want_shoot = true
	elif distance <= distance_see:
		want_move = true
	$ActionManager.update(delta)

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		die()

func die():
	var loot_node = loot.instantiate()
	loot_node.global_position = global_position
	get_parent().add_child(loot_node)
	queue_free()
	pass
