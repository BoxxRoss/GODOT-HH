extends Control

var hand = preload("res://Sprites/Menu_backgrounds/hand.png")
var hand2 = preload("res://Sprites/Menu_backgrounds/hand-expor2t.png")

var level_options = [1,2]
var level_chosen_from_menu : int
var timer_check = false

var rand_y = 360
var rand_e = 360

var rand_ene = 1
var rand_vis = 255

func _ready():
	Global.level_id_picked = 0
	_on_flicker_timeout()
	
	
	
	
func _process(delta):
	
	if Input.is_action_pressed("Shoot"):
		$hand.texture = hand2
		if Input.is_action_pressed("Shoot"):
			$hand.texture = hand2
	if Input.is_action_just_released("Shoot"):
		$hand.texture = hand
		
	$hand.global_position = get_global_mouse_position()
	
	if timer_check:
		rand_y = rand_range(260,460)
		rand_e = rand_range(260,460)
		
		rand_ene = rand_range(0.5,1.0)
		rand_vis = rand_range(25,250)
		
		timer_check = false
		
	$static.position.y = lerp($static.position.y,rand_y,0.5) 
	$static.modulate.a8 = lerp($static.modulate.a8,rand_vis,0.5)
	
	$Light2D.position.y = lerp($Light2D.position.y ,rand_e,0.5) 
	$Light2D.energy = lerp($Light2D.energy,rand_ene,0.5)
	
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

func _on_flicker_timeout():
	timer_check = true
	$flicker.wait_time = rand_range(0.15,0.3)
	$flicker.start()
