extends RigidBody2D

var ignite = 0.1

var weapon_damage = 0.2
func _ready():
	var rand_time = rand_range(3.0,4.5)
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
	$Particles2D.speed_scale = 1.5
	yield(get_tree().create_timer(1.0),"timeout")
	$Particles2D.one_shot = true
	$Timer2.start()
	


func _on_Timer2_timeout():
	queue_free()
