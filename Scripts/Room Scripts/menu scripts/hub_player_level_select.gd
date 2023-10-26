extends Control


func _process(delta):
	$VBoxContainer/Label.text = Global.diff_selected
	if $VBoxContainer/Button.pressed == true:
		Global.diff_selected = "easy"
		$VBoxContainer/Button2.pressed = false
		$VBoxContainer/Button3.pressed = false
		
	if $VBoxContainer/Button2.pressed == true:
		Global.diff_selected = "normal"
		$VBoxContainer/Button.pressed = false
		$VBoxContainer/Button3.pressed = false
		
	if $VBoxContainer/Button3.pressed == true:
		Global.diff_selected = "hard"
		$VBoxContainer/Button.pressed = false
		$VBoxContainer/Button2.pressed = false
		
func _on_map_button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/level_select.tscn")


func _on_weapons_button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_upgrades/weapon_upgrades_control.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/MainMenu.tscn")
