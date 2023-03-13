extends Node2D

signal stamina_change
export var stamina = 100

var breathless = false
var is_breathing = false
var Sprint = false
var charge_ball = 0.5
var fire_rate_lit = 0.5
var fire_rate_lit_ball = 0.5
var bullet_speed = 400
var bullet_speed_lightnin_ball = 200
var laser_beam = preload("res://laser/LaserBeam.tscn")
var lightin = preload("res://Projectile/light_spray.tscn")

var beam_crosshair = preload("res://Projectile/Beam_cross_hair.tscn")
var beam_hittin = false
var lightnin_ball = preload("res://Projectile/Lightning_ball_charge.tscn")
var can_fire_light = true
var can_fire_light_ball = true
var weapon_select = 1

func _physics_process(delta):
	Global.bullet_pos = $bulletpoint.get_global_position()
	Global.ply_rotations = self.global_rotation_degrees
	
	if Input.is_action_pressed("Switch to flares"):
		weapon_select = 1
	if Input.is_action_pressed("Switch to flames"):
		weapon_select = 2
	if Input.is_action_pressed("switch_to_lightnin_ball"):
		weapon_select = 3
		
	if Input.is_action_pressed("Sprint") and breathless == false:
		Sprint = true
	else:
		Sprint = false
		
	if stamina < 0:
		breathless = true
	else:
		breathless = false
		
		
	

func _on_KinematicBody2D_stamina_change(stamina):
	stamina = stamina
	
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
		

	if Input.is_action_pressed("Shoot") and weapon_select == 3:
		Global.beam_active = false
		charge_ball += 0.05
		if charge_ball >= 4.5:
			charge_ball = 4.5
		
	if Input.is_action_just_released("Shoot") and can_fire_light_ball and stamina > 10 and is_breathing != true and weapon_select == 3:
		Global.charge_balls = charge_ball
		print(charge_ball)
		fire_light_ball()
		charge_ball = 0.5

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
	light_ball_inst.apply_impulse(Vector2(),Vector2(bullet_speed_lightnin_ball,0).rotated(rotation))
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
