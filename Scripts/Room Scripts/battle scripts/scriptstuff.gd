extends Node2D

var borders = Rect2(1, 1, 132,82)
onready var tileMap = $TileMap2

var end_spot = Vector2(0,0)
var can_start = false
var time = 1

#where enemys are loaded in for the other maps to do their work
var enemy_1 = preload("res://Enemys/enemy1old.tscn")
var enemy_slim = preload("res://Enemys/enemy_slim.tscn")
var enemy_horse = preload("res://Enemys/Horse/enemy_horse.tscn")
var enemy_wall_walker = preload("res://Enemys/enemy_wall_walker.tscn")

var Player = preload("res://player/playernew.tscn")

var end_point = preload("res://Rooms/battle_rooms/escape_item.tscn")

var Tile_preset_1 = preload("res://Rooms/battle_rooms/TILEMAP_PRESETS/TILEMAP_PRESET_1.tscn")
var Tile_preset_2 = preload("res://Rooms/battle_rooms/TILEMAP_PRESETS/TILEMAP_PRESET_2.tscn")
var Tile_preset_3 = preload("res://Rooms/battle_rooms/TILEMAP_PRESETS/TILEMAP_PRESET_3.tscn")
var Tile_preset_4 = preload("res://Rooms/battle_rooms/TILEMAP_PRESETS/TILEMAP_PRESET_4.tscn")
var Tile_preset_5 = preload("res://Rooms/battle_rooms/TILEMAP_PRESETS/TILEMAP_PRESET_5.tscn")

func _ready():
	if SaveScript.is_file_there():
		Global.highest_score = SaveScript.load_val()
		emit_signal("scoreupdate")
	randomize()
	
	can_start = false
	yield(get_tree().create_timer(time), "timeout")
	can_start = true
	
	spawn_end()

func _input(event):
	if event.is_action_pressed("ui_page_up"):
		get_tree().reload_current_scene()



func _on_world_tree_exiting() -> void:
	SaveScript.save_val(Global.highest_score)

func spawn_end():
	var end_point_instance = end_point.instance()
	end_point_instance.global_position = end_spot
	get_tree().get_root().call_deferred("add_child", end_point_instance)

