extends Control



func _on_TextureButton_pressed():
	get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")


func _on_level_2_button_pressed():
	get_tree().change_scene("res://Rooms/battle_rooms/endless_level_2.tscn")
