extends Control


func _on_KinematicBody2D_stamina_change(stamina):
	$TextureProgress.value = stamina

func set_percent_value_int(value):
	$TextureProgress.value = value



	
