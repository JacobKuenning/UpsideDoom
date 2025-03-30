extends State
class_name TurretSearchState

var turret
@export var as3d : AnimatedSprite3D
var player_tracker
var rotation_speed
var rotationxy : Vector2

func enter():
	pass

func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	turret.rotation = turret.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	if as3d.animation == "back":
		Transitioned.emit(self, "shootstate")
	pass
 
