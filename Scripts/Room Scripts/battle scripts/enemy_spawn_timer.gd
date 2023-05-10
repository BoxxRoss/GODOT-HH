extends Timer



func _on_Node2D_timer_reduce():
	if wait_time > 0.5:
		wait_time = wait_time - 0.00005
	else:
		wait_time = 0.5
