extends RigidBody2D

var weapon_damage = 1.5
var ignite = 0.1
var timer_check = false
var passthrough_threshold = 0.25 + Global.upgrade5_effect

func _ready():
	var rand_time = rand_range(0.4,0.5)
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
		var rand_chance_fire_passthrough = rand_range(0,1)
		
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite)
		if rand_chance_fire_passthrough >= passthrough_threshold:
			("Deleted!")
			queue_free()

	if body is TileMap:
		queue_free()

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		print("stoped")
		body.taking_damage_stop()
		body.not_being_ignited()
