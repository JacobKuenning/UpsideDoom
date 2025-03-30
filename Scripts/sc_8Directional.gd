extends AnimatedSprite3D

var angle_to_player = null
var bypass_and_shoot = false

var animations = [
	"back", 		# 180
	"back_left", 	# 225
	"left", 		# 270
	"front_left",	# 315
	"front", 		# 0
	"front_right",	# 45
	"right",		# 90
	"back_right" 	# 135
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !bypass_and_shoot:
		directional_sprites()
	
func directional_sprites():
	if not GameManager.player_loc:
		return
		
	var to_player = GameManager.player_loc - global_position
	to_player.y = 0
	to_player = to_player.normalized()
	
	var forward = -global_transform.basis.z
	forward.y = 0
	forward = forward.normalized()
	
	var angle = forward.signed_angle_to(to_player, Vector3.UP)
	var degrees = rad_to_deg(angle)
	
	if degrees < 0:
		degrees +=360
		
	var anim_index = int(round(degrees / 45)) % 8
	
	if anim_index < animations.size():
		var target_anim = animations[anim_index]
		if animation != target_anim:
			play(target_anim)
