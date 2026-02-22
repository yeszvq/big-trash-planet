extends Node
class_name State

@onready var parent: Player = get_parent().get_parent()
@onready var ms: ManagerStates = get_parent()
	
func enter() -> void:
	pass

func update(delta):
	
	pass

func exit() -> void:
	pass
