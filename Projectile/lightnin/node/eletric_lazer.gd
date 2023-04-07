extends Node2D
func _process(delta):
	if Global.died == true:
		queue_free()
