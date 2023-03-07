extends RigidBody2D
var die_out = false



"""




func _process(delta):
	if die_out == false and $Light2D.energy < 1.5:
		$Light2D.energy += 0.01
	
	if die_out == true and $Light2D.energy >= 0:
		$Light2D.energy -= 0.01

	
func _on_Timer_timeout():
	die_out = true


func _on_Area2D_body_entered(body):

	if body.is_in_group("enemys"):
		queue_free()
		print("flare gone!")
"""

