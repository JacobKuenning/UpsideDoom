extends Node3D
@onready var sprite: AnimatedSprite3D = $AnimatedSprite3D

var angle_to_player = null


var animations = [
	"front", 		# 0
	"front_right",	# 45
	"right",		# 90
	"back_right", 	# 135
	"back", 		# 180
	"back_left", 	# 225
	"left", 		# 270
	"front_left"	# 315
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	angle_to_player = global_position.angle_to(GameManager.player_loc)
	print(str(rad_to_deg(angle_to_player)))
	
