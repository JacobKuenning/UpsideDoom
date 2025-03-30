extends Node3D

@onready var projectiles = get_node("/root/Game/Projectiles")
@onready var player = get_node("/root/Game/Player")

var player_loc
var flipped = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	player_loc = player.position
