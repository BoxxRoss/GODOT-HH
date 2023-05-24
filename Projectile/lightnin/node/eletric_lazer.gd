extends Node2D

onready var beam = $Beam
onready var end = $End
onready var rayCast2D = $RayCast2D

var damage = 0.5
var shock = 3

func _physics_process(_delta):
	if Global.died == true:
		queue_free()
	
func _on_electric_node_static_connect(o_spot,spott):
	self.global_position = spott
	end.global_position = o_spot
	beam.region_rect.end.x = end.position.length()
	beam.rotation = beam.get_angle_to(o_spot) 
	$Beam/Area2Dbeam/CollisionShape2D.shape.extents = Vector2(end.position.length()/2,10)
	$Beam/Area2Dbeam/CollisionShape2D.position = Vector2(end.position.length()/2,0)


func _on_Area2Dbeam_body_entered(body):
	if body.is_in_group("enemys"):
		var weapon_damage = damage
		body.taking_damage(weapon_damage)
		body.shock(shock)

func _on_Area2Dbeam_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()
