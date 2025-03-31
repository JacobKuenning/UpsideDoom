extends Node3D
@onready var audio_player: AudioStreamPlayer3D = $AnimatedSprite3D/AudioStreamPlayer3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player.pitch_scale = randf_range(0.8, 1.3)
	audio_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
