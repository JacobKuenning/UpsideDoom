extends State
class_name MeleeChase
var melee
var attack_distance_thresh = 2
var player_tracker
var as3d
var rotation_speed


func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	if GameManager.flipped != melee.flipped:
		Transitioned.emit(self, "meleeidle")
	pass
	
func physics_update(_delta):
	melee.position = melee.position.move_toward(GameManager.player_loc, melee.speed * _delta)
	melee.rotation = melee.rotation.move_toward(player_tracker.rotationy, rotation_speed)

	if melee.distance_to_player < attack_distance_thresh:
		Transitioned.emit(self, "meleeattack")
	pass
