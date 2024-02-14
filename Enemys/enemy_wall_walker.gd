extends "res://Enemys/Enemy_code/Basic_enemy's.gd"

onready var main_col = get_node("Collision_node/Area2D/CollisionShape2D")

func _ready():
	var rand_timer = rand_range(10,15)
	$Timer.wait_time = rand_timer
	$Timer.start()
	if unaware == true:
		disable()
	else:
		turn_on_coll()
	is_wall_walker = true
	
	damage = 10
	ENEMYhealth = Global.base_enemy_health
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
		

		
func turn_on_coll():
	unaware = false
	particles.emitting = true

func disable():
	particles.emitting = false
	

func _on_Timer_timeout():
	randomize()
	rand_x_patrol = rand_range(100,12000)
	rand_y_patrol = rand_range(100,6500)

func _on_Area2DLine_body_entered(body):
	if body is TileMap:
		four_coll_checker = true

func _on_Area2DLine_body_exited(body):
	if body is TileMap:
		four_coll_checker = false
