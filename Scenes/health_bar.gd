extends ProgressBar
@onready var flip_bar: ProgressBar = $"../FlipBarBlue"
@onready var Cooldown: Timer = $"../FlipCooldown"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.player_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = 	GameManager.player_health
	flip_bar.value = Cooldown.time_left
