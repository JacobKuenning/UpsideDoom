extends CharacterBody3D
var projectile = preload("res://Scenes/player_projectile.tscn")
@export var gm : Node3D
@export var sm : Node
@export var flipcd : Timer
@export var guntimer : Timer
var flipped = false
var moving = false
var can_shoot = true

@export var SPEED = 15
@export var ACCEL = 2
@export var FRIC = 1
@export var FLIP_ACCEL_WIN = 0.1 #how much time after flip the player is given max acceleration
@export var flip_cooldown = 1
@export var mouse_sens = 50
@export var projectile_speed = 40
@export var time_between_shots = 0.2

var look_dir: Vector2

func _ready():
	for state in sm.get_children(): #populating the normal and flipped states variables to be the ones set in the editor
		state.SPEED = SPEED
		state.ACCEL = ACCEL
		state.FRIC = FRIC
		state.mouse_sens = mouse_sens
		state.FLIP_ACCEL_WIN = FLIP_ACCEL_WIN
	flipcd.wait_time = flip_cooldown
	guntimer.wait_time = time_between_shots
	

func _physics_process(delta):
	pass
	
func _input(event: InputEvent): #handle mouse motion and other button inputs
	if event.is_action_pressed("shoot") and can_shoot:
		fire_weapon()
		
func fire_weapon():
	can_shoot = false
	var new_proj = projectile.instantiate()
	gm.projectiles.add_child(new_proj)
	new_proj.position = position
	new_proj.rotation.y = rotation.y
	new_proj.speed = projectile_speed
	guntimer.start()


func _on_area_3d_area_entered(area: Area3D) -> void:
	GameManager.game_manager.decrement_health()
	area.get_parent().queue_free() #destroy bullets that touch you
	pass # Replace with function body.


func _on_gun_timer_timeout() -> void:
	can_shoot = true
	print("timer")
	pass # Replace with function body.
