extends RigidBody2D

var damage = 0.1


func _process(delta):

	self.rotation_degrees = Global.ply_rotations
	self.position = Global.bullet_pos


	



func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	print("hit somthin")
	if body.is_in_group("enemys"):
		body.onhit(damage)
