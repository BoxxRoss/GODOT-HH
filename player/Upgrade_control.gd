extends Node2D

var has_upgrade_one = false
var has_upgrade_two = false
var has_upgrade_three = false
var has_upgrade_four = false
var has_upgrade_five = false
var has_upgrade_six = false
var	has_upgrade_sevean = false
var has_upgrade_eight = false
var has_upgrade_nine = false
var has_upgrade_ten = false

func _level_checks():
	
	if Global.kill_count >= 5 and has_upgrade_one == false:
		level_up()
		has_upgrade_one = true
		
	if Global.kill_count >= 10 and has_upgrade_two == false:
		level_up()
		has_upgrade_two = true
	
	if Global.kill_count >= 15 and has_upgrade_three == false:
		level_up()
		has_upgrade_three = true
		
	if Global.kill_count >= 20 and has_upgrade_four == false:
		level_up()
		has_upgrade_four = true
		
	if Global.kill_count >= 25 and has_upgrade_five == false:
		level_up()
		has_upgrade_five = true
		
	if Global.kill_count >= 30 and has_upgrade_six == false:
		level_up()
		has_upgrade_six = true
		
	if Global.kill_count >= 35 and has_upgrade_sevean == false:
		level_up()
		has_upgrade_sevean = true
		
	if Global.kill_count >= 40 and has_upgrade_eight == false:
		level_up()
		has_upgrade_eight = true
		
	if Global.kill_count >= 45 and has_upgrade_nine == false:
		level_up()
		has_upgrade_nine = true
		
	if Global.kill_count >= 50 and has_upgrade_ten == false:
		level_up()
		has_upgrade_ten = true
		
func level_up():
	Global.stamina_multi -= 0.05
	
func _physics_process(delta):
	_level_checks()
