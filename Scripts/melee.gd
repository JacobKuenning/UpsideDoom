extends Node3D
@export var sm : Node
@export var speed = 20
@export var player_tracker : Node3D
@export var rotation_speed = 0.1
@export var as3d : AnimatedSprite3D

var spark = preload("res://Scenes/Spark.tscn")
var explosion = preload("res://Scenes/Explosion.tscn")
var id = 1

var starting_y

var health = 5

var distance_to_player

var flipped = false

func _ready():
	for state in sm.get_children():
		state.melee = self
		state.as3d = as3d
		state.player_tracker = player_tracker
		state.rotation_speed = rotation_speed
	starting_y = position.y
		
func _physics_process(delta):
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
	vfx.position = global_position
	queue_free()
	
func hit():
	var vfx = spark.instantiate()
	GameManager.vfx.add_child(vfx)
	vfx.position = global_position
	pass
