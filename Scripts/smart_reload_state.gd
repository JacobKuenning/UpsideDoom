extends State
class_name SmartReloadState

var smart
var as3d
var player_tracker
var rotation_speed
var walk_speed
var distance_before_shooting

@export var reload_time = 2

func enter():
	await get_tree().create_timer(reload_time).timeout
	Transitioned.emit(self, "walkstate")
	pass

func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	smart.rotation = smart.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	if smart.distance_to_player > distance_before_shooting:
		smart.position = smart.position.move_toward(Vector3(GameManager.player_loc.x, 0, GameManager.player_loc.z), walk_speed)
	pass
