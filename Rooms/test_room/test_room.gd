extends "res://Scripts/Room Scripts/battle scripts/scriptstuff.gd"

var playerspot = Vector2(0,0)
var spawn_options = [1]
var enemy_options = [6]
var walker_intensity = 0


func _ready():
	randomize()

	var rand_value = spawn_options[randi() % spawn_options.size()]
	if rand_value == 1:
		playerspot = Vector2(640,320)
		end_spot = Vector2(700,400)
	if rand_value == 2:
		playerspot = Vector2(3584, 5120)
	if rand_value == 3:
		playerspot = Vector2(10752, 1792)
	if rand_value == 4:
		playerspot = Vector2(11200, 5952)
	if rand_value == 5:
		playerspot = Vector2(5824, 3360)
	generate_level()
	
	
func generate_level():
	var walker = Walker.new(Vector2(76,41), borders)
	var map = walker.walk(walker_intensity)	
	print(playerspot)
	var player = Player.instance()
	add_child(player)
	player.position = playerspot
	
	walker.queue_free()
	
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _process(delta):
	if Global.enemy_test == 1:
		Global.enemy_test -= 1
		var rand_enemy_value = enemy_options[randi() % enemy_options.size()]
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		
		$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
		$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
		
		var base = enemy_1.instance()
		var slim = enemy_slim.instance()
		var horse = enemy_horse.instance()
		var wall_walker = enemy_wall_walker.instance()
		var wimp = enemy_wimp.instance()
		var ene_range = enemy_range.instance()
		
		var enemy_chosen = null
		
		if rand_enemy_value == 1:
			enemy_chosen = base
		if rand_enemy_value == 2:
			enemy_chosen = slim
		if rand_enemy_value == 3:
			enemy_chosen = horse
		if rand_enemy_value == 4:
			enemy_chosen = wall_walker
		if rand_enemy_value == 5:
			enemy_chosen = wimp
		if rand_enemy_value == 6:
			enemy_chosen = ene_range
			
		enemy_chosen.position = get_global_mouse_position()
		if Global.enemy_score != 100:
			add_child(enemy_chosen)
			enemy_chosen.unaware = false
			Global.enemy_score += 10



