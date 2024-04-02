extends Node2D

onready var left_boot = preload("res://player/boot/boot_print.png")
onready var right_boot = preload("res://player/boot/right_boot_print.png")

onready var particle = get_node("Particles2D")

func _ready():
	particle.emitting = true
	if Global.selected_boot_num == 1:
		$Boot.set_texture(right_boot)
	if Global.selected_boot_num == 0:
		$Boot.set_texture(left_boot)
func _process(delta):
	self.modulate.a8 -= 2.5
	if self.modulate.a8 <= 0:
		queue_free()
		
