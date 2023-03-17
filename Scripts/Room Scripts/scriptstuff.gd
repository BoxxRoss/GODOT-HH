extends Node2D

var borders = Rect2(1, 1, 132,82)
onready var tileMap = $TileMap2
signal timer_reduce

var enemy_1 = preload("res://Enemys/enemy1old.tscn")
var enemy_slim = preload("res://Enemys/enemy_slim.tscn")
var Player = preload("res://player/playernew.tscn")

func _ready():
	if SaveScript.is_file_there():
		Global.highest_score = SaveScript.load_val()
		emit_signal("scoreupdate")
	randomize()

func _input(event):
	if event.is_action_pressed("ui_page_up"):
		get_tree().reload_current_scene()

func _process(delta):
	emit_signal("timer_reduce")

func _on_world_tree_exiting() -> void:
	SaveScript.save_val(Global.highest_score)

	
