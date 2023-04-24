extends RigidBody2D

var weapon_damage = 1


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.taking_damage(weapon_damage)


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()


func _on_Timer_timeout():
	queue_free()
