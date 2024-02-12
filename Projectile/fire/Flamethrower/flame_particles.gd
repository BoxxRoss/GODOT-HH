extends RigidBody2D


var large_check = false
var weapon_damage = 0.5
var ignite = 0.3
var timer_check = false
var passthrough_threshold = 0.9
var rand_time = rand_range(0.1,0.4)

func _ready():
	var rand_rotation = rand_range(100,200)
	var rand_angle = rand_range(-360,360)
	var rand_damp = rand_range(1,2)
	
	$Timer.wait_time = rand_time
	$Timer.start()
	self.rotation_degrees = rand_angle

	yield(get_tree().create_timer(0.1), "timeout")
	large_check = true
	
	linear_damp = rand_damp
		
func _process(delta):
	if $Sprite.modulate.a8 < 0:
		queue_free()
	if large_check and timer_check == false:
		$Sprite.scale = Vector2(0.14,0.14)
		
func _on_Timer_timeout():
	timer_check = true


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		var rand_chance_fire_passthrough = rand_range(0,1)
		
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite)
		if rand_chance_fire_passthrough >= passthrough_threshold:
			queue_free()

	if body is TileMap:
		queue_free()

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
		body.not_being_ignited()
		

