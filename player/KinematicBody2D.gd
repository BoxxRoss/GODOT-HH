extends KinematicBody2D


var is_breathing = false
var move = false
export var stamina = 100
signal stamina_change
signal camera_zoom
signal camera_zoom_out
signal slow_down
var fire_rate = 0.5
var movespeed = 200
var bullet_speed = 750
var bullet = preload("res://Projectile/bullets.tscn")
var can_fire = true
var Sprint = false

func _physics_process(delta):
	var motion = Vector2()
	move = false
	
	
		
	
	if Input.is_action_pressed("Up"):
		motion.y -= 1
		stamina = stamina - 0.05
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Down"):
		motion.y += 1
		stamina = stamina - 0.05
		move = true
		emit_signal("stamina_change", stamina)
		
	if Input.is_action_pressed("Left"):
		motion.x -= 1
		stamina = stamina - 0.05
		move = true
		emit_signal("stamina_change", stamina)

		
	if Input.is_action_pressed("Right"):
		motion.x += 1
		stamina = stamina - 0.05
		move = true
		emit_signal("stamina_change", stamina)
		
		
	if Input.is_action_just_pressed("Breath"):
		stamina = stamina + 5
		emit_signal("camera_zoom")
		emit_signal("slow_down")
		is_breathing = true
		Engine.time_scale = 0.05
		
	if Input.is_action_just_pressed("Cancel"):
		if is_breathing == true:
			is_breathing = false
			movespeed = 200
			emit_signal("camera_zoom_out")
			Engine.time_scale = 1
	
	if Input.is_action_pressed("Sprint"):
		Sprint = true
		movespeed = 300
		print(movespeed)
		stamina = stamina - 0.2
		
	else:
		Sprint = false
		
	if stamina >= 100:
		stamina = 100
			
	if stamina < 0:
		stamina = 0
		movespeed = movespeed - 1
		if movespeed <= 100:	
			movespeed = 100
	elif stamina > 0 and is_breathing == false:
		movespeed = movespeed + 1
		if movespeed >= 200 and Sprint == false:
			movespeed = 200

	if move == false:
		stamina = stamina + 0.22
		emit_signal("stamina_change", stamina)

		
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())


		
	if Input.is_action_just_pressed("Shoot") and can_fire and stamina > 10 and is_breathing != true:
		fire()
		emit_signal("stamina_change", stamina)

func fire ():
	stamina = stamina - 5
	var bullet_instance = bullet.instance()
	bullet_instance.position = $bulletpoint.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire = true
	
	
func kill ():
	get_tree().reload_current_scene()
	Engine.time_scale = 1




func _on_Area2D_body_entered(body):
	if "enemy" in body.name:
		kill()


