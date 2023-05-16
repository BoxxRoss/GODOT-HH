extends RigidBody2D

var vac_bomb_static = preload("res://Projectile/Vacuum/vacuum_bomb/vac_bomb_static.tscn")
var damage = 1

func _process(delta):
	if Global.bul_vac_check == false:
		queue_free()
		spawn_vac_static_bomb()
		Global.bul_vac_check = true

func _on_Area2D_body_entered(body):
	if body is TileMap:
		spawn_vac_static_bomb()
		queue_free()
	if body.is_in_group("enemys"):
		body.onhit(damage)

func _on_Timer_timeout():
	queue_free()

func spawn_vac_static_bomb():
	var vac_bomb_static_instance = vac_bomb_static.instance()
	vac_bomb_static_instance.position = self.position
	vac_bomb_static_instance.rotation_degrees = self.rotation_degrees
	get_tree().get_root().call_deferred("add_child", vac_bomb_static_instance)
