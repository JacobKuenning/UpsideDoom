extends Node3D
var active = false
@export var next_scene : String

func _on_area_3d_area_entered(area: Area3D) -> void:
	if active and area.get_parent().name == "Player":
		get_tree().change_scene_to_file(next_scene)
	pass # Replace with function body.
