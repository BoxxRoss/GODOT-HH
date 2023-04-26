extends Node2D

const MAX_LENGTH = 2000

var beam_damage = 0.75
var point_damage = 2
var ignite_point = 2.5
var ignite_body = 0.25

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
	$Beam/Area2Dbeam/CollisionShape2D.shape.extents = Vector2(end.position.length()/2,10)
	$Beam/Area2Dbeam/CollisionShape2D.position = Vector2(end.position.length()/2,0)




func _on_Area2D_body_entered(body):
	if body.is_in_group("enemys"):
		var weapon_damage = point_damage
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite_point)

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()	

func _on_Area2Dbeam_body_entered(body):
	if body.is_in_group("enemys"):
		var weapon_damage = beam_damage
		body.taking_damage(weapon_damage)
		body.being_ignited(ignite_body)

func _on_Area2Dbeam_body_exited(body):
	if body.is_in_group("enemys"):
		body.taking_damage_stop()	
		body.not_being_ignited()

