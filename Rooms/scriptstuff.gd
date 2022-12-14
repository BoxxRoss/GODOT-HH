extends Node2D

var borders = Rect2(1, 1, 152,92)

const Player = preload("res://player/KinematicBody2D.tscn")


onready var tileMap = $TileMap2

var enemy_1 = preload("res://enemy1.tscn")


func _ready():
	randomize()
	generate_level()
	
	
func generate_level():
	var walker = Walker.new(Vector2(76,41), borders)
	var map = walker.walk(12000)

	var player = Player.instance()
	add_child(player)
	player.position = map.front()*32

	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()

func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
	var instance = enemy_1.instance()
	
	instance.global_position = $KinematicBody2D/Path2D/PathFollow2D/Position2D.global_position
	add_child(instance)
