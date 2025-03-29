extends RigidBody3D
@export var speed = 40

func _physics_process(delta):
	move_and_collide(-transform.basis.z * delta * speed)
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("area3d body entered")
	queue_free()
	pass # Replace with function body.
