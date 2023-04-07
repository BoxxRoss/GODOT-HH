extends RayCast2D


export (int, 1, 10) var flashes := 3
export (float, 0.0, 3.0) var flash_time := 0.1
export var lightning_jolt: PackedScene = preload("res://Projectile/lightnin/spray/test/jolt.tscn")

var target_point := Vector2.ZERO

func _physics_process(delta) -> void:
	pass
	
func shoot() -> void:
	pass
