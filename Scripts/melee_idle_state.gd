extends State
class_name MeleeIdle
var melee

func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	if GameManager.flipped == melee.flipped:
		Transitioned.emit(self, "meleechase")
	
func physics_update(_delta):
	pass
