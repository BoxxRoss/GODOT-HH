extends Control




func _on_map_button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/level_select.tscn")


func _on_weapons_button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/weapons_lab.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/MainMenu.tscn")
