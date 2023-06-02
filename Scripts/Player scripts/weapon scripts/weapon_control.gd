extends Node2D

onready var lightning := $LightningBeam

signal stamina_change
export var stamina = 100

var rotations = self.rotation_degrees
var breathless = false
var is_breathing = false
var Sprint = false


# fire rate numbers
var fire_rate_lit = 0.25
var fire_rate_lit_ball = 0.5
var fire_rate_lit_node = 0.5

var fire_rate_flamethrower = 0.1
var fire_trail_rate = 1.5


var vacuum_blast_rate = 1
var vacuum_bomb_fire_rate = 3
var vacuum_deploy_fire_rate = 10


# bullet move speeds
var bullet_speed = 400
var bullet_speed_lightnin_ball = 150
var node_bul_speed = 300
var flame_speed = 250
var flame_trail_speed = 300
var vacuum_bomb_speed = 250

# preloads
var laser_beam = preload("res://Projectile/fire/beam/LaserBeam.tscn")
var beam_crosshair = preload("res://Projectile/fire/beam/Beam_cross_hair.tscn")

var lightnin_ball = preload("res://Projectile/lightnin/ball/Lightning_ball_charge.tscn")

var lightnin_node_crosshair = preload("res://Projectile/lightnin/node/Node_cross_hair.tscn")
var lightnin_node_motion_bullet = preload("res://Projectile/lightnin/node/electric_node_motion.tscn")

var lightin = preload("res://Projectile/lightnin/spray/light_spray.tscn")

var flame_particles = preload("res://Projectile/fire/Flamethrower/flame_particles.tscn")

var flametrail_motion = preload("res://Projectile/fire/FlameTrail/flame_trail_motion.tscn")
var flametrail_crosshair = preload("res://Projectile/fire/FlameTrail/fire_cross_hair.tscn")

var vacuum_blast = preload("res://Projectile/Vacuum/vacuum_blast/vacuum_blast.tscn")

var vacuum_bomb_crosshair = preload("res://Projectile/Vacuum/vacuum_bomb/vac_bomb_cross_hair.tscn")
var vacuum_bomb_motion = preload("res://Projectile/Vacuum/vacuum_bomb/vacuum_bomb.tscn")

var vacuum_deploy_ghost_basic = preload("res://Projectile/Vacuum/vacuum_deploy/deployed_ghost_basic.tscn")
# weapon checks
var can_fire_light = true
var can_fire_light_ball = true
var can_fire_light_node = true

var can_fire_flamethrower = true
var can_fire_fire_trail = true

var can_fire_vacuum_blast = true
var can_fire_vacuum_bomb = true
var can_fire_vacuum_deploy = true



#other
var weapon_select = 1
var beam_hittin = false
var charge_ball = 0.5




func _inputchecks():
	if Input.is_action_pressed("Switch to weapon1"):
		weapon_select = 1
	if Input.is_action_pressed("Switch to weapon2"):
		weapon_select = 2
	if Input.is_action_pressed("Switch to weapon3"):
		weapon_select = 3

			
	if Input.is_action_just_pressed("Breath"):
		is_breathing = true
		
	if Input.is_action_just_pressed("Cancel"):
		if is_breathing == true:
			is_breathing = false
	
	if Input.is_action_pressed("Sprint") and breathless == false:
		Sprint = true
	else:
		Sprint = false
		
	if stamina < 0:
		breathless = true
	else:
		breathless = false

	if Global.beam_active == false and Global.vacuum_active == false:
		if Input.is_action_just_pressed("Shoot") and Global.beam_active == false and stamina > 10 and is_breathing != true and weapon_select == Global.flamebeam_position:
			Global.beam_active = true
			fire_beam()
			emit_signal("stamina_change", stamina)
	
	if Input.is_action_just_pressed("right click"):
		Global.beam_active = false
	

	

	
	if Input.is_action_pressed("Shoot") and can_fire_light and stamina > 10 and is_breathing != true and weapon_select == Global.lightspray_position:
		Global.beam_active = false

		fire_light_spray()
		fire_light_spray()
		fire_light_spray()
		fire_light_spray()
		fire_light_spray()
		
	if Input.is_action_pressed("Shoot") and weapon_select == Global.lightball_position and is_breathing != true:
		Global.beam_active = false

		charge_ball += 0.05
		if charge_ball >= 4.5:
			charge_ball = 4.5
		
	if Input.is_action_just_released("Shoot") and can_fire_light_ball and stamina > 10 and is_breathing != true and weapon_select == Global.lightball_position:
		Global.beam_active = false

		Global.charge_balls = charge_ball

		fire_light_ball()
		charge_ball = 0.5
	
	if Input.is_action_just_released("Shoot") and can_fire_light_node and stamina > 10 and is_breathing != true and weapon_select == Global.lighttrip_position:
		Global.beam_active = false

		fire_elec_node()
	
	if Input.is_action_pressed("Shoot") and stamina > 10 and is_breathing != true and weapon_select == Global.flamethrower_position:
		Global.beam_active = false

		var rand_chance_for_more_flames = rand_range(0,2)
		flamethrower()
		if rand_chance_for_more_flames < 1:
			flamethrower()
	
	if Input.is_action_just_pressed("Shoot") and stamina > 10 and is_breathing != true and weapon_select == Global.vacuumblast_position and can_fire_vacuum_blast == true:
		Global.beam_active = false

		print("fire")
		trigger_airblast()
	
	if Input.is_action_just_released("Shoot") and can_fire_fire_trail and stamina > 10 and is_breathing != true and weapon_select == Global.flametrail_position:
		Global.beam_active = false

		flametrail()
		
	if Input.is_action_just_released("Shoot") and can_fire_vacuum_bomb and stamina > 10 and is_breathing != true and weapon_select == Global.vacuumbomb_position:
		Global.beam_active = false

		fire_vac_bomb()
		
	if Input.is_action_just_released("Shoot") and stamina > 10 and is_breathing != true and weapon_select == Global.vacuumdeploy_position and can_fire_vacuum_deploy:
		Global.beam_active = false

		print(Global.deploy_ghost_count)
		
		if Global.deploy_ghost_count == 0:
			deploy_ghost()
			Global.deploy_ghost_count += 1
			

		


func _on_KinematicBody2D_stamina_change(stamina):
	stamina = stamina


func _physics_process(delta):
	Global.bullet_pos = $bulletpoint.get_global_position()
	Global.ply_rotations = self.global_rotation_degrees
	
	
	_inputchecks()
	
func deploy_ghost():
	var ghost_deploy_instance = vacuum_deploy_ghost_basic.instance()
	ghost_deploy_instance.position = $bulletpoint.get_global_position()
	ghost_deploy_instance.rotation_degrees = Global.ply_rotations
	get_tree().get_root().call_deferred("add_child", ghost_deploy_instance)
	can_fire_vacuum_deploy = false
	yield(get_tree().create_timer(vacuum_deploy_fire_rate), "timeout")
	can_fire_vacuum_deploy = true

	
func fire_vac_bomb():
	var vacuum_bomb_crosshair_instance = vacuum_bomb_crosshair.instance()
	vacuum_bomb_crosshair_instance.position = get_global_mouse_position()
	vacuum_bomb_crosshair_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", vacuum_bomb_crosshair_instance)
	
	var vacuum_bomb_motion_instance = vacuum_bomb_motion.instance()
	vacuum_bomb_motion_instance.position = $bulletpoint.get_global_position()
	vacuum_bomb_motion_instance.rotation_degrees = Global.ply_rotations
	vacuum_bomb_motion_instance.apply_impulse(Vector2(),Vector2(vacuum_bomb_speed,0).rotated(rotations))
	get_tree().get_root().call_deferred("add_child", vacuum_bomb_motion_instance)
	can_fire_vacuum_bomb = false
	yield(get_tree().create_timer(vacuum_bomb_fire_rate), "timeout")
	can_fire_vacuum_bomb = true

func trigger_airblast():
	var vacuum_blast_instance = vacuum_blast.instance()
	vacuum_blast_instance.position = $bulletpoint.get_global_position()
	get_tree().get_root().call_deferred("add_child", vacuum_blast_instance)
	can_fire_vacuum_blast = false
	yield(get_tree().create_timer(vacuum_blast_rate), "timeout")
	can_fire_vacuum_blast = true
	

	
func flametrail():
	var flame_crosshair_instance = flametrail_crosshair.instance()
	flame_crosshair_instance.position = get_global_mouse_position()
	flame_crosshair_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", flame_crosshair_instance)
	
	var flame_trail_instance = flametrail_motion.instance()
	flame_trail_instance.position = $bulletpoint.get_global_position()
	flame_trail_instance.rotation_degrees = Global.ply_rotations
	flame_trail_instance.apply_impulse(Vector2(),Vector2(flame_trail_speed,0).rotated(rotations))
	get_tree().get_root().call_deferred("add_child", flame_trail_instance)
	can_fire_fire_trail = false
	yield(get_tree().create_timer(fire_trail_rate), "timeout")
	can_fire_fire_trail = true
	
func flamethrower():
	randomize()
	var rand_angle = rand_range(-0.8,0.8)
	var thrower_instance = flame_particles.instance()		
	thrower_instance.position = $bulletpoint.get_global_position()
	thrower_instance.apply_impulse(Vector2(),Vector2(flame_speed,0).rotated(rotations + rand_angle))
	get_tree().get_root().call_deferred("add_child", thrower_instance)
	
	can_fire_flamethrower = false
	yield(get_tree().create_timer(fire_rate_flamethrower), "timeout")
	can_fire_flamethrower = true
	
func fire_elec_node():
	var node_crosshair_instance = lightnin_node_crosshair.instance()
	node_crosshair_instance.position = get_global_mouse_position()
	node_crosshair_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", node_crosshair_instance)
	
	var node_motion_instance = lightnin_node_motion_bullet.instance()
	node_motion_instance.position = $bulletpoint.get_global_position()
	node_motion_instance.rotation_degrees = Global.ply_rotations
	node_motion_instance.apply_impulse(Vector2(),Vector2(node_bul_speed,0).rotated(rotations))
	get_tree().get_root().call_deferred("add_child", node_motion_instance)
	can_fire_light_node = false
	yield(get_tree().create_timer(fire_rate_lit_node), "timeout")
	can_fire_light_node = true
	
func fire_beam():
	var block_instance = beam_crosshair.instance()
	block_instance.position = get_global_mouse_position()
	block_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", block_instance)
	var beam_o_laser = laser_beam.instance()
	beam_o_laser.position = $bulletpoint.get_global_position()
	get_tree().get_root().call_deferred("add_child", beam_o_laser)

func fire_light_ball():
	var light_ball_inst = lightnin_ball.instance()
	light_ball_inst.position = $bulletpoint.get_global_position()
	light_ball_inst.rotation_degrees = rotation_degrees
	light_ball_inst.apply_impulse(Vector2(),Vector2(bullet_speed_lightnin_ball,0).rotated(rotations))
	get_tree().get_root().call_deferred("add_child", light_ball_inst)
	can_fire_light_ball = false
	yield(get_tree().create_timer(fire_rate_lit_ball), "timeout")
	can_fire_light_ball = true
	
func fire_light_spray():

	var light_instance = lightin.instance()
	light_instance.position = $bulletpoint.get_global_position()
	get_tree().get_root().call_deferred("add_child", light_instance)
	can_fire_light = false
	yield(get_tree().create_timer(fire_rate_lit), "timeout")
	can_fire_light = true

func _on_KinematicBody2D_player_rotation(rotation):
	rotations = rotation
