extends Node3D

func set_progress(value: float):
	$SubViewport/Control/TextureProgressBar.value = value * 100
	pass
