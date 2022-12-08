extends Camera2D

var min_zoom = Vector2(0.200001, 0.200001)
var max_zoom = Vector2(0.7, 0.7)
var zoom_speed = Vector2(0.5, 0.5)
var des_zoom = zoom


func _process(delta):
	zoom = lerp(zoom, des_zoom, .05)

	
func _on_KinematicBody2D_camera_zoom():
	if des_zoom > min_zoom:
		des_zoom -= zoom_speed
		
		



func _on_KinematicBody2D_camera_zoom_out():
	des_zoom = Vector2(0.7, 0.7)
