extends Control

var weapon_selected = 0
var num 

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

func _on_1_pressed():
	
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
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapons_lab.tscn")
	
	
