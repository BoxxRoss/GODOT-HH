extends RigidBody2D

var damage = 2.5
var charge = 1

var sprite_var_1 = preload("res://Projectile/lightnin/lightning_spray_varient1.png")
var sprite_var_2 = preload("res://Projectile/lightnin/lightning_spray_varient2.png")
var sprite_var_3 = preload("res://Projectile/lightnin/lightning_spray_varient3.png")
var sprite_var_4 = preload("res://Projectile/lightnin/lightning_spray_varient4.png")
var sprite_var_5 = preload("res://Projectile/lightnin/lightning_spray_varient5.png")


onready var spray_sprite = get_node("TinyBullet")

var sprite_options = [1,2,3,4,5]
var rand_angle = rand_range(-30,30)
	

func _process(delta):
	randomize()
	self.rotation_degrees = Global.ply_rotations + rand_angle
	self.position = Global.bullet_pos
	if $TinyBullet.modulate.a <= 0:
		print("stop")
		queue_free()

	
func _ready():
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
	$TinyBullet.modulate.a = lerp($TinyBullet.modulate.a, -0.1, 0.8)


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.onhit(damage)
		body.charge_boom(charge)
	
			
		




