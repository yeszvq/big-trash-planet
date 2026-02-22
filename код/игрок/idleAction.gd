extends State

@export var ManagerState: ManagerStates
var current_state: String = "Idle"

func _ready() -> void:
	set_process(false)
	
func _process(delta: float):
	#if parent.want_shoot:
		#parent.want_shoot = false
		#if parent.can_shoot():
			#ms.change_state("Shoot")
			#return
	#if parent.want_reload:
		#parent.want_reload = false
		#if parent.can_reload():
			#ms.change_state("Reload")
			#return
	#if parent.want_heal:
		#parent.want_heal = false
		#if parent.can_heal():
			## это было для быстрой проверки parent.current_weapon.switch_fire_mode()
			#ms.change_state("Heal")
	#if parent.want_interact:
		#parent.want_interact = false
		#if parent.can_interact():
			#ms.change_state("Interact")
		
	pass

func enter() -> void:
	set_process(true)
	pass

func exit() -> void:
	set_process(false)
	pass
