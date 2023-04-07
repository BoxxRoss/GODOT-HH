extends Node2D

onready var start = $start
onready var end = $end



func _process(delta):
	if Global.died == true:
		queue_free()


