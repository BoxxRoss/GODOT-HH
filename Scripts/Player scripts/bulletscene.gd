extends RigidBody2D

var flare_spawn = preload("res://Projectile/flare.tscn")

func _process(delta):
	if Global.bul_check == false:
		queue_free()
		Global.bul_check = true

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		pass




func _on_Timer_timeout():
	queue_free()






func _on_bullets_body_entered(body):
	if body is TileMap:
		var flares = flare_spawn.instance()
		flares.rotation_degrees = rotation_degrees
		flares.position = self.position
		get_tree().get_root().call_deferred("add_child", flares)
		queue_free()
