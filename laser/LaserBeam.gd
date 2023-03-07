extends Node2D

const MAX_LENGTH = 2000


onready var beam = $Beam
onready var end = $End
onready var rayCast2D = $RayCast2D

func _physics_process(delta):
	
	if Global.beam_active == false:
		queue_free()
	
	self.position = Global.bullet_pos
	var mouse_position = get_local_mouse_position()
	var max_cast_to = mouse_position.normalized() * MAX_LENGTH
	rayCast2D.cast_to = max_cast_to
	if rayCast2D.is_colliding():
		end.global_position = rayCast2D.get_collision_point()
	else:
		end.global_position = rayCast2D.cast_to
	beam.rotation = rayCast2D.cast_to.angle()
	beam.region_rect.end.x = end.position.length()
	



func _on_Area2D2_body_entered(body):
	print("beam hittin")


func _on_Area2D_body_entered(body):
	print("point hitten")
