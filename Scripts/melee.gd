extends Node3D
@export var sm : Node
@export var speed = 20

var distance_to_player

var flipped = false

func _ready():
	for state in sm.get_children():
		state.melee = self
		
func _physics_process(delta):
	distance_to_player = position.distance_to(GameManager.player_loc)
