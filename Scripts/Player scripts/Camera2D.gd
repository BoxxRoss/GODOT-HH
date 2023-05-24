extends Camera2D

var spd = 0.1
var radius_req = 150
var timerss = 100


var min_zoom = Vector2(0.100001, 0.100001)

var zoomed = false
var zoom_speed = Vector2(0.35, 0.35)
var des_zoom = zoom

func _process(_delta):
	zoom = lerp(zoom, des_zoom, .05)


func _input(event):

	if event is InputEventMouseMotion:
		var delta = event.relative
		var mouse_position = get_global_mouse_position()
		var mouse_delta = mouse_position - global_position
		if (mouse_delta.length() >= radius_req):
			if timerss != 0:
				self.position += (mouse_delta / radius_req) * spd * delta
				timerss = timerss - 1
		else:
			self.position = Vector2(0,0)
			timerss = 100
	

func _on_KinematicBody2D_camera_zoom():
	if des_zoom > min_zoom and zoomed == false:
		zoomed = true
		des_zoom -= zoom_speed
		
			
		



func _on_KinematicBody2D_camera_zoom_out():
	des_zoom = Vector2(0.45, 0.45)
	zoomed = false




