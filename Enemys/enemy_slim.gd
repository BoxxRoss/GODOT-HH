extends KinematicBody2D


var damage_dealt
var hurt = false
var slowed = false
var motion = Vector2(0 , 0)
var speed = 200
var ENEMYhealthmax : int = 50
var ENEMYhealth = ENEMYhealthmax

func taking_damage(weapon_damage):
	hurt = true
	damage_dealt = weapon_damage
	print(weapon_damage)
func taking_damage_stop():
	hurt = false
	
func enemy_death():
	queue_free()
	Global.enemy_score -= 10
	Global.score += 1
	Global.kill_count += 1

func onhit(damage):
	ENEMYhealth -= damage



func _physics_process(delta):
	
	if ENEMYhealth <= 0:
		enemy_death()


	if hurt == true:
		
		ENEMYhealth -= damage_dealt
	

	

	var Player = get_parent().get_node("KinematicBody2D")
	
	motion = position.direction_to(Player.position) * speed
	motion = move_and_slide(motion)
	look_at(Player.position)

	
	
	if slowed == true:
		speed = 50
	else:
		speed = 150



func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true

	if "KinematicBody2D" in body.name:
		enemy_death()
		Global.score -= 1
		body.take_a_hit()




func _on_Area2D_body_exited(body):
	if body is TileMap:
		slowed = false
