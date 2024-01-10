extends "res://Scripts/Room Scripts/battle scripts/scriptstuff.gd"



var playerspot = Vector2(0,0)
var spawn_options = [1]
var enemy_options = [1,1,1,1]
var special_enemy_options = [3,3,3]
var walker_intensity_float = null
var walker_intensity = null


var enemy_limit = 150

var rand_value 
var rand_time = null

var swarm = false

var lowest_time : float = 50.0
var longest_time : float = 90.0

var rand_enemy_value = null
var rand_special_enemy_value = null
var tile_selected = null

func _ready():
	randomize()

	walker_intensity_float = rand_range(13000.0, 17000.0)
	walker_intensity = int(walker_intensity_float)
	
	var map_options = [1,2,3,4,5]
	var rand_map_value = map_options[randi() % map_options.size()]

	if rand_map_value == 1:
		var TILE_1 = Tile_preset_1.instance()
		add_child(TILE_1)
		tile_selected = TILE_1
	if rand_map_value == 2:
		var TILE_2 = Tile_preset_2.instance()
		add_child(TILE_2)
		tile_selected = TILE_2
	if rand_map_value == 3:
		var TILE_3 = Tile_preset_3.instance()
		add_child(TILE_3)
		tile_selected = TILE_3
	if rand_map_value == 4:
		var TILE_4 = Tile_preset_4.instance()
		add_child(TILE_4)
		tile_selected = TILE_4
	if rand_map_value == 5:
		var TILE_5 = Tile_preset_5.instance()
		add_child(TILE_5)
		tile_selected = TILE_5
	
	rand_time = rand_range(lowest_time,longest_time)


	rand_value = spawn_options[randi() % spawn_options.size()]
	if rand_value == 1:
		playerspot = Vector2(256,256)
		end_spot = Vector2(12020,6040)
		
	if rand_value == 2:
		playerspot = Vector2(3584,5120)
		end_spot = Vector2(8960,1952)
		
	if rand_value == 3:
		playerspot = Vector2(8960,1952)
		end_spot = Vector2(3584,5120)
		
	if rand_value == 4:
		playerspot = Vector2(11200,5952)
		end_spot = Vector2(1536,1280)
	generate_level()
	$swarm_timer.wait_time = rand_time
	$swarm_timer.start()


	
	Rand_enemy_choice()
	
func Rand_enemy_choice():
	for i in range(6):
		var rand_enemy_choice_float = rand_range(1,2.999)
		var rand_enemy_choice_int = int(rand_enemy_choice_float)

		#enemy_options.insert(i + 1,rand_enemy_choice_int)
		#reenable when its time for enemy pattern's to be randomized
	
func _physics_process(delta):
	if lowest_time <= 30:
		lowest_time = 30
	if longest_time <= 60:
		longest_time = 60
		
func generate_level():

	var walker = Walker.new(Vector2(76,41), borders)
	var map = walker.walk(walker_intensity)	
	
	var player = Player.instance()
	add_child(player)
	player.position = playerspot
	
	walker.queue_free()
	
	for location in map:
		tile_selected.set_cellv(location, -1)
	tile_selected.update_bitmask_region(borders.position, borders.end)



func _on_enemy_spawn_timer_timeout():
	rand_enemy_value = enemy_options[randi() % enemy_options.size()]
	
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
	if Global.enemy_score != enemy_limit and swarm:
		add_child(enemy_chosen)
		enemy_chosen.turn_on_coll()
		Global.enemy_score += 10

func _on_world_timer_reduce():
	pass # Replace with function body.

var rand_1_x = null
var rand_1_y = null

var count : int = 0

func _on_Timer_timeout():
	#spawns idle enemies
	rand_enemy_value = enemy_options[randi() % enemy_options.size()]
	var instance = enemy_1.instance()
	var slim_instance = enemy_slim.instance()
	
	if rand_value == 1:
		rand_1_x = rand_range(2000,12000)
		rand_1_y = rand_range(2000,6000)
	
	var enemy_chosen = null
	
	if rand_enemy_value == 1:
		enemy_chosen = instance
	if rand_enemy_value == 2:
		enemy_chosen = slim_instance


	enemy_chosen.position = Vector2(rand_1_x,rand_1_y)
	if count != 200:
		add_child(enemy_chosen)
		enemy_chosen.unaware = true
		count = count + 1



func _on_swarm_timer_timeout():
	randomize()
	Global.swarm_just_started = true
	

	
	var rand_swarm_time = rand_range(25.0,35.0)
	swarm = true
	yield(get_tree().create_timer(rand_swarm_time), "timeout")
	Global.swarm_just_ended = true
	swarm = false
	
	var rand_buffer_swarm = rand_range(20.0,30.0)
	yield(get_tree().create_timer(rand_buffer_swarm), "timeout")
	lowest_time = lowest_time - 2.5
	longest_time = longest_time - 2.5
	rand_time = rand_range(lowest_time,longest_time)
	$swarm_timer.wait_time = rand_time
	$swarm_timer.start()
	


func _on_special_enemy_spawn_timer_timeout():
	var new_time_float = rand_range(1.0,2.0)
	var new_time = int(new_time_float)
	$special_enemy_spawn_timer.wait_time = new_time
	$special_enemy_spawn_timer.start()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 2000)
	
	rand_special_enemy_value = special_enemy_options[randi() % special_enemy_options.size()]
	var horse_instance = enemy_horse.instance()
	
	var enemy_chosen = null
	
	if rand_special_enemy_value == 3:
		enemy_chosen = horse_instance
		
	
	var enemy_spawn_point = $KinematicBody2D/Path2D/PathFollow2D/Position2D.global_position
	enemy_chosen.position = enemy_spawn_point/1
	
	
	
	if Global.enemy_score != enemy_limit:
		add_child(enemy_chosen)
		Global.enemy_score += 20
