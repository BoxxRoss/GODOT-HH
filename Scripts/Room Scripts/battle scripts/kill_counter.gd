extends Label
var deathcheck = false
var highest_score = 0


func _process(_delta):
	self.text = str("Ghosts Vanquished: ",Global.score)

func _on_enemy1_dead_enemy():
	Global.score += 1
	


func _on_KinematicBody2D_player_death():
	Global.last_score = Global.score
	Global.score = 0
	
