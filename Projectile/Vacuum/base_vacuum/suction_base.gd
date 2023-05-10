extends Node2D




func _process(delta):
	if Global.vacuum_active == false:
		queue_free()
	
	self.rotation_degrees = Global.ply_rotations 
	self.position = get_global_mouse_position()


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		Global.enemies_in_Vac += 1
		body.Vac()
		


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		Global.enemies_in_Vac = 0
		body.Vac_stop()
		
