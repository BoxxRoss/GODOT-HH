extends RigidBody2D
var die_out = false



func _process(delta):
	if die_out == false and $Light2D.energy < 2:
		$Light2D.energy += 0.01
	
	if die_out == true and $Light2D.energy >= 0:
		$Light2D.energy -= 0.01
		
		
func _on_Timer_timeout():
	die_out = true

	
