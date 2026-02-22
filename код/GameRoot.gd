extends Node3D
@export var current_level: Node3D = null

func _ready() -> void:
	Events.connect("try_change_level", change_level)
	current_level = $Level
	pass
	
func change_level(level):
	if not can_change_level():
		return
	Events.emit_signal("change_level_started")
	
	if current_level:
		current_level.queue_free()
		await current_level.tree_exited
		current_level = null

	var level_scene = AssetData.get_level(level)
	current_level = load(level_scene).instantiate()
	add_child(current_level)
	
	await current_level.init_finished
	
	var spawn_point = current_level.get_spawn_point()
	$player.global_position = spawn_point.global_position
	
	
	Events.emit_signal("change_level_finished")
	pass

func can_change_level():
	return true
	
