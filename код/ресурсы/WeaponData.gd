extends Resource
class_name WeaponData

@export var name: String = "Шмаляло"

enum FireMode {
	SEMI,
	AUTO,
	BURST
}

@export var supported_fire_mode: Array[FireMode] = [
	FireMode.SEMI,
	FireMode.AUTO,
	FireMode.BURST
]
@export var default_fire_mode: FireMode

@export var spread: float = 0
@export var fire_rate: float = 0.2

@export var magazine_size: int = 30
@export var reload_time: float = 1.5

@export var bullet_scene: PackedScene
