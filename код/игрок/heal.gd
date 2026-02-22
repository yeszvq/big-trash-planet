extends State
@export var sfm: Node = null

var timer: Timer = null

func _ready() -> void:
	timer = Timer.new()
	pass
	
func enter() -> void:
	sfm.control_locked = true
	timer.start(2)
	print("лечусь")
	await timer.timeout
	print("вылечился")
	exit()
	pass

func exit() -> void:
	sfm.control_locked = false
	pass

func transit() -> void:
	pass
