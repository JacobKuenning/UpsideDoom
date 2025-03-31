extends Node3D
@export var sm : Node
@export var as3d : AnimatedSprite3D
@export var player_tracker : Node3D
@export var rotation_speed = 0.01
@export var bullet_speed = 5
@export var health = 5
@export var spread = 0.1
@export var walk_speed = 2.0
@export var distance_before_shooting = 10.0
var distance_to_player
var id = 4
var flipped = false
var vfxy = 0

var spark = preload("res://Scenes/Spark.tscn")
var explosion = preload("res://Scenes/Explosion.tscn")

var starting_y

func _ready():
	starting_y = position.y
	player_tracker.projectile_speed = bullet_speed
	player_tracker.spread = spread
	for state in sm.get_children():
		state.smart = self
		state.as3d = as3d
		state.rotation_speed = rotation_speed
		state.player_tracker = player_tracker
		state.walk_speed = walk_speed
		state.distance_before_shooting = distance_before_shooting

func _physics_process(delta: float) -> void:
	distance_to_player = position.distance_to(GameManager.player_loc)
	position.y = clamp(starting_y, starting_y, starting_y)

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
	vfx.position = Vector3(global_position.x, vfxy, global_position.z)
	GameManager.game_manager.decrement_enemy_count()
	queue_free()
	
func hit():
	var vfx = spark.instantiate()
	GameManager.vfx.add_child(vfx)
	vfx.position = Vector3(global_position.x, vfxy, global_position.z)
	pass
