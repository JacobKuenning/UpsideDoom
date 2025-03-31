extends Node3D

func open_door():
	for n in get_children():
		n.play(&"Unlocked")
