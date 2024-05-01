extends Sprite

var weapon_changed_to = null



onready var weapon_slot_1 = get_node("weapon_1")
onready var weapon_slot_2 = get_node("weapon_2")
onready var weapon_slot_3 = get_node("weapon_3")

func _ready():
	
		#FIRE
	
	if Global.flamethrower_position == 1:
		weapon_slot_1.animation = "flamethrower"
	if Global.flamethrower_position == 2:
		weapon_slot_2.animation = "flamethrower"
	if Global.flamethrower_position == 3:
		weapon_slot_3.animation = "flamethrower"

	if Global.flamebeam_position == 1:
		weapon_slot_1.animation = "Laser_Beam"
	if Global.flamebeam_position == 2:
		weapon_slot_2.animation = "Laser_Beam"
	if Global.flamebeam_position == 3:
		weapon_slot_3.animation = "Laser_Beam"
		
	if Global.flametrail_position == 1:
		weapon_slot_1.animation = "flare"
	if Global.flametrail_position == 2:
		weapon_slot_2.animation = "flare"
	if Global.flametrail_position == 3:
		weapon_slot_3.animation = "flare"
		
		#LIGHTING
		
	if Global.lightspray_position == 1:
		weapon_slot_1.animation = "Light_spray"
	if Global.lightspray_position == 2:
		weapon_slot_2.animation = "Light_spray"
	if Global.lightspray_position == 3:
		weapon_slot_3.animation = "Light_spray"

	if Global.lightball_position == 1:
		weapon_slot_1.animation = "Light_ball"
	if Global.lightball_position == 2:
		weapon_slot_2.animation = "Light_ball"
	if Global.lightball_position == 3:
		weapon_slot_3.animation = "Light_ball"
		
	if Global.lighttrip_position == 1:
		weapon_slot_1.animation = "Light_node"
	if Global.lighttrip_position == 2:
		weapon_slot_2.animation = "Light_node"
	if Global.lighttrip_position == 3:
		weapon_slot_3.animation = "Light_node"
		
		#VACUUM
		
	if Global.vacuumblast_position == 1:
		weapon_slot_1.animation = "air_blast"
	if Global.vacuumblast_position == 2:
		weapon_slot_2.animation = "air_blast"
	if Global.vacuumblast_position == 3:
		weapon_slot_3.animation = "air_blast"

	if Global.vacuumbomb_position == 1:
		weapon_slot_1.animation = "air_bomb"
	if Global.vacuumbomb_position == 2:
		weapon_slot_2.animation = "air_bomb"
	if Global.vacuumbomb_position == 3:
		weapon_slot_3.animation = "air_bomb"
		
	if Global.vacuumdeploy_position == 1:
		weapon_slot_1.animation = "air_deploy"
	if Global.vacuumdeploy_position == 2:
		weapon_slot_2.animation = "air_deploy"
	if Global.vacuumdeploy_position == 3:
		weapon_slot_3.animation = "air_deploy"

func _process(delta):
	
	
	
	if weapon_changed_to == 1:
		weapon_slot_1.scale = lerp(weapon_slot_1.scale, Vector2(1.2,1.2), 0.2)
		weapon_slot_2.scale = lerp(weapon_slot_2.scale, Vector2(0.9,0.9), 0.2)
		weapon_slot_3.scale = lerp(weapon_slot_3.scale, Vector2(0.9,0.9), 0.2)
		
		weapon_slot_1.playing = true
		weapon_slot_2.playing = false
		weapon_slot_3.playing = false
		
		weapon_slot_1.modulate.a8 = 255
		weapon_slot_2.modulate.a8 = 127
		weapon_slot_3.modulate.a8 = 127

	if weapon_changed_to == 2:
		weapon_slot_2.scale = lerp(weapon_slot_2.scale, Vector2(1.2,1.2), 0.2)
		weapon_slot_1.scale = lerp(weapon_slot_1.scale, Vector2(0.9,0.9), 0.2)
		weapon_slot_3.scale = lerp(weapon_slot_3.scale, Vector2(0.9,0.9), 0.2)
		
		weapon_slot_2.playing = true
		weapon_slot_1.playing = false
		weapon_slot_3.playing = false
		
		weapon_slot_2.modulate.a8 = 255
		weapon_slot_1.modulate.a8 = 127
		weapon_slot_3.modulate.a8 = 127

	if weapon_changed_to == 3:
		weapon_slot_3.scale = lerp(weapon_slot_3.scale, Vector2(1.2,1.2), 0.2)
		weapon_slot_1.scale = lerp(weapon_slot_1.scale, Vector2(0.9,0.9), 0.2)
		weapon_slot_2.scale = lerp(weapon_slot_2.scale, Vector2(0.9,0.9), 0.2)
		
		weapon_slot_3.playing = true
		weapon_slot_1.playing = false
		weapon_slot_2.playing = false
		
		
		weapon_slot_3.modulate.a8 = 255
		weapon_slot_1.modulate.a8 = 127
		weapon_slot_2.modulate.a8 = 127
		
func _on_weapon_control_weapon_changed(weapon_select):
	weapon_changed_to = weapon_select
	print(weapon_changed_to)

