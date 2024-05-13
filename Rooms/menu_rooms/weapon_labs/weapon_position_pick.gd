extends Control

signal num_change

var weapon_selected = 0
var num 
var timer_check = false
var hand = preload("res://Sprites/Menu_backgrounds/hand.png")
var hand2 = preload("res://Sprites/Menu_backgrounds/hand-expor2t.png")

var rand_y = 360
var rand_e = 360

var rand_ene = 1
var rand_vis = 255

func exit():
	$back/AnimationPlayer.play("down_slide")
	$"1/AnimationPlayer".play("slide down")
	yield(get_tree().create_timer(0.08), "timeout")
	$"2/AnimationPlayer".play("slide down middle")
	yield(get_tree().create_timer(0.08), "timeout")
	$"3/AnimationPlayer".play("slide down right")
	
	while $instructions.modulate.a > 0 or $selected.modulate.a > 0:
		yield(get_tree().create_timer(0.08), "timeout")
		$instructions.modulate.a -= 0.1
		$selected.modulate.a -= 0.1
		$"1".modulate.a -= 0.1
		$"2".modulate.a -= 0.1
		$"3".modulate.a -= 0.1
		
func enter():
	$instructions.modulate.a = 0
	$selected.modulate.a = 0
	$"1".modulate.a = 0
	$"2".modulate.a = 0
	$"3".modulate.a = 0
	
	$back/AnimationPlayer.play_backwards("down_slide")
	$"1/AnimationPlayer".play_backwards("slide down")
	yield(get_tree().create_timer(0.08), "timeout")
	$"2/AnimationPlayer".play_backwards("slide down middle")
	yield(get_tree().create_timer(0.08), "timeout")
	$"3/AnimationPlayer".play_backwards("slide down right")
	
	while $instructions.modulate.a < 1.0 or $selected.modulate.a < 1.0:
		yield(get_tree().create_timer(0.08), "timeout")
		$instructions.modulate.a += 0.1
		$selected.modulate.a += 0.1
		$"1".modulate.a += 0.1
		$"2".modulate.a += 0.1
		$"3".modulate.a += 0.1
	
func _process(delta):
	$hand.global_position = get_global_mouse_position()

	if Input.is_action_pressed("Shoot"):
		$hand.texture = hand2
		if Input.is_action_pressed("Shoot"):
			$hand.texture = hand2
	if Input.is_action_just_released("Shoot"):
		$hand.texture = hand

	if timer_check:
		rand_y = rand_range(260,460)
		rand_e = rand_range(260,460)
		
		rand_ene = rand_range(0.5,1.0)
		rand_vis = rand_range(25,75)
		
		timer_check = false
		
	$static.position.y = lerp($static.position.y,rand_y,0.5) 
	$static.modulate.a8 = lerp($static.modulate.a8,rand_vis,0.5)
	
	$Light2D.position.y = lerp($Light2D.position.y ,rand_e,0.5) 
	$Light2D.energy = lerp($Light2D.energy,rand_ene,0.5)

func change_thrower(num):
	Global.flamethrower_position = num
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0
		
func change_beam(num):
	Global.flamebeam_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0		
		
func change_trail(num):
	Global.flametrail_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0

func change_spray(num):
	Global.lightspray_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0 
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0
		
func change_ball(num):
	Global.lightball_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0

func change_trip(num):
	Global.lighttrip_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0
		
func change_blast(num):
	Global.vacuumblast_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0
		
func change_bomb(num):
	Global.vacuumbomb_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumdeploy_position == num:
		Global.vacuumdeploy_position = 0
	
func change_deploy(num):
	Global.vacuumdeploy_position = num
	if Global.flamethrower_position == num:
		Global.flamethrower_position = 0 
	if Global.flamebeam_position == num:
		Global.flamebeam_position = 0 
	if Global.flametrail_position == num:
		Global.flametrail_position = 0 
	if Global.lightspray_position == num:
		Global.lightspray_position = 0 
	if Global.lightball_position == num:
		Global.lightball_position = 0
	if Global.lighttrip_position == num:
		Global.lighttrip_position = 0
	if Global.vacuumblast_position == num:
		Global.vacuumblast_position = 0
	if Global.vacuumbomb_position == num:
		Global.vacuumbomb_position = 0
		
func _ready():
	if Global.what_was_picked == 1:
		weapon_selected = 1
	elif Global.what_was_picked == 2:
		weapon_selected = 2
	elif Global.what_was_picked == 3:
		weapon_selected = 3
	elif Global.what_was_picked == 4:
		weapon_selected = 4
	elif Global.what_was_picked == 5:
		weapon_selected = 5
	elif Global.what_was_picked == 6:
		weapon_selected = 6
	elif Global.what_was_picked == 7:
		weapon_selected = 7
	elif Global.what_was_picked == 8:
		weapon_selected = 8
	elif Global.what_was_picked == 9:
		weapon_selected = 9
	_on_Timer_timeout()
	enter()
	
func _on_1_pressed():
	emit_signal("num_change", 1)
	if weapon_selected == 1:
		num = 1
		change_thrower(num)

	if weapon_selected == 2:
		num = 1
		change_beam(num)
		
	if weapon_selected == 3:
		num = 1
		change_trail(num)
		
	if weapon_selected == 4:
		num = 1
		change_spray(num)
		
	if weapon_selected == 5:
		num = 1
		change_ball(num)
		
	if weapon_selected == 6:
		num = 1
		change_trip(num)
		
	if weapon_selected == 7:
		num = 1
		change_blast(num)

	if weapon_selected == 8:
		num = 1
		change_bomb(num)

	if weapon_selected == 9:
		num = 1
		change_deploy(num)
	
func _on_2_pressed():
	emit_signal("num_change", 2)
	if weapon_selected == 1:
		num = 2
		change_thrower(num)

	if weapon_selected == 2:
		num = 2
		change_beam(num)
		
	if weapon_selected == 3:
		num = 2
		change_trail(num)
		
	if weapon_selected == 4:
		num = 2
		change_spray(num)
		
	if weapon_selected == 5:
		num = 2
		change_ball(num)
		
	if weapon_selected == 6:
		num = 2
		change_trip(num)
		
	if weapon_selected == 7:
		num = 2
		change_blast(num)

	if weapon_selected == 8:
		num = 2
		change_bomb(num)

	if weapon_selected == 9:
		num = 2
		change_deploy(num)
		
func _on_3_pressed():
	emit_signal("num_change", 3)
	if weapon_selected == 1:
		num = 3
		change_thrower(num)

	if weapon_selected == 2:
		num = 3
		change_beam(num)
		
	if weapon_selected == 3:
		num = 3
		change_trail(num)
		
	if weapon_selected == 4:
		num = 3
		change_spray(num)
		
	if weapon_selected == 5:
		num = 3
		change_ball(num)
		
	if weapon_selected == 6:
		num = 3
		change_trip(num)
		
	if weapon_selected == 7:
		num = 3
		change_blast(num)

	if weapon_selected == 8:
		num = 3
		change_bomb(num)

	if weapon_selected == 9:
		num = 3
		change_deploy(num)
		
func _on_back_pressed():
	exit()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapons_lab.tscn")
	
func _on_Timer_timeout():
	timer_check = true
	$Timer.wait_time = rand_range(0.15,0.3)
	$Timer.start()
