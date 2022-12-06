extends KinematicBody2D

var move = false
var stamina = 100
var fire_rate = 0.5
var movespeed = 200
var bullet_speed = 750
var bullet = preload("res://Projectile/bullets.tscn")
var can_fire = true

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var motion = Vector2()
	move = false
	if Input.is_action_pressed("Up"):
		motion.y -= 1
		stamina = stamina - 0.1
		print(stamina)
		move = true

		
	if Input.is_action_pressed("Down"):
		motion.y += 1
		stamina = stamina - 0.1
		print(stamina)
		move = true

		
	if Input.is_action_pressed("Left"):
		motion.x -= 1
		stamina = stamina - 0.1
		print(stamina)
		move = true

		
	if Input.is_action_pressed("Right"):
		motion.x += 1
		stamina = stamina - 0.1
		print(stamina)
		move = true

		
	if stamina >= 100:
		stamina = 100
			
	if stamina < 0:
		stamina = 0
		movespeed = movespeed - 1
		if movespeed <= 100:	
			movespeed = 100
	elif stamina > 0:
		movespeed = movespeed + 1
		if movespeed >= 200:
			movespeed = 200

	if move == false:
		stamina = stamina + 0.22
	print (stamina)
		
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())


		
	if Input.is_action_just_pressed("Shoot") and can_fire and stamina > 10:
		fire()

func fire ():
	var bullet_instance = bullet.instance()
	bullet_instance.position = $bulletpoint.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire = true
	stamina = stamina - 10
func kill ():
	get_tree().reload_current_scene()
	
	





func _on_Area2D_body_entered(body):
	if "enemy" in body.name:
		kill()
