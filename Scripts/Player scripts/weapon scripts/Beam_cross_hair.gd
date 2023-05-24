extends Node2D


	

func _physics_process(_delta):
	self.position = get_global_mouse_position()
	
	if Global.beam_active == false:
		queue_free()
