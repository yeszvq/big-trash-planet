extends StaticBody3D

var loot = preload("res://сцены/crap.tscn")

var hp = 10
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		die()

func die():
	var loot_node = loot.instantiate()
	loot_node.global_position = global_position
	get_parent().add_child(loot_node)
	queue_free()
	pass
