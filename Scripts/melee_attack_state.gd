extends State
class_name MeleeAttack
var attack_distance_thresh = 2
var melee
@onready var attack_timer = $AttackTimer

func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	if melee.distance_to_player > attack_distance_thresh:
		Transitioned.emit(self, "meleechase")
	pass
