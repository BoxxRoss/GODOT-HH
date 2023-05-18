extends KinematicBody2D

var speed = 110
var slowed = false
var four_coll_checker = 0
var motion = Vector2(0,0)
var ENEMYhealthmax : int = 30
var ENEMYhealth = ENEMYhealthmax
var target_pos = Vector2(0,0)
var enemy_spotted
onready var circle = get_node("Area2Dcirce/CollisionShape2D")

var targets = 0

var array_of_enemies = []


func enemy_death():
	queue_free()
	Global.deploy_ghost_count -= 1



	
func colided_with_enemy(damage):
	ENEMYhealth -= damage

	


func _on_Area2Dcirce_body_entered(body):
	if body.is_in_group("enemys"):
		targets += 1
		array_of_enemies.append(body)

func _on_Area2Dcirce_body_exited(body):
	if body.is_in_group("enemys"):
		targets -= 1
		array_of_enemies.erase(body)


func _physics_process(delta):
	
	if circle.scale < Vector2(5,5):
		circle.scale += Vector2(0.5,0.5)
	

	
	if ENEMYhealth <= 0:
		enemy_death()
	
	if four_coll_checker == 4:
		$Icon.modulate.a = lerp($Icon.modulate.a, 0, .05)
	else:
		$Icon.modulate.a = lerp($Icon.modulate.a, 1, .05)
		
		
		
	if slowed == true:
		speed = lerp(speed, 40, .1)
		$Light2D.energy = lerp($Light2D.energy, 1.2, .03)
		
	else:
		speed = lerp(speed, 110, .05)
		$Light2D.energy = lerp($Light2D.energy, 0, .03)

	

	if targets > 0:
		var target_posi = array_of_enemies[0]
		target_pos = target_posi.global_position
	else:
		target_pos = Vector2(0,0)
	
	if target_pos == Vector2(0, 0):
		pass
	else:
		motion = position.direction_to(target_pos) * speed
		motion = move_and_slide(motion)
		look_at(target_pos)











func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true
	if body.is_in_group("enemys"):
		body.enemy_death()
		
		var damage_taken
		
		if "enemy1" in body.name:
			damage_taken = 10
		
		colided_with_enemy(damage_taken)

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









