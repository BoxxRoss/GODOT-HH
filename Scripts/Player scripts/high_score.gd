extends Label



func _process(_delta):
	self.text = str("Highscore: ",Global.highest_score)


func _on_KinematicBody2D_player_death():
	
	if Global.highest_score < Global.last_score:
		Global.highest_score = Global.last_score
