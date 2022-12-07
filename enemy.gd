extends KinematicBody2D

export var ENEMYhealth : int = 3
var motion = Vector2()


func _process(delta):
	if ENEMYhealth <= 0:
		queue_free()	

"""
func _physics_process(delta):
	var Player = get_parent().get_node("KinematicBody2D")
	
	position += (Player.position - position).normalized() 
	look_at(Player.position)
	
	move_and_collide(motion)
"""

func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		ENEMYhealth -= 1
		print(ENEMYhealth)
 
