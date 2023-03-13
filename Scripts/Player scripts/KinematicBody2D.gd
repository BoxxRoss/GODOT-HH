extends KinematicBody2D


# health related
var max_health = 50
var health = 50

# breathing mechanics
var breathless = false
var is_breathing = false

# stamina 
signal stamina_change
export var stamina = 100


# camera
signal camera_zoom
signal camera_zoom_out

# movement
signal player_rotation

var move = false
var movespeed = 6000 
var Sprint = false

# death and damage
signal damage_taken
signal player_death

# bullets and weapons

func _ready():
	emit_signal("damage_taken", health)

func _physics_process(delta):
	var motion = Vector2()
	move = false
	
	emit_signal("player_rotation", rotation)

	if Input.is_action_pressed("Up"):
		motion.y -= 1
		stamina = stamina - (0.05 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Down"):
		motion.y += 1
		stamina = stamina - (0.05 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Left"):
		motion.x -= 1
		stamina = stamina - (0.05 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)

	if Input.is_action_pressed("Right"):
		motion.x += 1
		stamina = stamina - (0.05 * Global.stamina_multi)
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_just_pressed("Breath"):
		stamina = stamina + 5
		emit_signal("camera_zoom")
		is_breathing = true
		Engine.time_scale = 0.05
		Engine.iterations_per_second = 45
		
	if Input.is_action_just_pressed("Cancel"):
		if is_breathing == true:
			is_breathing = false
			movespeed = 200
			emit_signal("camera_zoom_out")
			Engine.time_scale = 1
			Engine.iterations_per_second = 60
			
	if Input.is_action_pressed("Sprint") and breathless == false:
		Sprint = true
		movespeed = 300
		stamina = stamina - 0.2
	
	else:
		Sprint = false
	if stamina >= 100:
		stamina = 100
			
	if stamina < 0:
		stamina = 0
		movespeed = movespeed - 1
		breathless = true
		if movespeed <= 100:	
			movespeed = 100
	elif stamina > 10 and is_breathing == false:
		movespeed = movespeed + 1
		breathless = false
		if movespeed >= 200 and Sprint == false:
			movespeed = 200

	if move == false:
		stamina = stamina + 0.22
		emit_signal("stamina_change", stamina)

	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())


func kill():
	get_tree().reload_current_scene()
	health = max_health
	is_breathing = false
	emit_signal("damage_taken", health)
	Global.enemy_score = 0
	Engine.time_scale = 1
	Engine.iterations_per_second = 60
	emit_signal("player_death")


func _on_Area2D2_body_entered(body):
	if "enemy" in body.name:	
		health -= 10
		emit_signal("damage_taken", health)
		if is_breathing == true:
			kill()
		if health <= 0:
			kill()

			







