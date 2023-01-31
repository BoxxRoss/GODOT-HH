extends Node2D



	
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


func _on_Timer_timeout():
	queue_free()



