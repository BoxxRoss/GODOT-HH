extends RigidBody2D


func _process(delta):
	modulate.a8 -= 4

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys") or body is TileMap:
		queue_free()
		
	else:
		Global.bul_check = false
		queue_free()
		print("ready for landing")
