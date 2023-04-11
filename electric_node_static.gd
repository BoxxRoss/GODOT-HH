extends RigidBody2D

var lazer_node = preload("res://Projectile/lightnin/node/eletric_lazer.tscn")
var limit = 0
var spot = self.global_position
var o_spot
var check = false

signal connect

func _ready():
	pass

func _process(delta):
	if Global.died == true:
		queue_free()
	update()

func _on_node_detection_circle_body_entered(body):
	pass
	
func _on_node_detection_circle_area_entered(area):
	if self == self and limit == 0:
		o_spot = area.global_position
		var spott = self.global_position
		limit = 1
		check = true
		emit_signal("connect", o_spot, spott)
		
		Global.update(o_spot)
func _draw():
		if check == true:
			draw_line(Vector2.ZERO,to_local(o_spot),Color(0,0,255))




