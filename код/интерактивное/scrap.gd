extends interactable

func _ready() -> void:
	lock_control = false
	
func interact(player):
	player.add_scrap(1)
	emit_signal("finished")
	queue_free()
	pass
