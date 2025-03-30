extends Node3D
var rotationy
var projectile_speed
var projectile = preload("res://Scenes/enemy_projectile.tscn")
var spread

func _physics_process(delta):
	look_at(GameManager.player_loc, Vector3.UP)
	rotationy = Vector3(0, global_rotation.y, 0)

func fire_weapon():
	var new_proj = projectile.instantiate()
	GameManager.projectiles.add_child(new_proj)
	new_proj.position = global_position
	new_proj.rotation = global_rotation
	apply_spread(new_proj)
	new_proj.speed = projectile_speed
	
func apply_spread(new_proj):
	new_proj.rotation.x += randf_range(-spread,spread)
	new_proj.rotation.z += randf_range(-spread,spread)
	new_proj.rotation.y += randf_range(-spread,spread)
	
