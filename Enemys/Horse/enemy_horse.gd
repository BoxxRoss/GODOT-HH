extends "res://Enemys/Enemy_code/Basic_enemy's.gd"



func _ready() -> void:
	damage = 10
	speed = 500
	ENEMYhealth = 50
	enemy_cost = 15
	enemy_is_horse = true
	

	
	
func _physics_process(delta):
	
	if checker_1_horse == false:
		look_at(Player.position)
		
	
	var player_pos = Global.player_global_position
	var distance_to_player = global_position.distance_to(Global.player_global_position)
	var direction_to_player = global_position.direction_to(Global.player_global_position)

	
func turn_on_coll():
	unaware = false
	particles.emitting = true
	checker_1_horse = true

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
