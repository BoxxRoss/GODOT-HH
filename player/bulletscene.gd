extends RigidBody2D


func _on_bulletscene_body_entered(body):
	if body.is_in_group("enviroment"):
		queue_free()
