extends RigidBody2D

var weapon_damage = 50.0
var shock = 1
var static_floor = 1

var sprite_var_1 = preload("res://Projectile/lightnin/lightning_spray_varient1.png")
var sprite_var_2 = preload("res://Projectile/lightnin/lightning_spray_varient2.png")
var sprite_var_3 = preload("res://Projectile/lightnin/lightning_spray_varient3.png")
var sprite_var_4 = preload("res://Projectile/lightnin/lightning_spray_varient4.png")
var sprite_var_5 = preload("res://Projectile/lightnin/lightning_spray_varient5.png")

var modulate_checker = false

onready var spray_sprite = get_node("TinyBullet")

var sprite_options = [1,2,3,4,5]
var rand_angle = rand_range(-30,30)
	

func _process(delta):
	randomize()
	self.rotation_degrees = Global.ply_rotations + rand_angle
	self.position = Global.bullet_pos
	if modulate.a8 <= 0:
		queue_free()
	if modulate_checker == true and modulate.a8 >= 0:
		modulate.a8 -= 20

func _ready():
	disable()
	
	var rand_appear_time = rand_range(0,0.29)
	$appeartimer.wait_time = rand_appear_time
	$appeartimer.start()
	var rand_time = rand_range(0.3,0.5)
	$Timer.wait_time = rand_time
	$Timer.start()
	
	var rand_value = sprite_options[randi() % sprite_options.size()]
	if rand_value == 1:
		spray_sprite.set_texture(sprite_var_1)
	if rand_value == 2:
		spray_sprite.set_texture(sprite_var_2)
	if rand_value == 3:
		spray_sprite.set_texture(sprite_var_3)
	if rand_value == 4:
		spray_sprite.set_texture(sprite_var_4)		
	if rand_value == 5:
		spray_sprite.set_texture(sprite_var_5)		
		
		
		
func _on_Timer_timeout():
	modulate_checker = true


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.taking_damage(weapon_damage)
		body.shock(shock)
		body.static_floor_charge(static_floor)
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()	

func disable():
	$TinyBullet.visible = false
	$Area2D/external_collision.disabled = true
	$Light2D.enabled = false
	$CollisionShape2D.disabled = true
	
func enable():
	$TinyBullet.visible = true
	$Area2D/external_collision.disabled = false
	$Light2D.enabled = true
	$CollisionShape2D.disabled = false


func _on_appeartimer_timeout():
	enable()



