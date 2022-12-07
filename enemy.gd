extends KinematicBody2D

var time_scale = 1

func _on_KinematicBody2D_slow_down():
	time_scale = 0.01
	print(time_scale)

export var ENEMYhealth : int = 3
var motion = Vector2()




func _process(delta):
	if ENEMYhealth <= 0:
		queue_free()	


func _physics_process(delta):
	var Player = get_parent().get_node("KinematicBody2D")
	
	position += (Player.position - position).normalized() 
	
	look_at(Player.position)
	



func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		ENEMYhealth -= 1
		print(ENEMYhealth)
 












