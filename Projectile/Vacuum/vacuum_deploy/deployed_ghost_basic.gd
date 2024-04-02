extends KinematicBody2D

var speed = 120
var slowed = false
var four_coll_checker = 0
var motion = Vector2(0,0)
var ENEMYhealthmax : int = 30
var ENEMYhealth = ENEMYhealthmax
var target_pos = Vector2(0,0)
var enemy_spotted
var rotation_speed = PI
onready var circle = get_node("Area2Dcirce/CollisionShape2D")

var targets = 0

var distract_pow = rand_range(0.0,100.0)
var following_player : bool = false
var array_of_enemies = []
var target_pos_follow_decider = rand_range(0,1)
var target_pos_follow = null
var target_pos_player_distance

func _ready():
	Global.friend_ghost_has_died = false
	if target_pos_follow_decider > 0.5:
		target_pos_follow = -50
	else:
		target_pos_follow = 50
	target_pos_player_distance = Vector2(50,target_pos_follow)

func enemy_death():
	queue_free()
	Global.friend_ghost_has_died = true
	Global.deploy_ghost_count -= 1



	
func colided_with_enemy(damage):
	ENEMYhealth -= 5

	


func _on_Area2Dcirce_body_entered(body):
	if body.is_in_group("enemys"):
		targets += 1
		array_of_enemies.append(body)
		body.find_target(distract_pow)

func _on_Area2Dcirce_body_exited(body):
	if body.is_in_group("enemys"):
		targets -= 1
		array_of_enemies.erase(body)


func _physics_process(delta):
	
	if targets != 0 or following_player:
		var vector_to_enemy = target_pos - self.global_position
		var angle = vector_to_enemy.angle()
		var r = global_rotation
		var angle_delta = rotation_speed * delta
		angle = lerp_angle(r, angle, 1.0)
		angle = clamp(angle, r - angle_delta, r + angle_delta)
		global_rotation = angle
	
		
	
	Global.friend_ghost_basic_pos = self.global_position
	
	if circle.scale < Vector2(15,15):
		circle.scale += Vector2(0.5,0.5)
	

	
	if ENEMYhealth <= 0:
		enemy_death()
	
	if four_coll_checker == 4:
		$Icon.modulate.a = lerp($Icon.modulate.a, 0, .05)
	else:
		$Icon.modulate.a = lerp($Icon.modulate.a, 1, .05)
		
		
		
	if slowed == true:
		speed = lerp(speed, 60, .1)
		$Light2D.energy = lerp($Light2D.energy, 1.2, .03)
		
	else:
		speed = lerp(speed, 120, .05)
		$Light2D.energy = lerp($Light2D.energy, 0, .03)




	if targets > 0:
		var target_posi = array_of_enemies[0]
		target_pos = target_posi.global_position
	else:
		target_pos = Vector2(0,0)
		
	
	if target_pos == Vector2(0, 0) or target_pos == Global.player_global_position - target_pos_player_distance:
		
		$Icon/Particles2D.modulate.a8 = lerp($Icon/Particles2D.modulate.a8,100,0.1)
		target_pos = Global.player_global_position - target_pos_player_distance
		following_player = true
		motion = position.direction_to(target_pos) * speed
		motion = move_and_slide(motion)
	else:
		following_player = false
		motion = position.direction_to(target_pos) * speed
		motion = move_and_slide(motion)
		$Icon/Particles2D.modulate.a8 = lerp($Icon/Particles2D.modulate.a8,255,0.05)










func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true
	if body.is_in_group("enemys"):
		body.enemy_death()
		
		var damage_taken
		
		if "enemy1" in body.name:
			damage_taken = 10
		if "enemy_snake" in body.name:
			damage_taken = 5
		if "enemy_horse" in body.name:
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









