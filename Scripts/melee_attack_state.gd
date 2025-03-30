extends State
class_name MeleeAttack
var attack_distance_thresh = 2
var melee
@onready var attack_timer = $AttackTimer

func enter():
	attack_timer.start()
	pass
	
func exit():
	attack_timer.stop()
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	if melee.distance_to_player > attack_distance_thresh:
		Transitioned.emit(self, "meleechase")
	pass

func _on_attack_timer_timeout() -> void:
	GameManager.game_manager.decrement_health()
	pass # Replace with function body.
