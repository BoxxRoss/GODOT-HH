extends Control


var hand = preload("res://Sprites/Menu_backgrounds/hand.png")
var hand2 = preload("res://Sprites/Menu_backgrounds/hand-expor2t.png")

var timer_check = false

var rand_y = 360
var rand_e = 360

var rand_ene = 1
var rand_vis = 255

func exit():
	$Button/AnimationPlayer.play("down_slide")
	$Sprite/AnimationPlayer.play_backwards("tut")
	while $Info.modulate.a > 0:
		yield(get_tree().create_timer(0.08), "timeout")
		$Info.modulate.a -= 0.09


func enter():
	$Button/AnimationPlayer.play_backwards("down_slide")
	$Sprite/AnimationPlayer.play("tut")
	while $Info.modulate.a < 1.0:
		yield(get_tree().create_timer(0.08), "timeout")
		$Info.modulate.a += 0.09


func _ready():
	$Info.modulate.a = 0
	enter()
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
		rand_y = rand_range(60,260)
		rand_e = rand_range(260,460)
		
		rand_ene = rand_range(0.5,1.0)
		rand_vis = rand_range(25,100)
		
		timer_check = false
		
	$static.position.y = lerp($static.position.y,rand_y,0.5) 
	$static.modulate.a8 = lerp($static.modulate.a8,rand_vis,0.5)
	
	$Light2D.position.y = lerp($Light2D.position.y ,rand_e,0.5) 
	$Light2D.energy = lerp($Light2D.energy,rand_ene,0.5)


func _on_flicker_timeout():
	timer_check = true
	$flicker.wait_time = rand_range(0.15,0.3)
	$flicker.start()


func _on_Button_pressed():
	exit()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Rooms/menu_rooms/MainMenu.tscn")
