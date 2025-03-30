extends State
class_name TurretShootState

var turret
@export var as3d : AnimatedSprite3D
var player_tracker
var rotation_speed
@export var shoot_time = 1
@export var timer : Timer

func enter():
	timer.start()
	as3d.bypass_and_shoot = true
	as3d.play(&"Attacking")
	await get_tree().create_timer(shoot_time).timeout
	Transitioned.emit(self, "reloadstate")
	pass

func exit():
	as3d.bypass_and_shoot = false
	timer.stop()
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	turret.look_at(GameManager.player_loc)
	pass


func _on_timer_timeout() -> void:
	player_tracker.fire_weapon()
	pass # Replace with function body.
