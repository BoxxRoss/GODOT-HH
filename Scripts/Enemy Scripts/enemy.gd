extends KinematicBody2D

export var ENEMYhealth : int = 3

func enemy_death():
	queue_free()
	Global.enemy_score -= 10
	Global.score += 1

func _process(delta):
	if ENEMYhealth <= 0:
		enemy_death()


func _physics_process(delta):
	
	var Player = get_parent().get_node("KinematicBody2D")
	
	position += (Player.position - position).normalized()
	
	look_at(Player.position)




func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		ENEMYhealth -= 1
		print(ENEMYhealth)
	if "KinematicBody2D" in body.name:
		enemy_death()
		Global.score -= 1


