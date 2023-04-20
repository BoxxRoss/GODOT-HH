extends RigidBody2D

var flame_hurt = 2
var timer_check = false

func _ready():
	var rand_time = rand_range(0.45,0.6)
	$Timer.wait_time = rand_time
	$Timer.start() 

func _process(delta):
	if timer_check == true:
		modulate.a8 -= 20
	if modulate.a8 <= 0:
		queue_free()
func _on_Timer_timeout():
	timer_check = true


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
