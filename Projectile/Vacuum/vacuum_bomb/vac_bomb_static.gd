extends RigidBody2D

onready var activated_sprite = preload("res://Projectile/Vacuum/vacuum_bomb/Sprite-00012.png") 
onready var bomb = get_node("Sprite")

func _on_Timer_timeout():
	$Area2D/CollisionShape2D.disabled = false
	bomb.set_texture(activated_sprite)
	$Light2D.energy = 1

	


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.stuck_in_vac_bomb(global_position)


func _on_Timer2_timeout():
	$Area2D/CollisionShape2D.disabled = true
	$Light2D.energy = 0

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.unstuck_in_vac_bomb()
