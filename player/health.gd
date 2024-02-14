extends Control


onready var health = get_node("health_itself")
var healths = 5
var health_string = str(healths)


func _ready():
	health.text = "5"

func _on_KinematicBody2D_damage_taken():
	healths -= 1
	health_string = str(healths)
	health.text = health_string
