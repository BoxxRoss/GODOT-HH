extends Node2D

var weapon_damage = 0.5
var modulate_checker = false

func _ready():
	var rand_timer = rand_range(5,10)
	$RigidBody2D/Timer.wait_time = rand_timer
	$RigidBody2D/Timer.start()

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		body.taking_damage(weapon_damage)


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()

func _process(delta):
	if modulate_checker == true and modulate.a8 > 0:
		modulate.a8 -= 20

func _on_Timer_timeout():
	modulate_checker = true
