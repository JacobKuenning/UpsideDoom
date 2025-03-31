extends State
class_name MeleeAttack
var attack_distance_thresh = 2
var melee
var player_tracker
var as3d
var rotation_speed

@onready var attack_timer = $AttackTimer

func enter():
	attack_timer.start()
	as3d.bypass_and_shoot = true
	as3d.play(&"Attacking")
	pass
	
func exit():
	attack_timer.stop()
	as3d.bypass_and_shoot = false
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	if melee.distance_to_player > attack_distance_thresh:
		Transitioned.emit(self, "meleechase")
	melee.rotation = melee.rotation.move_toward(player_tracker.rotationy, rotation_speed)
	pass

func _on_attack_timer_timeout() -> void:
	GameManager.game_manager.decrement_health()
	pass # Replace with function body.
