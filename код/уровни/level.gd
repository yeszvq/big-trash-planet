extends Node
class_name Level
@export var spawn_point: Marker3D
signal init_finished


func _ready() -> void:
	await get_tree().process_frame
	emit_signal("init_finished")
	pass

func get_spawn_point():
	return spawn_point
