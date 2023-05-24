extends Control


var Tier1_chosen = 0
var Tier2_chosen
var Tier3_chosen
var Tier4_chosen
var Tier5_chosen


func _on_upgrade1T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen == 0:

		Tier1_chosen = 1

	else:
		$teir1/upgrade1T1.pressed = false	
		Tier1_chosen = 0
		
func _on_upgrade2T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen == 0:

		Tier1_chosen = 2

	else:
		$teir1/upgrade2T1.pressed = false	
		Tier1_chosen = 0


func _on_upgrade3T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen == 0:
		Tier1_chosen = 3

	else:
		$teir1/upgrade3T1.pressed = false	
		Tier1_chosen = 0



func _on_upgrade1T2_toggled(button_pressed):
	pass # Replace with function body.


func _on_upgrade2T2_toggled(button_pressed):
	pass # Replace with function body.


func _on_upgrade3T2_toggled(button_pressed):
	pass # Replace with function body.
