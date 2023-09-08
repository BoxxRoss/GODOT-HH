extends Particles2D

func _physics_process(delta):
	self.position = Global.bullet_pos
	self.look_at(get_global_mouse_position())

