extends AnimatedSprite

var selected = false

func _process(delta):
	if Global.vacuumbomb_position != 0:
		self.modulate.a8 = 255
		selected = true
		self.speed_scale = 1.5


func _on_vacuum_bomb_mouse_entered():
	self.modulate.a8 = 255
	self.speed_scale = 1.5

func _on_vacuum_bomb_mouse_exited():
	if selected == false:
		self.modulate.a8 = 155
		self.speed_scale = 1
