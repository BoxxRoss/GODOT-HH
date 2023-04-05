extends Control



func _on_KinematicBody2D_stamina_change(stamina):
	$TextureProgress.value = stamina

func _on_KinematicBody2D_damage_taken(health):
	$TextureProgress2.value = health




	



