extends RigidBody2D




func _on_Area2D_body_entered(body):
	if "KinematicBody2D" in body.name:
		Global.level_complete = true
