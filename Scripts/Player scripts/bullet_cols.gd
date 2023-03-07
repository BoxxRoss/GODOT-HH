extends Node2D
"""
var flare_spawn = preload("res://Projectile/flare.tscn")
var flare_skitter_speed = 3

	
func _process(delta):
	modulate.a8 -= 4

	


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys") or body is TileMap:
		queue_free()
		print("crosshair gone!")
		
	else:
	
		queue_free()
		Global.bul_check = false
		var flares = flare_spawn.instance()
		flares.rotation_degrees = rotation_degrees
		flares.position = self.position
		get_tree().get_root().call_deferred("add_child", flares)
		print ("flare landed")

func _on_Timer_timeout():
	queue_free()
		

"""
