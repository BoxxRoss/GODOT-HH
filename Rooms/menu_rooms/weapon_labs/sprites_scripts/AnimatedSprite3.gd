extends AnimatedSprite

var selected = false

func _process(delta):
	if Global.flametrail_position != 0:
		self.modulate.a8 = 255
		selected = true
		self.speed_scale = 1.5
		self.scale = Vector2(1.2,1.2)
		
func _on_flametrail_mouse_entered():
	self.modulate.a8 = 255
	self.speed_scale = 1.5
	self.scale = Vector2(1.2,1.2)

func _on_flametrail_mouse_exited():
	if selected == false or Global.flamethrower_position == 0:
		self.modulate.a8 = 100
		self.speed_scale = 1
		self.scale = Vector2(1,1)
