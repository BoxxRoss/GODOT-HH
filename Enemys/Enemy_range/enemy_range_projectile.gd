extends RigidBody2D



func _on_Area2D_body_entered(body):

	if body is TileMap:
		queue_free()
	if "KinematicBody2D" in body.name:
		queue_free()
		Global.score -= 1
		body.take_a_hit()


func _on_Timer_timeout():
	queue_free()
