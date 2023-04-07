extends Control

var level_options = [1,2]


func _on_Button_pressed():
	randomize()
	var rand_map = level_options[randi() % level_options.size()]
	
	if rand_map == 1:
		get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")
	if rand_map == 2:
		get_tree().change_scene("res://Rooms/battle_rooms/endless_level_2.tscn")

	Global.died = false
