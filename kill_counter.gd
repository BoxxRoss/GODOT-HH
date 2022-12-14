extends Label


func _process(delta):
	self.text = str("Ghosts Vanquished: ",Global.score)

func _on_enemy1_dead_enemy():
	Global.score += 1
	
