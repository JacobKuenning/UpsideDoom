extends Node3D

@onready var projectiles = get_node("/root/Game/Projectiles")
@onready var player = get_node("/root/Game/Player")
@onready var vfx = get_node("/root/Game/VFX")
var player_health = 4

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	GameManager.player_loc = player.position
	GameManager.game_manager = self
	GameManager.projectiles = projectiles
	GameManager.vfx = vfx
	
func decrement_health():
	GameManager.player_health -= 1	
