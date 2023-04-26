extends Control

var weapons_limit = 3
var weapons_picked = 0



func _on_flamethrower_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		print(weapons_picked)
		Global.flame_thrower_activcated = true
		
	if button_pressed == false:
		weapons_picked -= 1
		print(weapons_picked)
		Global.flame_thrower_activcated = false
		print(Global.flame_thrower_activcated)
		



func _on_heatbeam_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		print(weapons_picked)
		Global.flame_beam_activated = true
		
	if button_pressed == false:
		weapons_picked -= 1
		print(weapons_picked)
		Global.flame_beam_activated = false
		print(Global.flame_beam_activated)


func _on_flametrail_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		print(weapons_picked)
		Global.flame_trail_activated = true
		
	if button_pressed == false:
		weapons_picked -= 1
		print(weapons_picked)
		Global.flame_trail_activated = false
		print(Global.flame_trail_activated)


func _on_lightning_spray_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		print(weapons_picked)
		Global.lightning_spray_activated = true
		
	if button_pressed == false:
		weapons_picked -= 1
		print(weapons_picked)
		Global.lightning_spray_activated = false
		print(Global.lightning_spray_activated)
