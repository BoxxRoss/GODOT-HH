extends Timer



func _physics_process(delta):
	if wait_time > 0.5:
		wait_time = wait_time - 0.0005
	else:
		wait_time = 0.5


	
