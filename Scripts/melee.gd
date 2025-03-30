extends Node3D
@export var sm : Node
@export var speed = 20
var starting_y

var health = 5

var distance_to_player

var flipped = false

func _ready():
	for state in sm.get_children():
		state.melee = self
	starting_y = position.y
		
func _physics_process(delta):
	distance_to_player = position.distance_to(GameManager.player_loc)
	position.y = clamp(starting_y, starting_y, starting_y)


func _on_area_3d_area_entered(area: Area3D) -> void:
	health -= 1
	if health == 0:
		queue_free()
	pass # Replace with function body.
