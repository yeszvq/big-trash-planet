extends RefCounted
class_name BlockFlags

enum FlagType{
	ALL,
	MOVE,
	SHOOT,
	AIM,
	INTERACT,
	HEAL
	}

var counters: Dictionary = {}

func _init() -> void:
	for i in FlagType.values():
		counters[i] = 0
	pass
	
func add(flag: FlagType):
	counters[flag] += 1
	pass

func release(flag: FlagType):
	counters[flag] = max(0, counters[flag] - 1)
	pass
	
func is_blocked(flag_to_check: FlagType) -> bool:
	if counters[flag_to_check] > 0:
		return true
	return false
