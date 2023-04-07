extends RigidBody2D

var lightnin_node_static = preload("res://Projectile/lightnin/node/electric_node_static.tscn")

func _process(delta):
	if Global.bul_check == false:
		queue_free()
		spawn_static()
		Global.bul_check = true

func _on_Area2D_body_entered(body):
	if body is TileMap:
		spawn_static()
		queue_free()


func _on_Timer_timeout():
	queue_free()

func spawn_static():
	var static_elec_node = lightnin_node_static.instance()
	static_elec_node.position = self.position
	static_elec_node.rotation_degrees = self.rotation_degrees
	get_tree().get_root().call_deferred("add_child", static_elec_node)
	
