extends Node

var Playerss = preload("res://player/playernew.tscn")
var enemy_score = 0
var score = 0
var highest_score = 0
var last_score = 0
func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
