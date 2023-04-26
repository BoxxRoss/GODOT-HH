extends Control

var weapons_limit = 3
var weapons_picked = 0
var flamethrower = 0
var lightspray = 0
var heatbeam = 0
var firetrail = 0
var lightball = 0
var lighttrip = 0



#we need to figure out how to make it so that if a variable is false it undoes a button

func _process(delta):
	if Input.is_action_pressed("Shoot"):
		print(weapons_picked)

func _on_flamethrower_toggled(button_pressed):
	if button_pressed and weapons_picked < weapons_limit:
		weapons_picked += 1
		flamethrower = 1
		Global.flame_thrower_activcated = true
		
	elif button_pressed == false and flamethrower == 1:
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
		
	elif button_pressed == false and lighttrip == 1:
		weapons_picked -= 1
		lighttrip = 0
		Global.lightning_tripwire_activated = false
	else:
		$lightning_tripwire.pressed = false
