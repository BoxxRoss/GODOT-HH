extends Node2D

func button_click():
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.stop()
func stop_playing():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer2.play()

