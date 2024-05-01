extends Control

var weapons_limit = 3
var weapons_picked = 0

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
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapon_position_pick.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/hub_player_level_select.tscn")

func _ready():
	if Global.flame_thrower_activcated == true:
		$flamethrower.pressed = true
	if Global.flame_beam_activated == true:
		$heatbeam.pressed = true
	if Global.flame_trail_activated == true:
		$flametrail.pressed = true
		
	if Global.lightning_ball_activated == true:
		$lightning_ball.pressed = true	
	if Global.lightning_spray_activated == true:
		$lightning_spray.pressed = true
	if Global.lightning_tripwire_activated == true:
		$lightning_tripwire.pressed = true
		
	if Global.vacuum_blast_activated == true:
		$vacuum_blast.pressed = true
	if Global.vacuum_bomb_activated == true:
		$vacuum_bomb.pressed = true
	if Global.vacuum_deploy_activated == true:
		$vacuum_deploy.pressed = true
		
	if Global.flamethrower_position == 0:
		$flamethrower.pressed = false
	if Global.flamebeam_position == 0:
		$heatbeam.pressed = false
	if Global.flametrail_position == 0:
		$flametrail.pressed = false
		
	if Global.lightspray_position == 0:
		$lightning_spray.pressed = false
	if Global.lightball_position == 0:
		$lightning_ball.pressed = false
	if Global.lighttrip_position == 0:
		$lightning_tripwire.pressed = false
		
	if Global.vacuumblast_position == 0:
		$vacuum_blast.pressed = false
	if Global.vacuumbomb_position == 0:
		$vacuum_bomb.pressed = false
	if Global.vacuumdeploy_position == 0:
		$vacuum_deploy.pressed = false

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
		$heatbeam.pressed = false

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
		$flametrail.pressed = false

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
		$lightning_spray.pressed = false

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
		$lightning_ball.pressed = false

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
		$lightning_tripwire.pressed = false

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
		$vacuum_blast.pressed = false

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
		$vacuum_bomb.pressed = false

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
		$vacuum_deploy.pressed = false



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
	if Global.level_id_picked == 1:
		get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")



