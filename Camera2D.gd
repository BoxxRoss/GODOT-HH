extends Camera2D

"""
var zoom_min = Vector2(0.2, 0.2)
var zoom_max = Vector2(0.7, 0.7)
var zoom_speed = Vector2(0.2, 0.2)
"""

func _on_KinematicBody2D_camera_zoom():
	zoom = Vector2(0.2,0.2)
	print(zoom)
