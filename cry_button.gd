extends Button
@export var asp : AudioStreamPlayer

func _on_button_down() -> void:
	asp.play()
	pass # Replace with function body.


func _on_audio_stream_player_finished() -> void:
	get_tree().quit()
	pass # Replace with function body.
