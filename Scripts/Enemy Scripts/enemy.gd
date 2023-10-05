extends "res://Enemys/Enemy_code/Basic_enemy's.gd"

onready var main_col = get_node("Collision_node/Area2D/CollisionShape2D")
onready var front_col = get_node("Collision_node/Area2Dfront/CollisionShape2D")
onready var back_col = get_node("Collision_node/Area2Dback/CollisionShape2D")
onready var left_col = get_node("Collision_node/Area2Dleft/CollisionShape2D")
onready var right_col = get_node("Collision_node/Area2Dright/CollisionShape2D")

func _ready() -> void:
	var rand_timer = rand_range(10,15)
	$Timer.wait_time = rand_timer
	$Timer.start()
	if unaware == true:
		disable()
	else:
		turn_on_coll()
	
	damage = 10
	speed = 90
	ENEMYhealth = 100
	enemy_cost = 10
	enemy_is_horse = false

	
func _physics_process(delta):
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
	
	unaware = false
	
	
	front_col.disabled = false
	back_col.disabled = false
	left_col.disabled = false
	right_col.disabled = false
	

func disable():
	
	
	
	front_col.disabled = true
	back_col.disabled = true
	left_col.disabled = true
	right_col.disabled = true


func _on_Timer_timeout():
	randomize()
	rand_x_patrol = rand_range(100,12000)
	rand_y_patrol = rand_range(100,6500)
