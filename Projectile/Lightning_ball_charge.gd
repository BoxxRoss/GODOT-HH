extends RigidBody2D



var current_charge = Global.charge_balls


func _physics_process(delta):
	scale.x = current_charge
	scale.y = current_charge
	
	current_charge -= 0.005
	if current_charge <= 0:
		queue_free()
