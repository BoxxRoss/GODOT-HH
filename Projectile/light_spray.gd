extends RigidBody2D




func _process(delta):

	self.rotation_degrees = Global.ply_rotations
	self.position = Global.bullet_pos


	



func _on_Timer_timeout():
	queue_free()
