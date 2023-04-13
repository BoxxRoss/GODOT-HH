extends Node

var switch = false

#enemy
var enemy_hit_by_lightnin = false

#random vars


#bullets
var beam_active = false
var charge_balls = 0
var ply_rotations = Vector2()
var bullet_pos = Vector2()
var fired = false
var bul_check = true
var Playerss = preload("res://player/playernew.tscn")

var place 
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
	

func update(o_spot):
	place = o_spot
	

