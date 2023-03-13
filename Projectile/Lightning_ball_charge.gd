extends RigidBody2D


var damage = 0.01
var current_charge = Global.charge_balls
var dec_charge = 0.01

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		var weapon_damage = damage
		body.taking_damage(weapon_damage)
		dec_charge += 0.01
	if body is TileMap:
		dec_charge += 0.01
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
		dec_charge -= 0.01
	if body is TileMap:
		dec_charge -= 0.01
		
		
		
func _physics_process(delta):

	scale.x = current_charge
	scale.y = current_charge
	
	current_charge -= dec_charge
	if current_charge <= 0:
		queue_free()



