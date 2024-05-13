extends Label

var picked = 0

func _process(delta):
	self.text = ("Slot currently selected:" + str(picked))

func _on_Control_num_change(num):
	picked = num
