extends Node3D

@onready var projectiles = $Projectiles
@onready var player = get_node("/root/Player")
var player_loc
var flipped = false

func _ready():
	pass

func _physics_process(delta: float) -> void:
	player.loc = player.position
