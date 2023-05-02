extends Node

var num

func _process(delta):
	if Global.flamethrower_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Flame-Thrower")
	elif Global.flamebeam_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Flame-Beam")
	elif Global.flametrail_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Flame-Trail")
	elif Global.lightball_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Lightning-Ball")
	elif Global.lightspray_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Lightning-Spray")
	elif Global.lighttrip_position == num:
		self.text = ("Weapon in slot " + str(num) + ": Lightning-Tripwire")
	else:
		self.text = ("Weapon in slot " + str(num) + ": None")
