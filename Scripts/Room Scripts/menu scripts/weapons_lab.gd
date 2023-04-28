extends Control

var weapons_limit = 3
var weapons_picked = 0
var flamethrower = 0
var lightspray = 0
var heatbeam = 0
var firetrail = 0
var lightball = 0
var lighttrip = 0

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

func _process(delta):
	if Input.is_action_pressed("Shoot"):
		print(weapons_picked)

func _on_flamethrower_toggled(button_pressed):
	


		
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		flamethrower = 1
		Global.flame_thrower_activcated = true
		Global.what_was_picked = 1
		
		
	elif button_pressed == false and flamethrower == 1:
		print("trigger")
		weapons_picked -= 1
		flamethrower = 0
		Global.flame_thrower_activcated = false
		
	
		
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
	else:
		$lightning_tripwire.pressed = false


func _on_Button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/hub_player_level_select.tscn")


func _on_flamethrower_pressed():
	if flamethrower == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")


func _on_heatbeam_pressed():
	if heatbeam == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")


func _on_flametrail_pressed():
	if firetrail == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")


func _on_lightning_spray_pressed():
	if lightspray == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")


func _on_lightning_ball_pressed():
	if lightball == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")


func _on_lightning_tripwire_pressed():
	if lighttrip == 1:
		get_tree().change_scene("res://Rooms/menu_rooms/weapon_position_pick.tscn")
