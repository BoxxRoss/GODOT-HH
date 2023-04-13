extends RigidBody2D

var flame_hurt = 3

func _process(delta):
	modulate.a8 -= 6
	if modulate.a8 <= 0:
		queue_free()
func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		var rand_chance_fire_passthrough = rand_range(0,2)
		
		var weapon_damage = flame_hurt
		body.taking_damage(weapon_damage)
		if rand_chance_fire_passthrough <= 1:
			queue_free()

	if body is TileMap:
		queue_free()

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
