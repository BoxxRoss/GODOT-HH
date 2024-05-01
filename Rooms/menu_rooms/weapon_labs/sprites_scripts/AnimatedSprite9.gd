extends AnimatedSprite


var selected = false

func _process(delta):
	if Global.vacuumdeploy_position != 0:
		self.modulate.a8 = 255
		selected = true

func _on_vacuum_deploy_mouse_entered():
	self.modulate.a8 = 255


func _on_vacuum_deploy_mouse_exited():
	if selected == false:
		self.modulate.a8 = 155
