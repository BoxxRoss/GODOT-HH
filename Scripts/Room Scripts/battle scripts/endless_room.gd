extends "res://Scripts/Room Scripts/battle scripts/scriptstuff.gd"

var playerspot = Vector2(0,0)
var spawn_options = [1]
var enemy_options = [1]
var walker_intensity = 15000

var enemy_limit = 250

var rand_value 
var rand_time = null

var swarm = false

var lowest_time : float = 50.0
var longest_time : float = 90.0

func _ready():
	randomize()
	
	rand_time = rand_range(lowest_time,longest_time)


	rand_value = spawn_options[randi() % spawn_options.size()]
	if rand_value == 1:
		playerspot = Vector2(1536,1280)
		end_spot = Vector2(11200,5952)
		
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
	print($swarm_timer.wait_time)
	
	Rand_enemy_choice()
	
func Rand_enemy_choice():
	for i in range(6):
		var rand_enemy_choice_float = rand_range(1,2.999)
		var rand_enemy_choice_int = int(rand_enemy_choice_float)
		print(rand_enemy_choice_int)
		enemy_options.insert(i + 1,rand_enemy_choice_int)
		print(enemy_options)
	
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
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func _on_enemy_spawn_timer_timeout():
	var rand_enemy_value = enemy_options[randi() % enemy_options.size()]
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	$KinematicBody2D/Path2D/PathFollow2D.offset = rng.randi_range(0, 1750)
	
	var instance = enemy_1.instance()
	var slim_instance = enemy_slim.instance()
	var horse_instance = enemy_horse.instance()
	
	var enemy_chosen = null
	
	if rand_enemy_value == 1:
		enemy_chosen = instance
	if rand_enemy_value == 2:
		enemy_chosen = slim_instance
	if rand_enemy_value == 3:
		enemy_chosen = horse_instance
	
	
	
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
	var rand_enemy_value = enemy_options[randi() % enemy_options.size()]
	
	var instance = enemy_1.instance()
	var slim_instance = enemy_slim.instance()
	var horse_instance = enemy_horse.instance()
	if rand_value == 1:
		rand_1_x = rand_range(2000,12000)
		rand_1_y = rand_range(2000,6000)
	
	var enemy_chosen = null
	
	if rand_enemy_value == 1:
		enemy_chosen = instance
	if rand_enemy_value == 2:
		enemy_chosen = slim_instance
	if rand_enemy_value == 3:
		enemy_chosen = horse_instance
	
	
	
	enemy_chosen.position = Vector2(rand_1_x,rand_1_y)
	if count != 200:
		add_child(enemy_chosen)
		enemy_chosen.unaware = true
		count = count + 1



func _on_swarm_timer_timeout():
	randomize()
	print("SWARM TIME")
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
	
