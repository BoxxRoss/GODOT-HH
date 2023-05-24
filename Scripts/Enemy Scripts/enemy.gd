extends "res://Enemys/Enemy_code/Basic_enemy's.gd"

func _ready() -> void:
	damage = 10
	speed = 100
	ENEMYhealth = 100
	enemy_cost = 10
	enemy_is_horse = false
	
func _physics_process(delta):

	var player_pos = Global.player_global_position
	var distance_to_player = global_position.distance_to(Global.player_global_position)
	var direction_to_player = global_position.direction_to(Global.player_global_position)
	
func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true
		
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



















