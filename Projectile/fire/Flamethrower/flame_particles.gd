extends RigidBody2D


var weapon_damage = 0.1
var ignite = 0.05
var timer_check = false
var passthrough_threshold = 0.25 + Global.upgrade5_effect




func _ready():
	var rand_rotation = rand_range(100,200)
	
	
	var rand_time = rand_range(0.3,0.5)
	var rand_angle = rand_range(-360,360)
	var rand_scale_x = rand_range(0.2,0.7)
	var rand_scale_y = rand_range(0.2,0.7)
	$Timer.wait_time = rand_time
	$Timer.start()
	self.rotation_degrees = rand_angle
	self.scale.x = rand_scale_x
	self.scale.y = rand_scale_y


func _process(delta):

	if timer_check == true:
		weapon_damage = lerp(weapon_damage,0,0.01)
		ignite = lerp(weapon_damage,0,0.01)
		$Sprite.scale.x = lerp($Sprite.scale.x, 0, 0.15)
		$Sprite.scale.y = lerp($Sprite.scale.y, 0, 0.15)
		$Sprite.modulate.a8 -= 10
		$Sprite.modulate = Color(1.5,0.0,0.0,1.0)

	if $Sprite.scale == Vector2(0,0):
		queue_free()


	

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
		

