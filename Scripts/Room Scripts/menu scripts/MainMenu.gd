extends Control

var level_options = [1,2]
var level_chosen_from_menu : int

func _ready():
	Global.level_id_picked = 0

func _on_StartButton_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapons_lab.tscn")
	level_chosen_from_menu = 1
	Global.level_id_picked = level_chosen_from_menu


func _on_Quitbutton_pressed():
	get_tree().quit()


func _on_Start_Story_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapons_lab.tscn")
	level_chosen_from_menu = 2
	Global.level_id_picked = level_chosen_from_menu

func _on_Button_pressed():
	get_tree().change_scene("res://Rooms/menu_rooms/hub_player_level_select.tscn")


func _on_random_level_pressed():
	randomize()
	var rand_map = level_options[randi() % level_options.size()]
	
	if rand_map == 1:
		get_tree().change_scene("res://Rooms/battle_rooms/endless_room.tscn")
		level_chosen_from_menu = 1
		Global.level_id_picked = level_chosen_from_menu
	if rand_map == 2:
		get_tree().change_scene("res://Rooms/battle_rooms/endless_level_2.tscn")
		level_chosen_from_menu = 2
		Global.level_id_picked = level_chosen_from_menu


func _on_test_level_pressed():
	get_tree().change_scene("res://Rooms/test_room/test_room.tscn")
