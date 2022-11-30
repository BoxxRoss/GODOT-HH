extends RigidBody2D



func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		queue_free()



func _on_Timer_timeout():
	queue_free()


func _on_bullets_body_entered(body):
	if body is TileMap:
		queue_free()
