extends State
class_name PlayerFlipped
@export var player : CharacterBody3D
@export var camcon : Node3D

var SPEED
var ACCEL
var FRIC
var look_dir: Vector2

var mouse_sens

var can_flip = false

func enter():
	print("flipped state entered")
	camcon.rotation_degrees.z = 180 
	can_flip = false
	player.flipcd.start()
	
func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (player.transform.basis * Vector3(-input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		accelerate(direction)
		print(direction)
	else:
		apply_friction()	
	
	_rotate_camera(_delta)
	player.move_and_slide()	

func accelerate(direction):
	player.velocity = player.velocity.move_toward(direction * SPEED, ACCEL)

func apply_friction():
	player.velocity = player.velocity.move_toward(Vector3.ZERO,FRIC)

func _input(event: InputEvent): #handle mouse motion and other button inputs
		if event is InputEventMouseMotion: 
			look_dir = event.relative * 0.01 
		if event.is_action_pressed("flip") and can_flip:
			Transitioned.emit(self, "normal") #change state
	
func _rotate_camera(delta: float):
	var input = Input.get_vector("look_left", "look_right", "NULL", "NULL") #NULL because we only need the first two fields
	look_dir += input
	player.rotation.y -= -look_dir.x * mouse_sens * delta
	look_dir = Vector2.ZERO


func _on_flip_cooldown_timeout() -> void:
	can_flip = true
	pass # Replace with function body.
