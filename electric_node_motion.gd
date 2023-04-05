extends RigidBody2D

func _process(delta):
	if Global.bul_check == false:
		queue_free()
		Global.bul_check = true

func _on_Area2D_body_entered(body):
	if body is TileMap:
		queue_free()


func _on_Timer_timeout():
	queue_free()



