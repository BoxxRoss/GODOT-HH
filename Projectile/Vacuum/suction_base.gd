extends Node2D


func _process(delta):
	if Global.vacuum_active == false:
		queue_free()
	
	self.rotation_degrees = Global.ply_rotations 
	self.position = Global.bullet_pos
