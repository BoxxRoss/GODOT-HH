extends Control

var weapon_selected = 0



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

func _on_1_pressed():
	
	if weapon_selected == 1:
		Global.flamethrower_position = 1
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 2:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 1
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 3:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 1
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 4:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 1
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 5:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 1
		Global.lighttrip_position = 0
		
	if weapon_selected == 6:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 1
	

		
func _on_2_pressed():
	
	if weapon_selected == 1:
		Global.flamethrower_position = 2
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 2:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 2
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 3:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 2
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 4:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 2
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 5:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 2
		Global.lighttrip_position = 0
		
	if weapon_selected == 6:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 2
		
	

func _on_3_pressed():
	
	if weapon_selected == 1:
		Global.flamethrower_position = 3
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 2:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 3
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 3:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 3
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 4:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 3
		Global.lightball_position = 0
		Global.lighttrip_position = 0
		
	if weapon_selected == 5:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 3
		Global.lighttrip_position = 0
		
	if weapon_selected == 6:
		Global.flamethrower_position = 0
		Global.flamebeam_position = 0 
		Global.flametrail_position = 0
		Global.lightspray_position = 0
		Global.lightball_position = 0
		Global.lighttrip_position = 3
		
func _on_back_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/weapons_lab.tscn")
