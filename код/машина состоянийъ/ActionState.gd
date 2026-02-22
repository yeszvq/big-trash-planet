extends Node
class_name ActionState

@onready var parent: CharacterBody3D = get_parent().get_parent()
@onready var ms = get_parent()

func enter():

	pass
	
func update(delta):
	
	pass
	
func exit():
	
	pass
	
func stop():
	
	pass

func can_enter():
	
	return true

func on_interrupt():
	
	pass
	
func can_interrupt():
	return false
