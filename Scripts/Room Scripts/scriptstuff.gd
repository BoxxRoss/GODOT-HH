extends Node2D

var borders = Rect2(1, 1, 132,82)



var Player = preload("res://player/playernew.tscn")

onready var tileMap = $TileMap2
signal timer_reduce
var enemy_1 = preload("res://Enemys/enemy1.tscn")
var options = [1,2,3,4,5]
var playerspot = Vector2(0,0)

func _ready():
	if SaveScript.is_file_there():
		Global.highest_score = SaveScript.load_val()
		emit_signal("scoreupdate")
	randomize()
	var rand_value = options[randi() % options.size()]
	if rand_value == 1:
		playerspot = Vector2(1408,1120)
	if rand_value == 2:
		playerspot = Vector2(2592, 4832)
	if rand_value == 3:
		playerspot = Vector2(6240, 1440)
	if rand_value == 4:
		playerspot = Vector2(7840, 4864)
	if rand_value == 5:
		playerspot = Vector2(4192, 2784)		
	generate_level()
	

	
func generate_level():
	var walker = Walker.new(Vector2(76,41), borders)
	var map = walker.walk(13000)	
	

	var player = Player.instance()
	add_child(player)
	player.position = playerspot


	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)
	
	
"""
func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
"""

func _process(delta):
	emit_signal("timer_reduce")

	

	
	
	
	
func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
	var instance = enemy_1.instance()
	
	instance.global_position = $KinematicBody2D/Path2D/PathFollow2D/Position2D.global_position
	if Global.enemy_score != 100:
		add_child(instance)
		Global.enemy_score += 10



func _on_world_tree_exiting() -> void:
	SaveScript.save_val(Global.highest_score)

	
