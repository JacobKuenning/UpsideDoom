extends Node3D
@export var health = 0
@export var spin_rate = 0.1
@export var timer : Timer
@export var as3d : AnimatedSprite3D
var projectile = preload("res://Scenes/enemy_projectile.tscn")
@export var projectile_speed = 10.0
var flipped = false
var id = 2
var spark = preload("res://Scenes/Spark.tscn")
var explosion = preload("res://Scenes/Explosion.tscn")
var shoot_pos = 1

func _ready():
	timer.wait_time = spin_rate
	timer.start()


func _on_area_3d_area_entered(area: Area3D) -> void:
	health -= 1
	if health == 0:
		die()
	else:
		hit()
	area.get_parent().queue_free()
	pass # Replace with function body.
	
func die():
	var vfx = explosion.instantiate()
	GameManager.vfx.add_child(vfx)
	vfx.position = global_position
	queue_free()
	
func hit():
	var vfx = spark.instantiate()
	GameManager.vfx.add_child(vfx)
	vfx.position = global_position
	pass

func _on_timer_timeout() -> void:
	rotation.y += 45
	shoot()
	pass # Replace with function body.

func shoot():
	for n in 4:
		var new_proj = projectile.instantiate()
		GameManager.projectiles.add_child(new_proj)
		new_proj.position = Vector3(global_position.x, global_position.y + shoot_pos, global_position.z)
		new_proj.rotation = Vector3(global_rotation.x, global_rotation.y + deg_to_rad(90) * n, global_rotation.z)
		new_proj.speed = projectile_speed
