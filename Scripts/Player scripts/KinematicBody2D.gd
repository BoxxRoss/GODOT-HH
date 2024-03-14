extends KinematicBody2D


# health related
var max_health = 5
var health = 5

var boot = preload("res://player/boot/boot_prints.tscn")

# breathing mechanics
var breathless = false
var is_breathing = false

# stamina 
signal stamina_change
export var stamina = 10000

# camera
signal camera_zoom
signal camera_zoom_out

# movement
signal player_rotation

var move = false
var Sprint = false
var checker_1 = false
var move_up = 1.5
var move_down = 1.5
var move_left = 1.5
var move_right = 1.5

var movespeed = 500

# death and damage
signal damage_taken
signal player_death

# bullets and weapons

var selected_boot_num = 1
var selected_boot

var placehold = 0

func _ready():
	emit_signal("damage_taken", health)

func _physics_process(_delta):
	var motion = Vector2()
	move = false
	emit_signal("player_rotation", rotation)
	
	
	if selected_boot_num == 1:
		selected_boot = get_node("boot_control/left_boot")
		selected_boot_num = 0
	elif selected_boot_num == 0:
		selected_boot = get_node("boot_control/right_boot")
		selected_boot_num = 1
	
	Global.player_rotation_degrees = self.rotation_degrees
	Global.player_global_position = self.global_position
	Global.player_global_position_y = self.global_position.y
	Global.player_global_position_x = self.global_position.x
	Global.player_position = self.position
	
	if Input.is_action_pressed("Up"):
		motion.y -= move_up
		stamina = stamina - (0 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Down"):
		motion.y += move_down
		stamina = stamina - (0 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Left"):
		motion.x -= move_left
		stamina = stamina - (0 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)

	if Input.is_action_pressed("Right"):
		motion.x += move_right
		stamina = stamina - (0 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_just_pressed("Breath"):
		stamina = stamina + 5
		emit_signal("camera_zoom")
		is_breathing = true
		Engine.time_scale = 0.1
		Engine.iterations_per_second = 50
		
	if Input.is_action_just_pressed("Cancel"):
		if is_breathing == true:
			is_breathing = false
			movespeed = 100
			emit_signal("camera_zoom_out")
			Engine.time_scale = 1
			Engine.iterations_per_second = 60
			
	if Input.is_action_pressed("Sprint") and breathless == false:
		Sprint = true
		movespeed = 200
		stamina = stamina - 0
	else:
		Sprint = false
		movespeed = 150
	if Input.is_action_just_pressed("test spawn"):
		Global.enemy_test += 1
	

	if stamina >= 100:
		stamina = 100
			
	if stamina < 0:
		stamina = 0
		movespeed = movespeed - 1
		breathless = true
		if movespeed <= 100:	
			movespeed = 100


		
	if move == false:
		stamina = stamina + 0.22
		emit_signal("stamina_change", stamina)

	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
	
	
	
	if move == true:
		placehold += 1
		if placehold == 15:
			placehold = 0
			var boot_instance = boot.instance()
			boot_instance.position = selected_boot.global_position

			boot_instance.rotation_degrees = global_rotation_degrees
			get_tree().get_root().call_deferred("add_child", boot_instance)
			
			

	

	
	
	
func kill():
	Global.died = true
	get_tree().change_scene("res://Rooms/menu_rooms/death_screen.tscn")
	health = max_health
	is_breathing = false
	emit_signal("damage_taken", health)
	Global.enemy_score = 0
	Engine.time_scale = 1
	Engine.iterations_per_second = 60
	emit_signal("player_death")
	
	


func take_a_hit():
	health -= 1
	emit_signal("damage_taken")
	if is_breathing == true:
		kill()
	if health <= 0:
		kill()


func _on_Area2D3_body_entered(body):
	body.turn_on_coll()
