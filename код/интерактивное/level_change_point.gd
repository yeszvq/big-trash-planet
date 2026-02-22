extends interactable

@export var path_to_level: AssetData.Level

func interact(player):
	Events.emit_signal("try_change_level", path_to_level)
	pass
