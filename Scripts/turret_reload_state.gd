extends State
class_name TurretReloadState

var turret
var as3d
var player_tracker
var rotation_speed
@export var reload_time = 2

func enter():
	await get_tree().create_timer(reload_time).timeout
	Transitioned.emit(self, "searchstate")
	pass

func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	turret.rotation = turret.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	pass
