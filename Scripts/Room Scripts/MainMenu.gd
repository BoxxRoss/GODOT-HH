extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://Rooms/scriptstuff.tscn")



func _on_Quitbutton_pressed():
	get_tree().quit()
