extends Camera2D



func _on_KinematicBody2D_camera_zoom():
	zoom = Vector2(0.2, 0.2)



func _on_KinematicBody2D_camera_zoom_out():
	zoom = Vector2(0.7, 0.7)
