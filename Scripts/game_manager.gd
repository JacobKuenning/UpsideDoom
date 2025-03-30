extends Node3D

@onready var projectiles = get_node("/root/Game/Projectiles")
@onready var player = get_node("/root/Game/Player")

func _ready():
	pass

func _physics_process(delta: float) -> void:
	GameManager.player_loc = player.position
