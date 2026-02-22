extends Node

enum Level {
	HUB,
	LEVEL1
}

var paths_to_levels: Dictionary = {
	Level.HUB: "res://сцены/уровни/hub.tscn",
	Level.LEVEL1: "res://сцены/уровни/level1.tscn"
}

func get_level(name_enum):
	return paths_to_levels[name_enum]
