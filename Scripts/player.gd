extends CharacterBody3D
@export var gm : Node3D
@export var sm : Node
@export var flipcd : Timer
var flipped = false

@export var SPEED = 15
@export var ACCEL = 2
@export var FRIC = 1
@export var mouse_sens = 50

var look_dir: Vector2


func _ready():
	for state in sm.get_children(): #populating the normal and flipped states variables to be the ones set in the editor
		state.SPEED = SPEED
		state.ACCEL = ACCEL
		state.FRIC = FRIC
		state.mouse_sens = mouse_sens

func _physics_process(delta):
	pass
