extends Node2D


onready var particle = get_node("Particles2D")

func _ready():
	$Particles2D.emitting = true
	
func _process(delta):
	self.modulate.a8 -= 5
