extends Node2D

var flare_spawn = preload("res://Projectile/flare.tscn")

	
func _process(delta):
	modulate.a8 -= 4
	if Global.enemy_hit == true:
		queue_free()
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys") or body is TileMap:
		queue_free()
	else:
		queue_free()
		Global.bul_check = false
		var flares = flare_spawn.instance()
		flares.rotation_degrees = rotation_degrees
		flares.position = self.position
		
		get_tree().get_root().call_deferred("add_child", flares)

func _on_Timer_timeout():
	queue_free()



