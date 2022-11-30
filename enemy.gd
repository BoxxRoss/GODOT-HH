extends KinematicBody2D


var motion = Vector2()




func _physics_process(delta):
	var Player = get_parent().get_node("KinematicBody2D")
	
	position += (Player.position - position)/60
	look_at(Player.position)
	
	move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		queue_free()
 
