extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = false

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if timer:
		if modulate.a8 > 0:
			modulate.a8 -= 10.1
		if $Light2D.energy > 0:
			$Light2D.energy -= 0.05

func _on_Timer_timeout():
	timer = true
