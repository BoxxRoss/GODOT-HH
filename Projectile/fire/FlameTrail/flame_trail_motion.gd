extends RigidBody2D

var flame_floor = preload("res://Projectile/fire/FlameTrail/floor_fire.tscn")
var static_flame_floor = preload("res://Projectile/fire/FlameTrail/fire_trail_static.tscn")
var check = 0

func _on_Timer_timeout():
	queue_free()

func _process(delta):
	if Global.fire_check == false:
		queue_free()
		spawn_static_floor()
		Global.fire_check = true
	if check != 1:
		check += 1
	else:
		spawn_floor_fire()
		check -= 1

func _on_Area2D_body_entered(body):
	if body is TileMap:
		Global.fire_check = false

func spawn_static_floor():
	var static_fire_floor_instance = static_flame_floor.instance()
	static_fire_floor_instance.global_position = self.global_position
	static_fire_floor_instance.global_rotation = self.global_rotation
	get_tree().get_root().call_deferred("add_child", static_fire_floor_instance)

func spawn_floor_fire():
	var fire_floor_instance = flame_floor.instance()
	fire_floor_instance.global_position = self.global_position
	fire_floor_instance.global_rotation = self.global_rotation
	get_tree().get_root().call_deferred("add_child", fire_floor_instance)


