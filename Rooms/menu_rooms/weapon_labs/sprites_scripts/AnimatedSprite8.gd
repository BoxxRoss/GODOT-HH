extends AnimatedSprite

var selected = false

func _process(delta):
	if Global.vacuumbomb_position != 0:
		self.modulate.a8 = 255
		selected = true


func _on_vacuum_bomb_mouse_entered():
	self.modulate.a8 = 255


func _on_vacuum_bomb_mouse_exited():
	if selected == false:
		self.modulate.a8 = 155

