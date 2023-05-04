extends Node2D


func _process(delta):
	if Global.vacuum_active == false:
		queue_free()
	
	self.rotation_degrees = Global.ply_rotations 
	self.position = Global.bullet_pos


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.Vac()


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.Vac_stop()
