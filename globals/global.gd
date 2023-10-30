extends Node

var switch = false


var swarm_just_started = false
var swarm_just_ended = false

#rewards/rescource managment

var upgrade1 = false
var upgrade2 = false
var upgrade3 = false
var upgrade4 = false
var upgrade5 = false
var upgrade6 = false
var upgrade7 = false
var upgrade8 = false
var upgrade9 = false
var upgrade10 = false
var upgrade11 = false
var upgrade12 = false
var upgrade13 = false
var upgrade14 = false
var upgrade15 = false

var loot_soul : int

var upgrade5_effect = 0


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
var flametrail_position = 0
var flamebeam_position = 3

var lightspray_position = 2
var lighttrip_position = 0
var lightball_position = 1

var vacuumblast_position = 0
var vacuumbomb_position = 0
var vacuumdeploy_position = 0

var what_was_picked = 0

var time_to_go_back = false
#enemy
var enemy_hit_by_lightnin = false
var friend_ghost_basic_pos = Vector2(0,0)

#difficulty
var diff_selected = "normal"

var diffiuclty_speed = {"easy":40, "normal":50, "Hard":50 }
var diffiuclty_health = {"easy":50, "normal":60, "Hard":65 }
var diffiuclty_rock_health = {"easy":50, "normal":60, "Hard":65 }

var base_enemy_speed = diffiuclty_speed[diff_selected]
var base_enemy_health = diffiuclty_health[diff_selected]
var base_rock_health = diffiuclty_rock_health[diff_selected]

# friend ghost
var friend_ghost_has_died = false

#random vars
var enemy_test = 0
var level_id_picked = 0

var upgrade_weapon_picked = 0

#bullets
var player_global_position 
var player_global_position_x
var player_global_position_y
var player_position 

var deploy_ghost_count = 0
var deploy_ghost_die = false

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
var unaware_enemy_score = 0
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
	

