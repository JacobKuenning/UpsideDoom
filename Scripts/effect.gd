extends Node3D

@export var as3d : AnimatedSprite3D

func _on_animated_sprite_3d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
