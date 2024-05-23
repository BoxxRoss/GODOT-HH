extends "res://Enemys/Enemy_code/Basic_enemy's.gd"

onready var main_col = get_node("Collision_node/Area2D/CollisionShape2D")
var projectile = preload("res://Enemys/Enemy_range/enemy_range_projectile.tscn")
onready var rock_particles = get_node("Icon/rocks")
var firing = false

func _ready() -> void:
	is_wimp = false
	var rand_chance_for_rock = rand_range(0,0)
	if rand_chance_for_rock == 1.4:
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
	ENEMYhealth = Global.base_enemy_wimp_health
	enemy_cost = 10
	enemy_is_horse = false
	
func _physics_process(delta):
	if is_range and firing == false:
		firing = true
		
		yield(get_tree().create_timer(0.5), "timeout")
		
		var range_ball = projectile.instance()
		get_tree().get_root().call_deferred("add_child", range_ball)
		range_ball.position = $Collision_node/Position2D.get_global_position()
		range_ball.apply_impulse(Vector2(),Vector2(250.0,0).rotated(self.rotation))
		range_ball.rotation_degrees = self.global_rotation_degrees
		
		
		
		firing = false
		
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

func _on_Area2DDetection_body_entered(body):

	if body.is_in_group("player"):
		is_range = true



func _on_Area2DDetection_body_exited(body):

	if body.is_in_group("player"):
		is_range = false


