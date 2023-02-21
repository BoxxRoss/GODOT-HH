extends KinematicBody2D

var slowed = false
var motion = Vector2(0 , 0)
var speed = 50
var ENEMYhealth : int = 1

func enemy_death():
	queue_free()
	Global.enemy_score -= 10
	Global.score += 1
	Global.kill_count += 1

func _process(delta):
	if ENEMYhealth <= 0:
		enemy_death()
	
	if Global.enemy_hit == true:
		queue_free()
		Global.enemy_hit = false
	"""
func _physics_process(delta):
	

		
	var Player = get_parent().get_node("KinematicBody2D")
	
	motion = position.direction_to(Player.position) * speed
	motion = move_and_slide(motion)
	look_at(Player.position)

	
	
	if slowed == true:
		speed = 50
	else:
		speed = 50
	"""

func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		queue_free()
		print("enemy hit by bullet!")

	if body is TileMap:
		slowed = true

	
	if "flare" in body.name:

		print("enemy hit by flare!")
	
	if "KinematicBody2D" in body.name:
		enemy_death()
		Global.score -= 1




func _on_Area2D_body_exited(body):
	if body is TileMap:
		slowed = false
