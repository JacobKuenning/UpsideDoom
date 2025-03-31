extends State
class_name MeleeIdle
var melee
var player_tracker
var as3d
var rotation_speed


func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	if GameManager.flipped == melee.flipped:
		Transitioned.emit(self, "meleechase")
	
func physics_update(_delta):
	melee.rotation = melee.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	pass
