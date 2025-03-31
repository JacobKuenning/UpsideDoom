extends Node3D

func _ready():
	for enemy in get_children():
		enemy.as3d.flip_v = true
		enemy.flipped = true
		if enemy.id == 3:
			enemy.player_tracker.position.y = 0.5
		if enemy.id == 4:
			enemy.player_tracker.position.y = 1.8
		if enemy.id == 2:
			enemy.shoot_pos = 1.7
		enemy.vfxy = 6
