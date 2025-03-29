extends CharacterBody3D
@export var gm : Node3D
const SPEED = 8
const ACCEL = 2
const FRIC = 1
var look_dir: Vector2

@export var mouse_sens = 50

func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		accelerate(direction)
	else:
		apply_friction()	
	
	_rotate_camera(delta)
	move_and_slide()	

func accelerate(direction):
	velocity = velocity.move_toward(direction * SPEED, ACCEL)

func apply_friction():
	velocity = velocity.move_toward(Vector3.ZERO,FRIC)

func _input(event: InputEvent): #handle mouse motion for looking left and right
		if event is InputEventMouseMotion: look_dir = event.relative * 0.01 
	
func _rotate_camera(delta: float):
		var input = Input.get_vector("look_left", "look_right", "NULL", "NULL") #NULL because we only need the first two fields
		look_dir += input
		rotation.y -= look_dir.x * mouse_sens * delta
		look_dir = Vector2.ZERO
