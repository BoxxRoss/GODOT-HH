extends Control

var weapons_limit = 3
var weapons_picked = 0

var hand = preload("res://Sprites/Menu_backgrounds/hand.png")
var hand2 = preload("res://Sprites/Menu_backgrounds/hand-expor2t.png")

var timer_check = false
var rand_y = 360
var rand_e = 360

var rand_ene = 1
var rand_vis = 255


var flamethrower = 0
var lightspray = 0
var heatbeam = 0

var firetrail = 0
var lightball = 0
var lighttrip = 0

var vacuumblast = 0
var vacuumbomb = 0
var vacuumdeploy = 0

func to_weapon_select():
	exit()
	yield(get_tree().create_timer(1.5), "timeout")	
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapon_position_pick.tscn")

func _on_Button_pressed():
	exit()
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://Rooms/menu_rooms/MainMenu.tscn")

func exit():
	$move_to_level/AnimationPlayer.play("up_slide")
	$Button/AnimationPlayer.play("down_slide")
	
	while $Control.modulate.a > 0 or $move_to_level.modulate.a > 0 or $Button.modulate.a > 0:
		yield(get_tree().create_timer(0.08), "timeout")
		$Control.modulate.a -= 0.1
		$move_to_level.modulate.a -= 0.1
		$Button.modulate.a -= 0.1
		$Control2.modulate.a -= 0.1
		
func enter():
	$move_to_level/AnimationPlayer.play_backwards("up_slide")
	$Button/AnimationPlayer.play_backwards("down_slide")
	
	while $Control.modulate.a < 1.0 or $move_to_level.modulate.a < 1.0 or $Button.modulate.a < 1.0:
		yield(get_tree().create_timer(0.08), "timeout")
		$Control.modulate.a += 0.1
		$move_to_level.modulate.a += 0.1
		$Button.modulate.a += 0.1
		$Control2.modulate.a += 0.1
		
func _ready():
	_on_flicker_timeout()
	$Control.modulate.a = 0
	$Control2.modulate.a = 0
	$move_to_level.modulate.a = 0
	$Button.modulate.a = 0
	enter()
	
	if Global.flame_thrower_activcated == true:
		$Control/flamethrower.pressed = true
	if Global.flame_beam_activated == true:
		$Control/heatbeam.pressed = true
	if Global.flame_trail_activated == true:
		$Control/flametrail.pressed = true
		
	if Global.lightning_ball_activated == true:
		$Control/lightning_ball.pressed = true	
	if Global.lightning_spray_activated == true:
		$Control/lightning_spray.pressed = true
	if Global.lightning_tripwire_activated == true:
		$Control/lightning_tripwire.pressed = true
		
	if Global.vacuum_blast_activated == true:
		$Control/vacuum_blast.pressed = true
	if Global.vacuum_bomb_activated == true:
		$Control/vacuum_bomb.pressed = true
	if Global.vacuum_deploy_activated == true:
		$Control/vacuum_deploy.pressed = true
		
	if Global.flamethrower_position == 0:
		$Control/flamethrower.pressed = false
	if Global.flamebeam_position == 0:
		$Control/heatbeam.pressed = false
	if Global.flametrail_position == 0:
		$Control/flametrail.pressed = false
		
	if Global.lightspray_position == 0:
		$Control/lightning_spray.pressed = false
	if Global.lightball_position == 0:
		$Control/lightning_ball.pressed = false
	if Global.lighttrip_position == 0:
		$Control/lightning_tripwire.pressed = false
		
	if Global.vacuumblast_position == 0:
		$Control/vacuum_blast.pressed = false
	if Global.vacuumbomb_position == 0:
		$Control/vacuum_bomb.pressed = false
	if Global.vacuumdeploy_position == 0:
		$Control/vacuum_deploy.pressed = false

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

func _on_flamethrower_toggled(button_pressed):
	
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		flamethrower = 1
		Global.flame_thrower_activcated = true
		Global.what_was_picked = 1
		
		
	elif button_pressed == false and flamethrower == 1:
		weapons_picked -= 1
		flamethrower = 0
		Global.flame_thrower_activcated = false
		Global.flamethrower_position = 0
	
		
	else:
		$flamethrower.pressed = false

func _on_heatbeam_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		heatbeam = 1
		Global.flame_beam_activated = true
		Global.what_was_picked = 2

		
	elif button_pressed == false and heatbeam == 1:
		weapons_picked -= 1
		heatbeam = 0
		Global.flame_beam_activated = false
		Global.flamebeam_position = 0
	else:
		$Control/heatbeam.pressed = false

func _on_flametrail_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		firetrail = 1
		Global.flame_trail_activated = true
		Global.what_was_picked = 3
		
		
	elif button_pressed == false and firetrail == 1:
		weapons_picked -= 1
		firetrail = 0
		Global.flame_trail_activated = false
		Global.flametrail_position = 0
	else:
		$Control/flametrail.pressed = false

func _on_lightning_spray_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		lightspray = 1
		Global.lightning_spray_activated = true
		Global.what_was_picked = 4
	
		
	elif button_pressed == false and lightspray == 1:
		weapons_picked -= 1
		lightspray = 0
		Global.lightning_spray_activated = false
		Global.lightspray_position = 0
	else:
		$Control/lightning_spray.pressed = false

func _on_lightning_ball_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		lightball = 1
		Global.lightning_ball_activated = true
		Global.what_was_picked = 5
	
		
	elif button_pressed == false and lightball == 1:
		weapons_picked -= 1
		lightball = 0
		Global.lightning_ball_activated = false
		Global.lightball_position = 0
	else:
		$Control/lightning_ball.pressed = false

func _on_lightning_tripwire_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		lighttrip = 1
		Global.lightning_tripwire_activated = true
		Global.what_was_picked = 6
	
		
	elif button_pressed == false and lighttrip == 1:
		weapons_picked -= 1
		lighttrip = 0
		Global.lightning_tripwire_activated = false
		Global.lighttrip_position = 0
	else:
		$Control/lightning_tripwire.pressed = false

func _on_vacuum_blast_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		vacuumblast = 1
		Global.vacuum_blast_activated = true
		Global.what_was_picked = 7
	
		
	elif button_pressed == false and vacuumblast == 1:
		weapons_picked -= 1
		vacuumblast = 0
		Global.vacuum_blast_activated = false
		Global.vacuumblast_position = 0
	else:
		$Control/vacuum_blast.pressed = false

func _on_vacuum_bomb_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		vacuumbomb = 1
		Global.vacuum_bomb_activated = true
		Global.what_was_picked = 8
	
	elif button_pressed == false and vacuumbomb == 1:
		weapons_picked -= 1
		vacuumbomb = 0
		Global.vacuum_bomb_activated = false
		Global.vacuumbomb_position = 0
	else:
		$Control/vacuum_bomb.pressed = false

func _on_vacuum_deploy_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		vacuumdeploy = 1
		Global.vacuum_deploy_activated = true
		Global.what_was_picked = 9
	
	elif button_pressed == false and vacuumdeploy == 1:
		weapons_picked -= 1
		vacuumdeploy = 0
		Global.vacuum_deploy_activated = false
		Global.vacuumdeploy_position = 0
	else:
		$Control/vacuum_deploy.pressed = false

func _on_flamethrower_pressed():
	if flamethrower == 1:
		to_weapon_select()

func _on_heatbeam_pressed():
	if heatbeam == 1:
		to_weapon_select()

func _on_flametrail_pressed():
	if firetrail == 1:
		to_weapon_select()

func _on_lightning_spray_pressed():
	if lightspray == 1:
		to_weapon_select()

func _on_lightning_ball_pressed():
	if lightball == 1:
		to_weapon_select()

func _on_lightning_tripwire_pressed():
	if lighttrip == 1:
		to_weapon_select()

func _on_vacuum_blast_pressed():
	if vacuumblast == 1:
		to_weapon_select()

func _on_vacuum_bomb_pressed():
	if vacuumbomb == 1:
		to_weapon_select()

func _on_vacuum_deploy_pressed():
	if vacuumdeploy == 1:
		to_weapon_select()

func _on_move_to_level_pressed():
	exit()
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")

func _on_flicker_timeout():
	timer_check = true
	$flicker.wait_time = rand_range(0.15,0.3)
	$flicker.start()


