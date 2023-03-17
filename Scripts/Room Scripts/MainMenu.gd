extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")



func _on_Quitbutton_pressed():
	get_tree().quit()


func _on_Start_Story_pressed():
	get_tree().change_scene("res://Rooms/battle_rooms/endless_level_2.tscn")
