extends RigidBody2D

var scaler_sprite_x : float = 0.00
var scaler_sprite_y : float = 0.00

var scaler_coll_x : float = 0
var scaler_coll_y : float = 0

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
	large_check = true
	yield(get_tree().create_timer(0.1), "timeout")
	large_check = true
	
	linear_damp = rand_damp
		
	yield(get_tree().create_timer(0.7), "timeout")
	queue_free()
func _process(delta):
	if $Sprite.modulate.a8 < 0:
		self.queue_free()
		
	if large_check and timer_check == false:
		scaler_sprite_x = lerp(scaler_sprite_x, 0.2,0.18)
		scaler_sprite_y = lerp(scaler_sprite_y, 0.2,0.18)
				
		scaler_coll_x = lerp(scaler_coll_x, 2.5,0.18)
		scaler_coll_y = lerp(scaler_coll_y, 2.5,0.18)
		
		$Area2D/CollisionShape2D.scale = Vector2(scaler_coll_x,scaler_coll_y)
		$CollisionShape2D.scale = Vector2(scaler_coll_x,scaler_coll_y)
		
		$Sprite.scale = Vector2(scaler_sprite_x,scaler_sprite_y)
		
		
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
		

