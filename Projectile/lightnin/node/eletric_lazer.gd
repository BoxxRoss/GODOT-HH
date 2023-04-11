extends Node2D

onready var beam = $Beam
onready var end = $End
onready var rayCast2D = $RayCast2D




	
func _physics_process(delta):
	if Global.died == true:
		queue_free()
	
	

func _on_electric_node_static_connect(o_spot,spott):
	self.global_position = spott
	end.global_position = o_spot
	beam.region_rect.end.x = end.position.length()
