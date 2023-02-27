extends KinematicBody2D

var slowed = false
var motion = Vector2(0 , 0)
var speed = 125
var ENEMYhealthmax : int = 1
var ENEMYhealth = ENEMYhealthmax

func enemy_death():
	queue_free()
	Global.enemy_score -= 10
	Global.score += 1
	Global.kill_count += 1

func onhit(damage):
	ENEMYhealth -= 0.2
	

func _physics_process(delta):
	
	if ENEMYhealth <= 0:
		enemy_death()

		

	if Global.switch:
		var Player = get_parent().get_node("KinematicBody2D")
	
		motion = position.direction_to(Player.position) * speed
		motion = move_and_slide(motion)
		look_at(Player.position)

	
	
	if slowed == true:
		speed = 50
	else:
		speed = 125
	

func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true

	if "KinematicBody2D" in body.name:
		enemy_death()
		Global.score -= 1




func _on_Area2D_body_exited(body):
	if body is TileMap:
		slowed = false
