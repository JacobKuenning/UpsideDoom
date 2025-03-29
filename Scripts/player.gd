extends CharacterBody3D
@export var gm : Node3D
@export var sm : Node
@export var flipcd : Timer
var flipped = false
var moving = false

@export var SPEED = 15
@export var ACCEL = 2
@export var FRIC = 1
@export var FLIP_ACCEL_WIN = 0.1 #how much time after flip the player is given max acceleration
@export var mouse_sens = 50

var look_dir: Vector2


func _ready():
	for state in sm.get_children(): #populating the normal and flipped states variables to be the ones set in the editor
		state.SPEED = SPEED
		state.ACCEL = ACCEL
		state.FRIC = FRIC
		state.mouse_sens = mouse_sens
		state.FLIP_ACCEL_WIN = FLIP_ACCEL_WIN

func _physics_process(delta):
	pass
