extends Camera2D

var min_zoom = Vector2(0.100001, 0.100001)
var zoomed = false
var zoom_speed = Vector2(0.35, 0.35)
var des_zoom = zoom


func _process(delta):
	zoom = lerp(zoom, des_zoom, .05)

	
func _on_KinematicBody2D_camera_zoom():
	if des_zoom > min_zoom and zoomed == false:
		zoomed = true
		des_zoom -= zoom_speed
		
			
		



func _on_KinematicBody2D_camera_zoom_out():
	des_zoom = Vector2(0.45, 0.45)
	zoomed = false
