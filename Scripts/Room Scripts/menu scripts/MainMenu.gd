extends Control

var hand = preload("res://Sprites/Menu_backgrounds/hand.png")
var hand2 = preload("res://Sprites/Menu_backgrounds/hand-expor2t.png")

var checker_one = true

onready var start_button = get_node("VBoxContainer/StartButton")
onready var options_button = get_node("VBoxContainer/Optionsbutton")
onready var quit_button = get_node("VBoxContainer/Quitbutton")

onready var box = get_node("VBoxContainer")



var level_options = [1,2]
var level_chosen_from_menu : int
var timer_check = false

var rand_y = 360
var rand_e = 360

var rand_ene = 1
var rand_vis = 255

func enter():
	$VBoxContainer/StartButton/AnimationPlayer.play_backwards("slide (copy)")
	$VBoxContainer/Optionsbutton/AnimationPlayer.play_backwards("options_slide")
	$VBoxContainer/Quitbutton/AnimationPlayer.play_backwards("quit_slide")
	
	while start_button.modulate.a < 1.0 or quit_button.modulate.a < 1.0 or quit_button.modulate.a < 1.0:
		yield(get_tree().create_timer(0.08), "timeout")
		start_button.modulate.a += 0.09
		options_button.modulate.a += 0.09
		quit_button.modulate.a += 0.09
		$logo.modulate.a += 0.09
		

func _ready():
	Global.level_id_picked = 0
	_on_flicker_timeout()
	start_button.modulate.a = 0
	options_button.modulate.a = 0
	quit_button.modulate.a = 0
	enter()
	
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
		rand_vis = rand_range(25,100)
		
		timer_check = false
		
	$static.position.y = lerp($static.position.y,rand_y,0.5) 
	$static.modulate.a8 = lerp($static.modulate.a8,rand_vis,0.5)
	
	$Light2D.position.y = lerp($Light2D.position.y ,rand_e,0.5) 
	$Light2D.energy = lerp($Light2D.energy,rand_ene,0.5)
	
func _on_StartButton_pressed():
	
	transition()
	
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Rooms/menu_rooms/weapon_labs/weapons_lab.tscn")
	level_chosen_from_menu = 1
	Global.level_id_picked = level_chosen_from_menu
	

func _on_Quitbutton_pressed():
	get_tree().quit()

func _on_test_level_pressed():
	get_tree().change_scene("res://Rooms/test_room/test_room.tscn")

func _on_flicker_timeout():
	timer_check = true
	$flicker.wait_time = rand_range(0.15,0.3)
	$flicker.start()


func transition():
	$VBoxContainer/StartButton/AnimationPlayer.play("slide (copy)")
	$VBoxContainer/Optionsbutton/AnimationPlayer.play("options_slide")
	$VBoxContainer/Quitbutton/AnimationPlayer.play("quit_slide")
	while start_button.modulate.a > 0 or quit_button.modulate.a > 0 or quit_button.modulate.a > 0:
		yield(get_tree().create_timer(0.08), "timeout")
		start_button.modulate.a -= 0.09
		options_button.modulate.a -= 0.09
		quit_button.modulate.a -= 0.09
		$logo.modulate.a -= 0.2
		
		
			

	
	
	
