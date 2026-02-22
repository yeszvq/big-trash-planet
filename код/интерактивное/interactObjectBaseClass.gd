extends Node3D
class_name interactable
signal finished

@export var lock_control: bool = false

func interact(player):
	emit_signal("finished")
