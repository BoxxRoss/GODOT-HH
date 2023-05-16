extends Node2D

var timer_check = false

var concussive = 1

onready var static_bod = get_node("StaticBody2D")

func _ready():
	rotation_degrees = Global.ply_rotations
	modulate.a8 = 100
	static_bod.scale = Vector2(0.1,0.1)

func _process(delta):
	if timer_check == true:
		modulate.a8 -= 22
	if modulate.a8 <= 0:
		queue_free()
	
	if static_bod.scale < Vector2(1,1):
		static_bod.scale = lerp(static_bod.scale, Vector2(1,1), 0.1)


func _on_Timer_timeout():
	timer_check = true


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		print("gottem")
		body.be_slowed(concussive)
