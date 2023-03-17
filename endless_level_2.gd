extends "res://Scripts/Room Scripts/scriptstuff.gd"

var playerspot = Vector2(0,0)
var options = [1,2,3,4,5]
var enemy_options = [1,2,2]
var walker_intensity = 17000

func _ready():
	randomize()
	


	var rand_value = options[randi() % options.size()]
	if rand_value == 1:
		playerspot = Vector2(1536,1280)
	if rand_value == 2:
		playerspot = Vector2(3584, 5120)
	if rand_value == 3:
		playerspot = Vector2(8960, 1952)
	if rand_value == 4:
		playerspot = Vector2(11200, 5952)
	if rand_value == 5:
		playerspot = Vector2(5824, 3360)
	generate_level()
	
	
func generate_level():
	var walker = Walker.new(Vector2(76,41), borders)
	var map = walker.walk(walker_intensity)	
	
	var player = Player.instance()
	add_child(player)
	player.position = playerspot
	
	walker.queue_free()
	
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _on_enemy_spawn_timer_timeout():
	var rand_enemy_value = enemy_options[randi() % enemy_options.size()]
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
	
	var instance = enemy_1.instance()
	var slim_instance = enemy_slim.instance()
	var enemy_chosen = null
	
	if rand_enemy_value == 1:
		enemy_chosen = instance
	if rand_enemy_value == 2:
		enemy_chosen = slim_instance
	
	enemy_chosen.position = $KinematicBody2D/Path2D/PathFollow2D/Position2D.global_position
	if Global.enemy_score != 100:
		add_child(enemy_chosen)
		Global.enemy_score += 10





func _on_endless_level_2_timer_reduce():
	pass # Replace with function body.
