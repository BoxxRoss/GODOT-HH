extends RigidBody2D

var ignite = 0.5

var weapon_damage = 1
func _ready():
	var rand_time = rand_range(2,2.5)
	$Timer.wait_time = rand_time
	$Timer.start() 

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite)


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
		body.not_being_ignited()


func _on_Timer_timeout():
	queue_free()
