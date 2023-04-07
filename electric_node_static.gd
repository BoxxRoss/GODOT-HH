extends RigidBody2D

var lazer_node = preload("res://Projectile/lightnin/node/eletric_lazer.tscn")
var limit = 0


func _process(delta):
	if Global.died == true:
		queue_free()
	

func _on_node_detection_circle_body_entered(body):
	pass
	


func _on_node_detection_circle_area_entered(area):
	if self == self and limit == 0:
		var spotti = self.position
		print("yep")
		limit = 1
		var eletric_lazer_instance = lazer_node.instance()
		eletric_lazer_instance.position = self.position
		eletric_lazer_instance.rotation = 5
		get_tree().get_root().call_deferred("add_child", eletric_lazer_instance)

