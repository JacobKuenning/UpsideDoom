extends RigidBody3D
@export var speed = 40
@export var timer : Timer

func _ready():
	timer.start()
	pass

func _physics_process(delta):
	move_and_collide(-transform.basis.z * delta * speed)
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_3d_area_entered(area: Area3D) -> void:
	queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
