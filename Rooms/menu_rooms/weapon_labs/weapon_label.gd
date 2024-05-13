extends Node

var num

func _process(delta):
	if Global.flamethrower_position == num:
		self.text = (str(num) + ":Flame-Thrower")
	elif Global.flamebeam_position == num:
		self.text = (str(num) + ":Flame-Beam")
	elif Global.flametrail_position == num:
		self.text = (str(num) + ":Flame-Trail")
	elif Global.lightball_position == num:
		self.text = (str(num) + ":Lightning-Ball")
	elif Global.lightspray_position == num:
		self.text = (str(num) + ":Lightning-Spray")
	elif Global.lighttrip_position == num:
		self.text = (str(num) + ":Lightning-Tripwire")
	elif Global.vacuumblast_position == num:
		self.text = (str(num) + ":Vacuum-Blast")
	elif Global.vacuumbomb_position == num:
		self.text = (str(num) + ":Vacuum-Bomb")
	elif Global.vacuumdeploy_position == num:
		self.text = (str(num) + ":Vacuum-Deploy")
	else:
		self.text = (str(num) + ":None")
