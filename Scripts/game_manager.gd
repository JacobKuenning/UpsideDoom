extends Node3D

@onready var projectiles = get_node("/root/Game/Projectiles")
@onready var player = get_node("/root/Game/Player")
@onready var vfx = get_node("/root/Game/VFX")
@export var enemies : Node3D
@export var enemies_ceil : Node3D
@export var exit_area : Node3D
@export var door : Node3D
var asp

var player_health = 4

func _ready():
	GameManager.player_health = 35
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	for n in enemies.get_children():
		GameManager.enemy_count += 1
	
	for n in enemies_ceil.get_children():
		GameManager.enemy_count +=1

func _physics_process(delta: float) -> void:
	GameManager.player_loc = player.position
	GameManager.game_manager = self
	GameManager.projectiles = projectiles
	GameManager.vfx = vfx
	
func decrement_health():
	GameManager.player_health -= 1	
	if GameManager.player_health <= 0:
		scene_swap("res://control.tscn")
		
func decrement_enemy_count():
	GameManager.enemy_count -= 1
	if GameManager.enemy_count <= 0:
		open_next_room()
	if enemies.get_child_count() == 0 and enemies_ceil.get_child_count() == 0:
		open_next_room()
	
func open_next_room():
	exit_area.active = true
	door.open_door()
	pass

func scene_swap(scene):
	call_deferred("real_swap", scene)

func real_swap(scene):
	get_tree().change_scene_to_file(scene)
