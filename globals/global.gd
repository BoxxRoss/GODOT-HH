extends Node

var switch = false

#weapon control
var flame_thrower_activcated = false
var flame_trail_activated = false
var flame_beam_activated = false

var lightning_ball_activated = false
var lightning_spray_activated = false
var lightning_tripwire_activated = false

var vacuum_blast_activated = false
var vacuum_bomb_activated = false
var vacuum_deploy_activated = false

var flamethrower_position = 0
var flametrail_position = 2
var flamebeam_position = 0

var lightspray_position = 3
var lighttrip_position = 0
var lightball_position = 0

var vacuumblast_position = 1
var vacuumbomb_position = 0
var vacuumdeploy_position = 0

var what_was_picked = 0

var time_to_go_back = false
#enemy
var enemy_hit_by_lightnin = false

#random vars
var enemy_test = 0

#bullets
var player_global_position 
var player_position 

var fire_check = true
var beam_active = false
var vacuum_active = false

var charge_balls = 0
var ply_rotations = Vector2()
var bullet_pos = Vector2()
var fired = false
var bul_check = true
var bul_vac_check = true
var Playerss = preload("res://player/playernew.tscn")

var place 

var enemies_in_Vac = 0
#score
var enemy_score = 0
var score = 0
var highest_score = 0
var last_score = 0
var kill_count = 0

#level ups
var stamina_multi = 1

var died = false

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func _process(delta):

	if time_to_go_back == true:
		get_tree().change_scene("res://Rooms/menu_rooms/weapons_lab.tscn")
		time_to_go_back = false

func update(o_spot):
	place = o_spot
	

