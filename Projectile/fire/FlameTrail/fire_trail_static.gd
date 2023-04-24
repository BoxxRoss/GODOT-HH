extends Node2D

onready var heat_circle = get_node("Area2D")
var weapon_gone = false
var weapon_damage = 1.5
var ignite = 1

func _ready():
	heat_circle.modulate.a8 = 255
	heat_circle.scale.x = 0
	heat_circle.scale.y = 0

func _process(delta):
	if weapon_gone == false:
		if heat_circle.scale.x and heat_circle.scale.y <= 4 and heat_circle.modulate.a8 >= 0:
			heat_circle.scale.x += 0.1
			heat_circle.scale.y += 0.1
			heat_circle.modulate.a8 -= 10
		else:
			heat_circle.scale.x = 0
			heat_circle.scale.y = 0
			heat_circle.modulate.a8 = 255


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite)


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
		body.not_being_ignited()

func _on_Timer_timeout():
	if weapon_gone == false:
		heat_circle.queue_free()
		weapon_gone = true


func _on_Timer2_timeout():
	queue_free()
