extends RigidBody2D

var flame_hurt = 2

func _process(delta):
	modulate.a8 -= 6
	if modulate.a8 <= 0:
		queue_free()
func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		var weapon_damage = flame_hurt
		body.taking_damage(weapon_damage)
		queue_free()
	if body is TileMap:
		queue_free()

