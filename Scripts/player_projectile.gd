extends RigidBody3D
@export var speed = 40

func _ready():
	await get_tree().create_timer(30)
	queue_free()

func _physics_process(delta):
	move_and_collide(-transform.basis.z * delta * speed)
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_3d_area_entered(area: Area3D) -> void:
	queue_free()
	pass # Replace with function body.
