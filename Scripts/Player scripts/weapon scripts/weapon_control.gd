extends Node2D

onready var lightning := $LightningBeam

signal stamina_change
export var stamina = 100

var rotations = self.rotation_degrees
var breathless = false
var is_breathing = false
var Sprint = false


# fire rate numbers
var fire_rate_lit = 0.5
var fire_rate_lit_ball = 0.5
var fire_rate_lit_node = 0.8
var fire_rate_flamethrower = 0.1

# fire speeds
var bullet_speed = 400
var bullet_speed_lightnin_ball = 150
var node_bul_speed = 300
var flame_speed = 250

# preloads
var laser_beam = preload("res://Projectile/fire/beam/LaserBeam.tscn")
var beam_crosshair = preload("res://Projectile/fire/beam/Beam_cross_hair.tscn")

var lightnin_ball = preload("res://Projectile/lightnin/ball/Lightning_ball_charge.tscn")

var lightnin_node_crosshair = preload("res://Projectile/lightnin/node/Node_cross_hair.tscn")
var lightnin_node_motion_bullet = preload("res://Projectile/lightnin/node/electric_node_motion.tscn")

var lightin = preload("res://Projectile/lightnin/spray/light_spray.tscn")

var flame_particles = preload("res://Projectile/fire/Flamethrower/flame_particles.tscn")
# weapon checks
var can_fire_light = true
var can_fire_light_ball = true
var can_fire_light_node = true
var can_fire_flamethrower = true
#other
var weapon_select = 1
var beam_hittin = false
var charge_ball = 0.5


func _on_KinematicBody2D_stamina_change(stamina):
	stamina = stamina

func _physics_process(delta):
	Global.bullet_pos = $bulletpoint.get_global_position()
	Global.ply_rotations = self.global_rotation_degrees
	
	if Input.is_action_pressed("Switch to beam"):
		weapon_select = 1
	if Input.is_action_pressed("Switch to flames"):
		weapon_select = 2
	if Input.is_action_pressed("switch_to_lightnin_ball"):
		weapon_select = 3
	if Input.is_action_pressed("switch_to_eletric_nodes"):
		weapon_select = 4
	if Input.is_action_pressed("switch to flamethrower"):
		weapon_select = 5
	
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

	if Global.beam_active == false:
		if Input.is_action_just_pressed("Shoot") and Global.beam_active == false and stamina > 10 and is_breathing != true and weapon_select == 1:
			Global.beam_active = true
			fire_beam()
			emit_signal("stamina_change", stamina)
	
	if Input.is_action_just_pressed("right click"):
		Global.beam_active = false
	
	
	if Input.is_action_pressed("Shoot") and can_fire_light and stamina > 10 and is_breathing != true and weapon_select == 2:
		Global.beam_active = false
		fire_light_spray()
		
	if Input.is_action_pressed("Shoot") and weapon_select == 3 and is_breathing != true:
		Global.beam_active = false
		charge_ball += 0.05
		if charge_ball >= 4.5:
			charge_ball = 4.5
		
	if Input.is_action_just_released("Shoot") and can_fire_light_ball and stamina > 10 and is_breathing != true and weapon_select == 3:
		Global.beam_active = false
		Global.charge_balls = charge_ball

		fire_light_ball()
		charge_ball = 0.5
	
	if Input.is_action_just_released("Shoot") and can_fire_light_node and stamina > 10 and is_breathing != true and weapon_select == 4:
		Global.beam_active = false
		fire_elec_node()
	
	if Input.is_action_pressed("Shoot") and stamina > 10 and is_breathing != true and weapon_select == 5:
		
		flamethrower()
		
		


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
	light_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", light_instance)
	can_fire_light = false
	yield(get_tree().create_timer(fire_rate_lit), "timeout")
	can_fire_light = true

func _on_KinematicBody2D_player_rotation(rotation):
	rotations = rotation

