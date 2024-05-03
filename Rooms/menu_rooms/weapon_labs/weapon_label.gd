extends Node

var num

func _process(delta):
	if Global.flamethrower_position == num:
		self.text = ("Slot " + str(num) + ":\nFlame-Thrower")
	elif Global.flamebeam_position == num:
		self.text = ("Slot " + str(num) + ":\nFlame-Beam")
	elif Global.flametrail_position == num:
		self.text = ("Slot " + str(num) + ":\nFlame-Trail")
	elif Global.lightball_position == num:
		self.text = ("Slot " + str(num) + ":\nLightning-Ball")
	elif Global.lightspray_position == num:
		self.text = ("Slot " + str(num) + ":\nLightning-Spray")
	elif Global.lighttrip_position == num:
		self.text = ("Slot " + str(num) + ":\nLightning-Tripwire")
	elif Global.vacuumblast_position == num:
		self.text = ("Slot " + str(num) + ":\nVacuum-Blast")
	elif Global.vacuumbomb_position == num:
		self.text = ("Slot " + str(num) + ":\nVacuum-Bomb")
	elif Global.vacuumdeploy_position == num:
		self.text = ("Slot " + str(num) + ":\nVacuum-Deploy")
	else:
		self.text = ("Slot " + str(num) + ":\nNone")
