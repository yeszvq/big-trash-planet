extends Control

@export var player: CharacterBody3D = null

func _ready() -> void:
	if not GlobalVar.player:
		Events.connect("player_ready", set_settings)
	else:
		set_settings()
	pass

func set_settings():
	player = GlobalVar.player
	player.connect("scrap_changed", update_label)
	
func update_label(amount):
	$Label.text = "Скрапа: " + str(amount)
	pass
