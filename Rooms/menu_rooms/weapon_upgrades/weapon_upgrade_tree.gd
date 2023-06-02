extends Control

var weapon_chosen : int


var upgrade_to_be_shown = 0
var prev_shown_upgrade = 0

var Tier1_chosen = 0
var Tier2_chosen = 0
var Tier3_chosen = 0
var Tier4_chosen = 0
var Tier5_chosen = 0

var upgrade1T1_pressed = false
var upgrade2T1_pressed = false
var upgrade3T1_pressed = false

var upgrade1T2_pressed = false
var upgrade2T2_pressed = false
var upgrade3T2_pressed = false

var upgrade1T3_pressed = false
var upgrade2T3_pressed = false
var upgrade3T3_pressed = false

var upgrade1T4_pressed = false
var upgrade2T4_pressed = false
var upgrade3T4_pressed = false

var upgrade1T5_pressed = false
var upgrade2T5_pressed = false
var upgrade3T5_pressed = false

func _on_upgrade1T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen != 1:
		$teir1/upgrade2T1.pressed = false
		$teir1/upgrade3T1.pressed = false
		
		Tier1_chosen = 1
		if upgrade_to_be_shown != 1:
			upgrade_to_be_shown = 1
		upgrade1T1_pressed = true
	else:
		$teir1/upgrade1T1.pressed = false	
		Tier1_chosen = 0
		upgrade_to_be_shown = 0
		upgrade1T1_pressed = false
			
func _on_upgrade2T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen != 2:
		$teir1/upgrade1T1.pressed = false
		$teir1/upgrade3T1.pressed = false
		
		Tier1_chosen = 2
		if upgrade_to_be_shown != 2:
			upgrade_to_be_shown = 2
		upgrade2T1_pressed = true
	else:
		$teir1/upgrade2T1.pressed = false	
		Tier1_chosen = 0
		upgrade_to_be_shown = 0

		upgrade2T1_pressed = false
			
func _on_upgrade3T1_toggled(button_pressed):
	if button_pressed == true and Tier1_chosen != 3:
		$teir1/upgrade1T1.pressed = false
		$teir1/upgrade2T1.pressed = false

		Tier1_chosen = 3
		if upgrade_to_be_shown != 3:
			upgrade_to_be_shown = 3
		upgrade3T1_pressed = true
	else:
		$teir1/upgrade3T1.pressed = false	
		Tier1_chosen = 0
		upgrade_to_be_shown = 0
		upgrade3T1_pressed = false



func _on_upgrade1T2_toggled(button_pressed):
	if button_pressed == true and Tier2_chosen != 1:
		$teir2/upgrade2T2.pressed = false
		$teir2/upgrade3T2.pressed = false
		
		Tier2_chosen = 1
		if upgrade_to_be_shown != 4:
			upgrade_to_be_shown = 4
		upgrade1T2_pressed = true
	else:
		$teir2/upgrade1T2.pressed = false	
		Tier2_chosen = 0
		upgrade_to_be_shown = 0
		upgrade1T2_pressed = false

func _on_upgrade2T2_toggled(button_pressed):
	if button_pressed == true and Tier2_chosen != 2:
		$teir2/upgrade1T2.pressed = false
		$teir2/upgrade3T2.pressed = false
		
		Tier2_chosen = 2
		if upgrade_to_be_shown != 5:
			upgrade_to_be_shown = 5
		upgrade2T2_pressed = true
	else:
		$teir2/upgrade2T2.pressed = false	
		Tier2_chosen = 0
		upgrade_to_be_shown = 0
		upgrade2T2_pressed = false

func _on_upgrade3T2_toggled(button_pressed):
	if button_pressed == true and Tier2_chosen != 3:
		$teir2/upgrade1T2.pressed = false
		$teir2/upgrade2T2.pressed = false

		Tier2_chosen = 3
		if upgrade_to_be_shown != 6:
			upgrade_to_be_shown = 6
		upgrade3T2_pressed = true
	else:
		$teir2/upgrade3T2.pressed = false	
		Tier2_chosen = 0
		upgrade_to_be_shown = 0
		upgrade3T2_pressed = false

func _on_upgrade1T3_toggled(button_pressed):
	if button_pressed == true and Tier3_chosen != 1:
		$teir3/upgrade2T3.pressed = false
		$teir3/upgrade3T3.pressed = false

		Tier2_chosen = 1
		if upgrade_to_be_shown != 7:
			upgrade_to_be_shown = 7
		upgrade1T3_pressed = true
	else:
		$teir3/upgrade1T3.pressed = false	
		Tier3_chosen = 0
		upgrade_to_be_shown = 0
		upgrade1T3_pressed = false

func _on_upgrade2T3_toggled(button_pressed):
	if button_pressed == true and Tier3_chosen != 2:
		$teir3/upgrade1T3.pressed = false
		$teir3/upgrade3T3.pressed = false

		Tier3_chosen = 2
		if upgrade_to_be_shown != 8:
			upgrade_to_be_shown = 8
		upgrade2T3_pressed = true
	else:
		$teir3/upgrade2T3.pressed = false	
		Tier3_chosen = 0
		upgrade_to_be_shown = 0
		upgrade2T3_pressed = false

func _on_upgrade3T3_toggled(button_pressed):
	if button_pressed == true and Tier2_chosen != 3:
		$teir3/upgrade1T3.pressed = false
		$teir3/upgrade2T3.pressed = false

		Tier3_chosen = 3
		if upgrade_to_be_shown != 9:
			upgrade_to_be_shown = 9
		upgrade3T3_pressed = true
	else:
		$teir3/upgrade3T3.pressed = false	
		Tier3_chosen = 0
		upgrade_to_be_shown = 0
		upgrade3T3_pressed = false



func _on_upgrade1T4_toggled(button_pressed):
	if button_pressed == true and Tier4_chosen != 1:
		$teir4/upgrade2T4.pressed = false
		$teir4/upgrade3T4.pressed = false

		Tier4_chosen = 1
		if upgrade_to_be_shown != 10:
			upgrade_to_be_shown = 10
		upgrade1T4_pressed = true
	else:
		$teir4/upgrade1T4.pressed = false	
		Tier4_chosen = 0
		upgrade_to_be_shown = 0
		upgrade1T4_pressed = false

func _on_upgrade2T4_toggled(button_pressed):
	if button_pressed == true and Tier4_chosen != 2:
		$teir4/upgrade1T4.pressed = false
		$teir4/upgrade3T4.pressed = false

		Tier4_chosen = 2
		if upgrade_to_be_shown != 11:
			upgrade_to_be_shown = 11
		upgrade2T4_pressed = true
	else:
		$teir4/upgrade2T4.pressed = false	
		Tier4_chosen = 0
		upgrade_to_be_shown = 0
		upgrade2T4_pressed = false

func _on_upgrade3T4_toggled(button_pressed):
	if button_pressed == true and Tier4_chosen != 3:
		$teir4/upgrade1T4.pressed = false
		$teir4/upgrade2T4.pressed = false

		Tier4_chosen = 3
		if upgrade_to_be_shown != 12:
			upgrade_to_be_shown = 12
		upgrade3T4_pressed = true
	else:
		$teir4/upgrade3T4.pressed = false	
		Tier4_chosen = 0
		upgrade_to_be_shown = 0
		upgrade3T4_pressed = false



func _on_upgrade1T5_toggled(button_pressed):
	if button_pressed == true and Tier5_chosen != 1:
		$teir5/upgrade2T5.pressed = false
		$teir5/upgrade3T5.pressed = false

		Tier5_chosen = 1
		if upgrade_to_be_shown != 13:
			upgrade_to_be_shown = 13
		upgrade1T5_pressed = true
	else:
		$teir5/upgrade1T5.pressed = false	
		Tier5_chosen = 0
		upgrade_to_be_shown = 0
		upgrade1T5_pressed = false

func _on_upgrade2T5_toggled(button_pressed):
	if button_pressed == true and Tier5_chosen != 2:
		$teir5/upgrade1T5.pressed = false
		$teir5/upgrade3T5.pressed = false

		Tier5_chosen = 2
		if upgrade_to_be_shown != 14:
			upgrade_to_be_shown = 14
		upgrade2T5_pressed = true
	else:
		$teir5/upgrade2T5.pressed = false	
		Tier5_chosen = 0
		upgrade_to_be_shown = 0
		upgrade2T5_pressed = false

func _on_upgrade3T5_toggled(button_pressed):
	if button_pressed == true and Tier5_chosen != 3:
		$teir5/upgrade1T5.pressed = false
		$teir5/upgrade2T5.pressed = false

		Tier5_chosen = 3
		if upgrade_to_be_shown != 15:
			upgrade_to_be_shown = 15
		upgrade3T5_pressed = true
	else:
		$teir5/upgrade3T5.pressed = false	
		Tier5_chosen = 0
		upgrade_to_be_shown = 0
		upgrade3T5_pressed = false
