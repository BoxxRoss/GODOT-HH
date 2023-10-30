extends RigidBody2D

var lazer_node = preload("res://Projectile/lightnin/node/eletric_lazer.tscn")
onready var circle_detect = $node_detection_circle/CollisionShape2D
var limit = false
var spot = self.global_position
var o_spot
var check = false

signal connect

func _ready():
	circle_detect.scale.x = 0
	circle_detect.scale.y = 0

func _process(_delta):
	if Global.died == true:
		queue_free()
	update()
	if circle_detect.scale.x and circle_detect.scale.y <= 1:
		circle_detect.scale.x += 0.5
		circle_detect.scale.y += 0.5

func _on_node_detection_circle_body_entered(body):
	pass
	
func _on_node_detection_circle_area_entered(area):
	if limit == false:
		o_spot = area.global_position
		var spott = self.global_position
		limit = true
		check = true
		emit_signal("connect", o_spot, spott)
		
		Global.update(o_spot)
func _draw():
		if check == true:
			draw_line(Vector2.ZERO,to_local(o_spot),Color(0,0,255))




