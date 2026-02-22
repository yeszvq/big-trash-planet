extends interactable

var talked: bool = false
func _ready() -> void:
	lock_control = true
	pass

func interact(player):
	DialogueManager.connect("dialogue_ended", end, CONNECT_ONE_SHOT)
	DialogueManager.show_dialogue_balloon(load("res://ассеты/сценарии/Level2/InteractMEN.dialogue"), "start", [self])
	pass

func end(id):
	emit_signal("finished")
	pass
