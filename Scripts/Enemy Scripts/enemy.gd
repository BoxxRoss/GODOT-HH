extends "res://Enemys/Enemy_code/Basic_enemy's.gd"

onready var main_col = get_node("Collision_node/Area2D/CollisionShape2D")
onready var front_col = get_node("Collision_node/Area2Dfront")
onready var back_col = get_node("Collision_node/Area2Dback")
onready var left_col = get_node("Collision_node/Area2Dleft")
onready var right_col = get_node("Collision_node/Area2Dright")

onready var front_colly = get_node("Collision_node/Area2Dfront/CollisionShape2D")
onready var back_colly = get_node("Collision_node/Area2Dback/CollisionShape2D")
onready var left_colly = get_node("Collision_node/Area2Dleft/CollisionShape2D")
onready var right_colly = get_node("Collision_node/Area2Dright/CollisionShape2D")

onready var rock_particles = get_node("Icon/rocks")



		

func _ready() -> void:
	var rand_chance_for_rock = rand_range(0,2)
	if rand_chance_for_rock >= 1.4:
		rock = true
		ENEMY_rock_health = Global.base_rock_health
		
		rock_particles.emitting = true
	else:
		rock = false
		rock_particles.emitting = false
		ENEMY_rock_health = 0
		
	var rand_timer = rand_range(10,15)
	$Timer.wait_time = rand_timer
	$Timer.start()
	if unaware == true:
		disable()
	else:
		turn_on_coll()

	
	damage = 10
	ENEMYhealth = Global.base_enemy_health
	enemy_cost = 10
	enemy_is_horse = false
	
func _physics_process(delta):
	
	if rock != true:
		rock_particles.emitting = false

	rock_particles.modulate.a8 = ENEMY_rock_health * 5.0
	
	if rock_particles.amount == 1:
		rock_particles.visible = false
		
	if unaware:
		speed = 70
		



func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true
	
		
	if "out_of_bounds" in body.name:
		turn_on_coll()
	
	if "KinematicBody2D" in body.name:
		if being_Vac == false:
			enemy_death()
			Global.score -= 1
			body.take_a_hit()

func _on_Area2D_body_exited(body):
	if body is TileMap:
		slowed = false
		
func _on_Area2Dfront_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1
		
		

func _on_Area2Dfront_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dleft_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1

func _on_Area2Dleft_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dright_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1

func _on_Area2Dright_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dback_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1
		
func _on_Area2Dback_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

		
func turn_on_coll():
	print("turned o")
	unaware = false
	particles.emitting = true
	
	front_col.monitoring = true
	back_col.monitoring = true
	left_col.monitoring = true
	right_col.monitoring = true
	

	

func disable():
	print("turned off")
	
	particles.emitting = false
	
	front_col.monitoring = false
	back_col.monitoring = false
	left_col.monitoring = false
	right_col.monitoring = false


func _on_Timer_timeout():
	randomize()
	rand_x_patrol = rand_range(100,12000)
	rand_y_patrol = rand_range(100,6500)
