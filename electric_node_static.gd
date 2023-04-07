extends RigidBody2D

var lazer_node = preload("res://Projectile/lightnin/node/eletric_lazer.tscn")
onready var circle = $node_detection_circle/CollisionShape2D

func _on_node_detection_circle_body_entered(body):
	if body == circle:
		print("yipee")
		var eletric_lazer_instance = lazer_node.instance()
		eletric_lazer_instance.position = self.position
		eletric_lazer_instance.rotation = 5
		get_tree().get_root().call_deferred("add_child", eletric_lazer_instance)
	
