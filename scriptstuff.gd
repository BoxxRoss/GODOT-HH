extends Node2D

func _on_KinematicBody2D_slow_down():
	$enemy1.time_scale = 0.1
