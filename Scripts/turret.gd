extends Node3D
@export var sm : Node
@export var as3d : AnimatedSprite3D
@export var player_tracker : Node3D
@export var rotation_speed = 0.01
@export var bullet_speed = 5
@export var health = 5
@export var spread = 0.1

func _ready():
	player_tracker.projectile_speed = bullet_speed
	player_tracker.spread = spread
	for state in sm.get_children():
		state.turret = self
		state.as3d = as3d
		state.rotation_speed = rotation_speed
		state.player_tracker = player_tracker


func _on_area_3d_area_entered(area: Area3D) -> void:
	health -= 1
	if health == 0:
		queue_free()
	area.get_parent().queue_free()
	pass # Replace with function body.
