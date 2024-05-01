extends AnimatedSprite

var selected = false

func _process(delta):
	if Global.flametrail_position != 0:
		self.modulate.a8 = 255
		selected = true
		





func _on_flametrail_mouse_entered():
	self.modulate.a8 = 255


func _on_flametrail_mouse_exited():
	if selected == false:
		self.modulate.a8 = 200
