extends State
class_name MeleeChase
var melee
var attack_distance_thresh = 2

func enter():
	print("melee chase state entered")
	pass
	
func exit():
	pass
	
func update(_delta):
	if GameManager.flipped != melee.flipped:
		Transitioned.emit(self, "meleeidle")
	pass
	
func physics_update(_delta):
	melee.position = melee.position.move_toward(GameManager.player_loc, melee.speed * _delta)
	
	if melee.distance_to_player < attack_distance_thresh:
		Transitioned.emit(self, "meleeattack")
	pass
