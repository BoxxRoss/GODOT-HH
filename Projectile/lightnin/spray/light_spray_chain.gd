extends RigidBody2D

var damage = 5

var sprite_var_1 = preload("res://Projectile/lightnin/lightning_spray_varient1.png")
var sprite_var_2 = preload("res://Projectile/lightnin/lightning_spray_varient2.png")
var sprite_var_3 = preload("res://Projectile/lightnin/lightning_spray_varient3.png")
var sprite_var_4 = preload("res://Projectile/lightnin/lightning_spray_varient4.png")
var sprite_var_5 = preload("res://Projectile/lightnin/lightning_spray_varient5.png")



onready var cicle_detect = $detect_circe_2D/CollisionShape2D
onready var spray_sprite = get_node("TinyBullet")

var sprite_options = [1,2,3,4,5]
var rand_angle = rand_range(-50,50)
	

func _process(delta):
	randomize()
	if modulate.a8 <= 0:
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
	modulate.a8 -= 100


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.onhit(damage)
		var done = false
		cicle_detect.position = body.global_position
		if cicle_detect.scale.x and cicle_detect.scale.y < 3 and done == false:
			cicle_detect.scale.x = 3
			cicle_detect.scale.y = 3
			done = true

			
		


func _on_detect_circe_2D_body_entered(body):
	if body.is_in_group("enemys"):
		print("coolio2")
		body.onhit(damage)
		
