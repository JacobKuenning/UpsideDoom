extends State
class_name SmartWalkState

var smart
@export var as3d : AnimatedSprite3D
var player_tracker
var rotation_speed
var rotationxy : Vector2
var walk_speed
var distance_before_shooting

func enter():
	pass

func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	smart.rotation = smart.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	
	smart.position = smart.position.move_toward(Vector3(GameManager.player_loc.x, 0, GameManager.player_loc.z), walk_speed)
	if smart.distance_to_player < distance_before_shooting:
		Transitioned.emit(self, "shootstate")
	pass
 
