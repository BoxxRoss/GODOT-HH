extends AnimatedSprite

var selected = false

func _process(delta):
	if Global.flamebeam_position != 0:
		self.modulate.a8 = 255
		selected = true
		


func _on_heatbeam_mouse_exited():
	if selected == false:
		self.modulate.a8 = 200


func _on_heatbeam_mouse_entered():
	self.modulate.a8 = 255

